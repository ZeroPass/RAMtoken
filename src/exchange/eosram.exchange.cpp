#include "eosram.exchange.hpp"
#include "dispatch_utils.hpp"
#include "fees.hpp"
#include "log.hpp"
#include "order_timer.hpp"
#include "order_utils.hpp"
#include "trade_tools.hpp"
#include "utils.hpp"

#include "ds/exchange_state.hpp"
#include "ds/memo/memo.hpp"


using namespace eosio;
using namespace eosram;
using namespace eosram::ds;
using namespace std::string_literals;

constexpr auto k_admin          = "admin"_n;
constexpr auto k_clrorders      = "clrorders"_n;
constexpr auto k_execute_order  = "exec.order"_n;
constexpr auto k_insorderexec   = "insorderexec"_n;
constexpr auto k_order_expired  = "order.expired"_n;

void exchange::start_ttl_timer(order_id_t order_id, ttl_t ttl, name actor, std::string reason)
{
    if(!ttl_infinite(ttl))
    {
        order_timer t(order_id);
        t.set_permission(actor, k_active);
        t.set_callback(get_self(), k_order_expired, order_id, std::move(reason));
        t.start(ttl, actor);
    }
}

static bool stop_ttl_timer(order_id_t order_id) {
    return stop_order_timer(timer_id(order_id, k_order_expired));
}



exchange::exchange(name self, name code, datastream<const char*> ds) :
    contract(self, code, ds),
    bbook_(self),
    sbook_(self)
{}

void exchange::init(name fee_recipient)
{
    require_auth(_self);
    eosio_assert(is_account(fee_recipient), "Fee recipient is not valid account");

    exchange_state state(get_self());
    eosio_assert(!state.exists(), "Exchange is already initialized");
    state.set({ fee_recipient, same_payer, false }, _self);
}

void exchange::setfeerecip(name account)
{
    require_owner();
    eosio_assert(is_account(account), "Fee recipient is not valid account");

    exchange_state state(get_self());
    auto s = state.get();
    s.fee_account = account;
    state.set(s, _self);
}

void exchange::setproxy(name proxy)
{
    require_owner();
    eosio_assert(!proxy || is_account(proxy), "Proxy is not valid account");

    exchange_state state(get_self());
    auto s = state.get();
    s.transfer_proxy = proxy;
    state.set(s, _self);
}

name exchange::fee_recipient() const
{
    exchange_state state(get_self());
    return state.get().fee_account;
}

name exchange::transfer_proxy() const
{
    exchange_state state(get_self());
    return state.get().transfer_proxy;
}

void exchange::buy(name buyer, asset quantity, ttl_t ttl, bool force_buy)
{
    require_auth(buyer);
    eosio_assert(buyer != _self, "Contract account cannot buy!");
    eosio_assert(ttl_valid(ttl), "Invalid ttl!");
    eosio_assert(!is_ote_order(ttl) || force_buy, "OTE order shoud have force_buy = True!");
    
    // Verifying asset (must be valid EOS token)
    asset_assert(quantity, EOS_SYMBOL, "The value must be in EOS.");
    eosio_assert(quantity.amount > 0 , "EOS quaninty must be positive.");

    // Transfer EOS token to contract account and execute buy order
    std::string memo_cmd = memo_cmd_make_order(ttl, force_buy).to_string();
    transfer_token(
        buyer, get_self(), eos_token(quantity), std::move(memo_cmd),
        /*deferred=*/true
    );
}

void exchange::sell(name seller, asset quantity, ttl_t ttl, bool force_sell)
{
    require_auth(seller);
    eosio_assert(seller != _self, "Contract account cannot sell!" );
    eosio_assert(ttl_valid(ttl), "Invalid ttl!");
    eosio_assert(!is_ote_order(ttl) || force_sell, "OTE order shoud have force_sell = True!");

    // Verifying asset (must be valid RAM token)
    asset_assert(quantity, RAM_SYMBOL, "The value must be in RAM.");
    eosio_assert(quantity.amount > 0 , "RAM quaninty must be positive.");

    // Transfer RAM token to contract account and execute sell order
    std::string memo_cmd = memo_cmd_make_order(ttl, force_sell).to_string();
    transfer_token(
        seller, get_self(), ram_token(quantity), std::move(memo_cmd),
        /*deferred=*/true
    );
}

void exchange::cancel(order_id_t order_id)
{
    LOG_DEBUG("Canceling order: %", order_id);
    require_running();

    // Verify caller is the owner of order
    auto& order_book = get_order_book_of(order_id);
    auto order = order_book.get(order_id);
    require_auth(order.trader);

    // Cancel order and return funds
    order.expiration_time   = now();
    order.convert_on_expire = false;

    auto da = deduct_fee(order.value, cancel_order_fee);
    order.value = da.value;

    if(da.fee.amount > 0) {
        transfer_token(get_self(), fee_recipient(), to_token(da.fee), "Cancel order fee"s);
    }

    stop_ttl_timer(order_id);
    handle_expired_order(order_book, std::move(order), "Order was canceled"s);
}

void exchange::cancelbytxid(const tx_id_t& txid)
{
    cancel(get_order_id(txid));
}

void exchange::execute_order(order_id_t order_id)
{
    auto& buy_book  = get_order_book_of(order_id);
    auto buy_order  = buy_book.get(order_id);
    auto& sell_book = [&]() -> order_book& {
        if(buy_book.get_scope() == buy_order_book::get_scope()) {
            return sbook_;
        }
        return bbook_;
    }();

    const bool is_ote = is_ote_order(buy_order.expiration_time);
    if(preflight_check(buy_book, std::move(buy_order), is_ote)) {
        execute_trade_loop(buy_order, sell_book);
    }

    if(buy_book.contains(order_id))
    {
        if(erase_order_or_update(buy_book, buy_order)) {
            stop_ttl_timer(buy_order.id); // Order was deleted, stop it's ttl timer
        }
        else if(is_ote) 
        {
            stop_ttl_timer(buy_order.id);
            handle_expired_order(buy_book, std::move(buy_order), ""s);
        }
        // Execute another order loop?
        else if(sell_book.top() != sell_book.end())
        {
            order_timer t(buy_order.id);
            t.set_permission(buy_order.trader, k_active);
            t.set_callback(get_self(), k_execute_order, buy_order.id);
            t.start(order_execution_delay, buy_order.trader);
        }
    }
}

void exchange::execute_trade(ds::order_t& o1, ds::order_t& o2)
{
    ram_market rm;
    auto convert = [&](asset value, const symbol& sym) {
        if(sym == EOS_SYMBOL) {
            value = rm.convert_to_eos(value);
        } else {
            value = rm.convert_to_ram(value);
        }
        return value;
    };

    const auto o2_value_in_o1_tkn = convert(o2.value, o1.value.symbol);
    asset o2_receive_amount = min_asset(o1.value, o2_value_in_o1_tkn);
    asset o1_receive_amount = [&]() {
        if(o2_receive_amount == o2_value_in_o1_tkn) {
            return o2.value;
        }
        return convert(o1.value, o2.value.symbol);
    }();

    LOG_DEBUG("o1 value:% o2 value:%", o1.value, o2.value);
    LOG_DEBUG("o2_value_in_o1_tkn:%", o2_value_in_o1_tkn);
    LOG_DEBUG("o1_receive_amount:%", o1_receive_amount);
    LOG_DEBUG("o2_receive_amount:%", o2_receive_amount);

    const auto price =rm.get_ramprice();
    deduct_fee_and_transfer(o1.trader, o1_receive_amount, trade_fee,
        gen_trade_memo(o2_receive_amount, o1_receive_amount, price),
        "Trade fee"
    );

    deduct_fee_and_transfer(o2.trader, o2_receive_amount, trade_fee,
        gen_trade_memo(o1_receive_amount, o2_receive_amount, price),
        "Trade fee"
    );

    o1.value -= o2_receive_amount;
    o2.value -= o1_receive_amount;
}

void exchange::execute_trade_loop(ds::order_t& buy_order, ds::order_book& sell_book)
{
    auto sell_order_it = sell_book.top();
    uint32_t limit = order_execution_limit;

    while(limit --> 0 && 
        buy_order.value.amount > 0 && 
        sell_order_it != sell_book.end())
    {
        auto sell_order = *sell_order_it;
        ++sell_order_it;

        if(preflight_check(sell_book, std::move(sell_order), false))
        {
            execute_trade(buy_order, sell_order);
            if(erase_order_or_update(sell_book, sell_order)) {
                stop_ttl_timer(sell_order.id); // Order was deleted, stop it's ttl timer
            }
        }
    }
}

bool exchange::preflight_check(ds::order_book& book, ds::order_t&& order, bool ote_order)
{
    if(!ote_order && has_order_expired(order)) 
    {
        stop_ttl_timer(order.id);
        handle_expired_order(book, std::move(order), "Order has expired"s);
        return false;
    }

    if(order.value.symbol == EOS_SYMBOL && // Buying ram token?
       !is_account_owner_of(order.trader, ram_symbol()))
    {
        auto da = deduct_fee(order.value, token_transfer_fee);
        if(da.value.amount > 0)
        {
            ram_market rm;
            rm.buyram(_self, _self, da.fee);

            auto fee = to_token(rm.convert_to_ram(da.fee));
            open_token_balance(order.trader, fee, false);

            order.value.amount = da.value.amount;
            book.modify(order, order.trader);
            return false;
        }
    }

    return true;
}

template<typename Lambda>
void exchange::deduct_fee_and_transfer(name recipient, const asset& amount, Lambda&& fee, std::string transfer_memo, std::string fee_info)
{
    auto da = deduct_fee(amount, std::forward<Lambda>(fee));
    if(da.fee.amount > 0){
        transfer_token(get_self(), fee_recipient(), to_token(da.fee), std::move(fee_info));
    }
    make_transfer(recipient, da.value, std::move(transfer_memo));
}

void exchange::make_transfer(name recipient, const asset& amount, std::string memo)
{
    // Token transfer fee applys only if recipient is not already
    // an owner of token he's about to receive.
    auto ext_amount = to_token(amount);
    if(!is_account_owner_of(recipient, ext_amount.get_extended_symbol()))
    {
        auto da = deduct_fee(ext_amount.quantity, token_transfer_fee);
        ext_amount.quantity.amount = da.value.amount;
        
        if(da.value.amount > 0) {
            open_token_balance(recipient, to_token(da.fee), true);
        }
        else {
            transfer_token(get_self(), fee_recipient(), to_token(da.fee), "Token transfer fee");
        }
    }

    if(ext_amount.quantity.amount > 0) {
        transfer_token(get_self(), recipient, ext_amount, std::move(memo));
    }
}

void exchange::open_token_balance(const name owner, const extended_asset& fee, const bool burn_token)
{
    // Note: when open action is supported by eosio.token update if statement.

    const auto& sym = fee.quantity.symbol;
    if(sym == RAM_SYMBOL)
    {
        if(burn_token) {
            burn_ram_token(fee.quantity);
        }

        constexpr static auto k_open = "open"_n;
        dispatch_inline(fee.contract, k_open, {{ _self, k_active }},
            std::make_tuple(owner, sym, _self)
        );
    }
}

void exchange::transfer_token(const name from, const name to, const extended_asset& amount, std::string memo, bool deferred)
{
    eosio_assert(amount.quantity.is_valid(), "Cannot transfer invalid amount!" );
    name proxy = [&] {
        if(to != _self && to != fee_recipient()) {
            return transfer_proxy();
        }
        return name();
    }();
    
    if(deferred)
    {
        deferred_transfer(proxy, { from, k_active },
            from, to, amount, std::move(memo)
        );
    }
    else 
    {
        inline_transfer(proxy, { from, k_active },
            from, to, amount, std::move(memo)
        );
    }
}

// Order entry point
void exchange::execute_memo_cmd(const memo_cmd_make_order& cmd, name account, const asset& value)
{
    require_running();
    require_auth(account);
    asset_assert(value, EOS_SYMBOL, RAM_SYMBOL, "The value must be in EOS or RAM!");
    require_min_trade_amount(value, "Trade value does not satisfy min trade amount!");

    // Generate order id from current txid
    order_id_t order_id = get_order_id(get_txid());

    // Insert and execute order
    dispatch_inline(_self, k_insorderexec, {{ _self, k_active }, { account, k_active }},
        std::make_tuple(order_id, account, value, cmd.ttl(), cmd.convert_on_expire())
    );
}

void exchange::insert_and_execute_order(order_id_t order_id, name trader, const asset& value, ttl_t ttl, bool convert_on_expire)
{
    require_auth(_self);
    DEBUG_ASSERT(has_auth(trader), "insert_and_execute_order: Missing required authority for trader's account!");

    if(value.symbol == EOS_SYMBOL) {
        make_buy_order(order_id, trader, value, ttl, convert_on_expire);
    }
    else if(value.symbol == RAM_SYMBOL) {
        make_sell_order(order_id, trader, value, ttl, convert_on_expire);
    }
}

void exchange::make_buy_order(order_id_t order_id, name buyer, const asset& value, ttl_t ttl, bool force_buy)
{
    DEBUG_ASSERT(value.symbol == EOS_SYMBOL, "make_buy_order: value must be in EOS!");
    make_order_and_execute(bbook_, order_id, buyer, value, ttl, force_buy);
}

void exchange::make_sell_order(order_id_t order_id, name seller, const asset& value, ttl_t ttl, bool force_sell)
{
    DEBUG_ASSERT(value.symbol == RAM_SYMBOL, "make_sell_order: value must be in RAM!");
    make_order_and_execute(sbook_, order_id, seller, value, ttl, force_sell);
}

void exchange::make_order_and_execute(ds::order_book& book, order_id_t order_id, name trader, const asset& value, ttl_t ttl, bool exec_on_expire)
{
    DEBUG_ASSERT(has_auth(_self), "make_order_and_execute:  Missing required authority for owner's account!")
    auto order_expire_time = get_order_expiration_time(ttl);
    book.emplace_order(order_id, trader, value, order_expire_time, exec_on_expire);

    DEBUG_ASSERT(order_exists(order_id), "make_sell_order: failed to insert order into order book!");
    LOG_DEBUG("New order was inserted into order book. order_id=%", order_id);

    // Start order expiration timer and execute order
    start_ttl_timer(order_id, ttl, trader, "Order has expired"s);
    execute_order(order_id);
}

// Cancel order
void exchange::execute_memo_cmd(const memo_cmd_cancel_order& cmd, name account, const asset& value)
{
    // Tranfer any value back to sender 
    if(value.amount > 0) {
        make_transfer(account, value, "Returning excess amount"s);
    }
    cancelbytxid(cmd.txid());
}

void exchange::handle_expired_order(order_book& book, order_t order, std::string reason)
{
    eosio_assert(has_order_expired(order), "handle_expired_order: Order has not expired!");
    LOG_DEBUG("Order expired id= %", order.id);
    
    book.erase(order);

    // Buy/Sell RAM token on system ram market
    if(order.convert_on_expire && order.value.amount > 0)
    {
        ram_market rm;
        const auto price = rm.get_ramprice();

        // Buy RAM from market, issue RAM token and transfer RAM token to user
        if(is_buy_order(order))
        {
            LOG_DEBUG("Buying RAM token from system contract");

            /* Calculate output RAM - market fee */
            auto out_ram_in_eos   = deduct_fee(order.value, ram_market_fee).value;
            auto out_ram_quantity = rm.convert_to_ram(out_ram_in_eos);

            // Buy RAM from ram market and transfer token;
            rm.buyram(get_self(), get_self(), order.value);

            // Issue RAM token
            issue_ram_token(out_ram_quantity);
            
            // Transfer converted funds to trader
            deduct_fee_and_transfer(order.trader, out_ram_quantity, issue_token_fee,
                gen_trade_memo(order.value, out_ram_quantity, price),
                "RAM token issuance fee"
            );
        }

        // Sell RAM on ram market, burn RAM token and transfer EOS to user
        else 
        {
            LOG_DEBUG("Selling RAM token to system contract");

            // Calculate output RAM - market fee
            auto out_eos_quantity = deduct_fee(
                rm.convert_to_eos(order.value), ram_market_fee
            ).value;
            
            // Buy RAM from rammarket and transfer token;
            rm.sellrambytes(get_self(), order.value.amount);

            // Reduce issued RAM token supply
            burn_ram_token(order.value);
            
            // Transfer converted funds to trader
            deduct_fee_and_transfer(order.trader, out_eos_quantity, burn_token_fee,
                gen_trade_memo(order.value, out_eos_quantity, price),
                "Burn RAM token fee"
            );
        }
    }
    // Return remaining order's funds back to trader
    else if(!order.convert_on_expire)
    {
        LOG_DEBUG("Returning remaining order's funds back to order issuer");
       // require_recipient(order.trader); // Critical Bug: https://github.com/EOSIO/eos/issues/4824 

        make_transfer(order.trader, order.value, std::move(reason));
    }
}

void exchange::issue_ram_token(const asset& amount)
{
    constexpr auto k_issue  = "issue"_n;
    std::string memo = "Issuing RAM token: " + to_string(amount);
    dispatch_inline(RAM_TOKEN_CONTRACT, k_issue, {{ _self, k_active }},
        std::make_tuple(_self, amount, std::move(memo))
    );
}

void exchange::burn_ram_token(const asset& amount)
{
    constexpr auto k_burn   = "burn"_n;
    std::string memo = "Burning RAM token: " + to_string(amount);
    dispatch_inline(RAM_TOKEN_CONTRACT, k_burn, {{ _self, k_active }},
        std::make_tuple(amount, std::move(memo))
    );
}

void exchange::on_notification(name receiver, name code, name action)
{
    LOG_DEBUG("trace: exchange::on_notification: sender=% action=%", code, action);
    switch (action.value)
    {
        DISPATCH_SIGNAL("transfer"_n, exchange::on_transfer,
            eosio_assert(code != receiver, "Invalid action call!");
            IF_CODE(EOS_TOKEN_CONTRACT, RAM_TOKEN_CONTRACT)
        );

        DISPATCH_SIGNAL(k_execute_order, exchange::execute_order,
            IF_CONTRACT_SIGNAL
        );

        DISPATCH_SIGNAL(k_insorderexec, exchange::insert_and_execute_order,
            eosio_assert(code == receiver, "insorderexec action's are only valid from the contract's account");
        );

        DISPATCH_SIGNAL(k_order_expired, exchange::on_order_expired,
            IF_CONTRACT_SIGNAL
        );

        DISPATCH_SIGNAL("onerror"_n, exchange::on_error,
            eosio_assert(code == k_eosio, "onerror action's are only valid from the \"eosio\" system account");
        );
    }
}

void exchange::on_transfer(name from, name to, asset quantity, std::string memo)
{
    if (from != EOSIO_RAM_CONTRACT && to == _self)
    {
        eosio_assert(quantity.is_valid(), "Invalid quantity in transfer" );
        eosio_assert(quantity.amount > 0, "Transferred quantity must be positive value");
        on_payment_received(from, std::move(quantity), std::move(memo));
    }
}

void exchange::on_payment_received(name from, asset quantity, std::string memo)
{
    LOG_DEBUG("eosram.exchange: received payment from: \"%\" amount: \"%\" memo: \"%\"",
        from, quantity, memo);

    // Disregard payments which are not in EOS or RAM currency
    if(quantity.symbol != EOS_SYMBOL &&
       quantity.symbol != RAM_SYMBOL) {
        return;
    }

    // Parse memo and execute cmd
    memo_parser parser(std::move(memo));
    const auto cmd_type = parser.memo_cmd_type_as_int();
    switch(cmd_type)
    {
        case memo_cmd_make_order::type_as_int():
        {
            LOG_DEBUG("Executing cmd: make_order cmd");
            auto cmd = parser.get<memo_cmd_make_order>();
            return execute_memo_cmd(cmd, from, quantity);
        }
        case memo_cmd_cancel_order::type_as_int(): 
        {
            LOG_DEBUG("Executing cmd: cancel_order");
            auto cmd = parser.get<memo_cmd_cancel_order>();
            return execute_memo_cmd(cmd, from, quantity);
        }
        default:
        DEBUG_ASSERT(false, "Invalid memo cmd!"); // No reason to come here
    }
}

void exchange::on_order_expired(order_id_t order_id, std::string reason)
{
    auto& order_book = get_order_book_of(order_id, "on_order_expired: Order does not exists!");
    auto order = order_book.get(order_id);

    require_auth(order.trader);
    handle_expired_order(order_book, std::move(order), std::move(reason));
}

void exchange::on_error(onerror error)
{
    timer_id tid(error.sender_id);
    auto book_ptr = get_order_book_ptr_of(tid.order_id());
    if(book_ptr != nullptr || tid.action_name() == k_clrorders)
    {
        LOG_DEBUG("Resending failed tx for order_id: %", tid.order_id());

        auto order = *book_ptr->find(tid.order_id());
        transaction tx = error.unpack_sent_trx();
        tx.delay_sec = onerror_resend_delay;
        tx.send(error.sender_id, order.trader, true);
    }
}

order_book& exchange::get_order_book_of(order_id_t order_id, const char* error_msg)
{
    auto* opt_book = get_order_book_ptr_of(order_id);
    eosio_assert(opt_book != nullptr, error_msg);
    return *opt_book;
}

order_book* exchange::get_order_book_ptr_of(order_id_t id)
{
    if(bbook_.contains(id)) {
        return &bbook_;
    }

    if(sbook_.contains(id)) {
        return &sbook_;
    }

    return nullptr;
}

bool exchange::order_exists(order_id_t id) const
{
    auto book_ptr = const_cast<exchange*>(this)-> get_order_book_ptr_of(id);
    return book_ptr != nullptr;
}

void exchange::require_owner() const
{
    constexpr auto k_owner = "owner"_n;
    require_auth({ _self, k_owner });
}

void exchange::require_admin() const
{
    require_auth({ _self, k_admin });
}

void exchange::start()
{
    require_admin();

    exchange_state state(get_self());
    auto s = state.get();
    s.exchange_running = true;
    state.set(s, _self);
}

void exchange::stop()
{
    require_admin();

    exchange_state state(get_self());
    auto s = state.get();
    s.exchange_running = false;
    state.set(s, _self);
}

void exchange::clrallorders(std::string reason)
{
    if(!bbook_.empty()) {
        clrorders(EOS_SYMBOL, reason);
    }

    if(!sbook_.empty()) {
        clrorders(RAM_SYMBOL, reason);
    }
}

void exchange::clrorders(const symbol& sym, std::string reason)
{
    require_admin();
    std::size_t limit = 8;

    order_book& book = [&]() -> order_book& {
        if(sym == EOS_SYMBOL) {
            return bbook_;
        }
        return sbook_;
    }();

    auto it = book.begin();
    while(it != book.end() && limit --> 0)
    {
        make_transfer(it->trader, it->value, std::move(reason));
        it = book.erase(it);
    }

    if(!book.empty()) 
    {
        auto sym_code = static_cast<order_id_t>(sym.raw());
        order_timer t(sym_code);
        t.set_permission(get_self(), k_admin);
        t.set_callback(get_self(), k_clrorders, sym, std::move(reason));
        t.start(5, get_self());
    }
}

bool exchange::is_running() const
{
    exchange_state state(get_self());
    return state.get().exchange_running;
}

void exchange::require_running() const
{
    eosio_assert(is_running(), "RAM token exchange is stopped!");
}

EOSIO_DISPATCH( eosram::exchange, 
    (init)(buy)(sell)(cancel)(cancelbytxid)(start)(stop)(setfeerecip)(setproxy)(clrallorders)(clrorders) )