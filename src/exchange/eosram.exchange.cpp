#include "eosram.exchange.hpp"
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


void exchange::start_ttl_timer(order_id_t order_id, ttl_t ttl, account_name actor, std::string reason)
{
    if(!ttl_infinite(ttl))
    {
        order_timer t(order_id);
        t.set_permission(actor, N(active));
        t.set_callback(_self, N(order_expired), order_id, std::move(reason));
        t.start(ttl, actor);
    }
}

static bool stop_ttl_timer(order_id_t order_id) {
    return stop_order_timer(timer_id(order_id, N(order_expired)));
}

void exchange::test()
{
    //transfer_token(_self, N(eosramturtle), 32926_RAM, "");


}



exchange::exchange(account_name self) : 
    contract(self),
    bbook_(self),
    sbook_(self)
{}

void exchange::init(account_name fee_recipient)
{
    require_auth(_self);
    eosio_assert(is_account(fee_recipient), "Fee recipient is not valid account");

    exchange_state state(_self);
    eosio_assert(!state.exists(), "Exchange is already initialized");
    state.set({ fee_recipient, 0, false }, _self);
}

void exchange::setfeerecip(account_name account)
{
    require_auth(_self);
    eosio_assert(is_account(account), "Fee recipient is not valid account");

    exchange_state state(_self);
    auto s = state.get();
    s.fee_account = account;
    state.set(s, _self);
}

void exchange::setproxy(account_name proxy)
{
    require_auth(_self);
    if(proxy > 0) {
        eosio_assert(is_account(proxy), "Proxy is not valid account");
    }

    exchange_state state(_self);
    auto s = state.get();
    s.transfer_proxy = proxy;
    state.set(s, _self);
}

account_name exchange::fee_recipient() const
{
    exchange_state state(_self);
    return state.get().fee_account;
}

account_name exchange::transfer_proxy() const
{
    exchange_state state(_self);
    return state.get().transfer_proxy;
}

void exchange::buy(account_name buyer, asset quantity, ttl_t ttl, bool force_buy)
{
    require_auth(buyer);
    eosio_assert(buyer != _self, "Contract account cannot buy!");
    eosio_assert(ttl_valid(ttl), "Invalid ttl!");
    
    // Verifying asset (must be valid EOS token)
    asset_assert(quantity, EOS_SYMBOL, "The value must be in EOS.");
    eosio_assert(quantity.amount > 0 , "EOS quaninty must be positive.");

    // Transfer EOS token to contract account and execute buy order
    std::string memo_cmd = memo_cmd_make_order(ttl, force_buy).to_string();
    transfer_token(buyer, _self, eos_token(quantity), std::move(memo_cmd));
}

void exchange::sell(account_name seller, asset quantity, ttl_t ttl, bool force_sell)
{
    require_auth(seller);
    eosio_assert(seller != _self, "Contract account cannot sell!" );
    eosio_assert(ttl_valid(ttl), "Invalid ttl!");

    // Verifying asset (must be valid RAM token)
    asset_assert(quantity, RAM_SYMBOL, "The value must be in RAM.");
    eosio_assert(quantity.amount > 0 , "RAM quaninty must be positive.");

    // Transfer RAM token to contract account and execute sell order
    std::string memo_cmd = memo_cmd_make_order(ttl, force_sell).to_string();
    transfer_token(seller, _self, ram_token(quantity), std::move(memo_cmd));
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
        transfer_token(_self, fee_recipient(), to_token(da.fee), "Cancel order fee");
    }

    stop_ttl_timer(order_id);
    handle_expired_order(order_book, std::move(order), "Order was canceled");
}

void exchange::cancelbytxid(transaction_id_type txid)
{
    cancel(get_order_id(txid));
}

void exchange::deferred_order_execution(order_id_t order_id, uint32_t delay, account_name actor)
{
    order_timer t(timer_id(order_id, N(execute_order)));
    t.set_permission(actor, N(active));
    t.set_callback(_self, N(execute_order), order_id);
    t.start(delay, actor);
}

void exchange::execute_order(order_id_t order_id)
{
    auto& buy_book = get_order_book_of(order_id);
    auto buy_order = buy_book.get(order_id);
    if(has_order_expired(buy_order)) 
    {
        stop_ttl_timer(buy_order.id);
        handle_expired_order(buy_book, std::move(buy_order), "Order has expired");
        return;
    }

    auto& sell_book = [&]() -> order_book& {
        if(buy_book.get_scope() == buy_order_book::get_scope()) {
            return sbook_;
        }
        return bbook_;
    }();

    auto sell_order_it = sell_book.top();
    uint32_t limit = order_execution_limit;
    while(limit --> 0 && 
          buy_order.value.amount > 0 && 
          sell_order_it != sell_book.end())
    {
        auto sell_order = *sell_order_it;
        ++sell_order_it;

        if(has_order_expired(sell_order)) 
        {
            stop_ttl_timer(sell_order_it->id);
            handle_expired_order(sell_book, std::move(sell_order), "Order has expired");
            continue;
        }

        execute_trade(buy_order, sell_order);

        if(update_or_erase_order(sell_book, sell_order)) {
            stop_ttl_timer(sell_order.id); // Order was deleted, stop it's ttl timer
        }
    }

    if(update_or_erase_order(buy_book, buy_order)) {
        stop_ttl_timer(buy_order.id); // Order was deleted, stop it's ttl timer
    }
    // Execute another order loop?
    else if(sell_order_it != sell_book.end()) {
        deferred_order_execution(buy_order.id, order_execution_delay, buy_order.trader);
    }
}

void exchange::execute_trade(ds::order_t& o1, ds::order_t& o2)
{
    ram_market rm;
    auto convert = [&](asset value, symbol_type sym) {
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

template<typename Lambda>
void exchange::deduct_fee_and_transfer(account_name recipient, const asset& amount, Lambda&& fee, std::string transfer_memo, std::string fee_info)
{
    auto da = deduct_fee(amount, std::forward<Lambda>(fee));
    if(da.fee.amount > 0){
        transfer_token(_self, fee_recipient(), to_token(da.fee), std::move(fee_info));
    }

    make_transfer(recipient, da.value, std::move(transfer_memo));
}

void exchange::make_transfer(account_name recipient, const asset& amount, std::string memo)
{
    // token transfer fee applys only if recipient is not already
    // an owner of token he's about to receive.
    auto ext_amount = to_token(amount);
    if(!is_account_owner_of(recipient, ext_amount.get_extended_symbol()))
    {
        auto da = deduct_fee(ext_amount.quantity, token_transfer_fee);
        ext_amount.quantity.amount = da.value.amount;
        
        if(da.fee.amount > 0) {
            transfer_token(_self, fee_recipient(), to_token(da.fee), "Token transfer fee");
        }
    }

    if(amount.amount > 0) {
        transfer_token(_self, recipient, ext_amount, std::move(memo));
    }
}

void exchange::transfer_token(const account_name from, const account_name to, const extended_asset& amount, std::string memo)
{
    eosio_assert(amount.quantity.is_valid(), "Cannot transfer invalid amount!" );
    account_name proxy = [&] {
        if(to != _self) {
            return transfer_proxy();
        }
        return 0ULL;
    }();
    
    inline_transfer(proxy, {from, N(active)},
        from, to, amount, std::move(memo)
    );
}

// Make order
void exchange::execute_memo_cmd(const memo_cmd_make_order& cmd, account_name account, asset value)
{
    require_running();
    require_auth(account);
    asset_assert(value, EOS_SYMBOL, RAM_SYMBOL, "The value must be in EOS or RAM!");
    require_min_trade_amount(value, "Trade value does not satisfy min trade amount!");

    switch(value.symbol)
    {
        case EOS_SYMBOL:
        {
            make_buy_order(account, value, cmd.ttl(), cmd.convert_on_expire());
            return;
        }
        case RAM_SYMBOL:
        {
            make_sell_order(account, value, cmd.ttl(), cmd.convert_on_expire());
            return;
        }
    }
}

void exchange::make_buy_order(account_name buyer, asset value, ttl_t ttl, bool force_buy)
{
    DEBUG_ASSERT(value.symbol == EOS_SYMBOL, "make_buy_order: value must be in EOS!");

    buy_order_book bbook(_self);
    make_order_and_execute(bbook, buyer, value, ttl, force_buy);
}

void exchange::make_sell_order(account_name seller, asset value, ttl_t ttl, bool force_sell)
{
    DEBUG_ASSERT(value.symbol == RAM_SYMBOL, "make_sell_order: value must be in RAM!");

    sell_order_book sbook(_self);
    make_order_and_execute(sbook, seller, value, ttl, force_sell);
}

void exchange::make_order_and_execute(ds::order_book& book, account_name trader, asset value, ttl_t ttl, bool exec_on_expire)
{
    // Generate order id from current txid
    order_id_t order_id = get_order_id(get_txid());

    auto order_expire_time = get_order_expiration_time(ttl);
    book.emplace_order(order_id, trader, value, order_expire_time, exec_on_expire);

    DEBUG_ASSERT(order_exists(order_id), "make_sell_order: failed to insert order into order book!");
    LOG_DEBUG("New order was inserted into order book. order_id=%", order_id);

    // Start order expiration timer and execute order
    start_ttl_timer(order_id, ttl, trader, "Order has expired"s);
    deferred_order_execution(order_id, 0, trader);
}

// Cancel order
void exchange::execute_memo_cmd(const memo_cmd_cancel_order& cmd, account_name account, asset value)
{
    // Tranfer any value back to sender 
    if(value.amount > 0) {
        make_transfer(account, value, "Returning excesed amount");
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
            rm.buyram(_self, _self, order.value);

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
            rm.sellrambytes(_self, order.value.amount);

            // Reduce issued RAM token supply
            burn_ram_token(order.value);
            
            // Transfer converted funds to trader
            deduct_fee_and_transfer(order.trader, out_eos_quantity, issue_token_fee,
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

void exchange::issue_ram_token(asset amount)
{
    std::string memo = "Issuing RAM token: " + to_string(amount);
    dispatch_inline(RAM_TOKEN_CONTRACT, N(issue),
        {{ _self, N(active) }}, std::make_tuple(_self, amount, std::move(memo)));
}

void exchange::burn_ram_token(asset amount)
{
    std::string memo = "Burning RAM token: " + to_string(amount);
    dispatch_inline(RAM_TOKEN_CONTRACT, N(burn),
        {{ _self, N(active) }}, std::make_tuple(amount, std::move(memo)));
}

void exchange::on_notification(uint64_t sender, uint64_t action)
{
    LOG_DEBUG("trace: exchange::on_notification: sender=% action=%", name{sender}, name{action});
    switch (action)
    {
        case N(transfer):
        {
            eosio_assert(sender != _self, "Invalid action call!");
            if(sender == EOS_TOKEN_CONTRACT || sender == RAM_TOKEN_CONTRACT) {
                execute_action(this, &exchange::on_transfer);
            } return;
        }
        case N(execute_order):
        {
            if(sender == _self) {
                execute_action(this, &exchange::execute_order);
            }
            return;
        }
        case N(order_expired):
        {
            if(sender == _self) {
                execute_action(this, &exchange::on_order_expired);
            }
            return;
        }
        case N(onerror):
        {
            eosio_assert(sender == N(eosio), "onerror action's are only valid from the \"eosio\" system account");
            execute_action(this, &exchange::on_error);
            return;
        }
    }
}

void exchange::on_transfer(account_name from, account_name to, asset quantity, std::string memo)
{
    if (from != EOSIO_RAM_CONTRACT && to == _self)
    {
        eosio_assert(quantity.is_valid(), "Invalid quantity in transfer" );
        eosio_assert(quantity.amount > 0, "Transferred quantity must be positive value");
        on_payment_received(from, std::move(quantity), std::move(memo));
    }
}

void exchange::on_payment_received(account_name from, asset quantity, std::string memo)
{
    LOG_DEBUG("eosram.exchange: received payment from: \"%\" amount: \"%\" memo: \"%\"",
        name{ from }, quantity, memo);

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
    if(book_ptr != nullptr)
    {
        LOG_DEBUG("Resending failed tx for order_id: %", tid.order_id());

        auto order = *book_ptr->find(tid.order_id());
        transaction tx = error.unpack_sent_trx();
        tx.delay_sec = onerror_resend_delay;
        tx.send(error.sender_id, order.trader);
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
    require_auth2(_self, N(owner));
}

void exchange::require_admin() const
{
    require_auth2(_self, N(admin));
}

void exchange::start()
{
    require_admin();

    exchange_state state(_self);
    auto s = state.get();
    s.exchange_running = true;
    state.set(s, _self);
}

void exchange::stop()
{
    require_admin();

    exchange_state state(_self);
    auto s = state.get();
    s.exchange_running = false;
    state.set(s, _self);
}

void exchange::clrallorders(std::string reason)
{
    buy_order_book bbook(_self);
    if(!bbook.empty()) {
        clrorders(EOS_SYMBOL, reason);
    }

    sell_order_book sbook(_self);
    if(!sbook.empty()) {
        clrorders(RAM_SYMBOL, reason);
    }
}

void exchange::clrorders(symbol_type sym, std::string reason)
{
    require_admin();
    std::size_t limit = 8;

    order_book& book = sym == EOS_SYMBOL ? static_cast<order_book&>(bbook_) : static_cast<order_book&>(sbook_);
    auto it = book.begin();

    while(it != book.end() && limit --> 0)
    {
        make_transfer(it->trader, it->value, std::move(reason));
        it = book.erase(it);
    }

    if(!book.empty()) 
    {
        order_timer t(timer_id(sym.value, N(clrorders)));
        t.set_permission(_self, N(admin));
        t.set_callback(_self, N(clrorders), sym, std::move(reason));
        t.start(5, _self);
    }
}

bool exchange::is_running() const
{
    exchange_state state(_self);
    return state.get().exchange_running;
}

void exchange::require_running() const
{
    eosio_assert(is_running(), "RAM token exchange is stopped!");
}

EOSIO_ABI( eosram::exchange, (init)(buy)(sell)(cancel)(cancelbytxid)(start)(stop)(setfeerecip)(setproxy)(clrallorders)(clrorders)(test) )