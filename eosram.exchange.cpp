#include "eosram.exchange.hpp"
#include "fees.hpp"
#include "log.hpp"
#include "order_timer.hpp"
#include "order_utils.hpp"
#include "trade_tools.hpp"
#include "utils.hpp"

#include "ds/exchange_state.hpp"
#include "ds/memo/memo.hpp"
#include "ds/order_book.hpp"


#include <eosiolib/transaction.hpp>

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

void exchange::test(account_name payer, uint64_t limit, std::string memo)
{
    

}



exchange::exchange(account_name self) : 
    contract(self)
{}

void exchange::init(account_name fee_recipient)
{
    require_auth(_self);
    exchange_state state(_self);

    eosio_assert(!state.exists(), "Exchange is already initialized");
    state.set({ fee_recipient, false }, _self);
}

void exchange::setfeerecip(account_name account)
{
    require_auth(_self);
    exchange_state state(_self);

    auto s = state.get();
    s.fee_account = account;
    state.set(s, _self);
}

account_name exchange::fee_recipient() const
{
    exchange_state state(_self);
    return state.get().fee_account;
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
    transfer_token(buyer, _self, eos_asset(quantity), std::move(memo_cmd));
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
    transfer_token(seller, _self, ram_asset(quantity), std::move(memo_cmd));
}

void exchange::cancel(account_name account, transaction_id_type txid, asset value)
{
    require_auth(account);
    eosio_assert(account != _self, "Invalid account name");
    asset_assert(value, EOS_SYMBOL, "The value must be in EOS.");

    auto memo_cmd = memo_cmd_cancel_order(txid);
    if(value.amount > 0)
    {
        auto str_memo_cmd = memo_cmd.to_string();
        transfer_token(account, _self, eos_asset(value), std::move(str_memo_cmd));
    } else {
        execute_memo_cmd(memo_cmd, account, value);
    }
}

void exchange::execute_order(order_id_t order_id)
{
    auto buy_book = get_order_book_of(order_id);
    auto buy_order = std::move(*buy_book.find(order_id));
    if(has_order_expired(buy_order)) 
    {
        stop_ttl_timer(buy_order.id);
        handle_expired_order(buy_book, std::move(buy_order), "Order has expired");
        return;
    }

    auto sell_book = [&]() -> order_book {
        if(buy_book.get_scope() == buy_order_book::get_scope()) {
            return sell_order_book(_self);
        }
        return buy_order_book(_self);
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

        if(update_or_erase_order(buy_book, buy_order)) {
            stop_ttl_timer(buy_order.id);
        }

        if(update_or_erase_order(sell_book, sell_order)) {
            stop_ttl_timer(sell_order.id);
        }
    }

    // Execute another order loop?
    if(buy_order.value.amount > 0 &&
       sell_order_it != sell_book.end())
    {
        constexpr uint32_t delay_exec = order_execution_delay;
        order_timer t(timer_id(buy_order.id, N(execute_order)));
        t.set_permission(buy_order.trader, N(active));
        t.set_callback(_self, N(execute_order), buy_order.id);
        t.start(delay_exec, buy_order.trader);
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
    deduct_fee_and_transfer(o1.trader, to_token(o1_receive_amount),
        gen_trade_memo(o2_receive_amount, o1_receive_amount, price)
    );

    deduct_fee_and_transfer(o2.trader, to_token(o2_receive_amount),
        gen_trade_memo(o1_receive_amount, o2_receive_amount, price)
    );

    o1.value -= o2_receive_amount;
    o2.value -= o1_receive_amount;
}

void exchange::deduct_fee_and_transfer(account_name recipient, const asset& amount, std::string memo)
{
    LOG_DEBUG("deduct_fee_and_transfer: In transfer amount: %", amount);
    deducted_amount da;
    if(amount.symbol == EOS_SYMBOL) {
        da = deduct_trade_and_transfer_fee(to_token(amount), recipient, buy_fee);
    } else {
        da = deduct_trade_and_transfer_fee(to_token(amount), recipient, sell_fee);
    }

    if(da.value.amount > 0) {
        transfer_token(_self, recipient, to_token(da.value), std::move(memo));
    }

    if(da.fee.amount > 0){
        transfer_token(_self, fee_recipient(), to_token(da.fee), "Trade fee");
    }
}

void exchange::sweep()
{
    //TODO: iterate through RAM and call system buy/sell ram if needed
    //if Offer::forced is true...if it is false then return asset to user
    //if TTL = -1 then leave that Offer in queue until user call withdraw
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
    LOG_DEBUG("New order was inserted into order book order_id=%", order_id);

    // Start order expiration timer and execute order
    start_ttl_timer(order_id, ttl, trader, "Order has expired"s);
    execute_order(order_id);
}

// Cancel order
void exchange::execute_memo_cmd(const memo_cmd_cancel_order& cmd, account_name account, asset value)
{
    require_running();
    asset_assert(value, EOS_SYMBOL, "The value must be in EOS!");
    eosio_assert(value >= cancel_order_fee(value), "Fee starvation!");

    // Get order book
    auto order_id = get_order_id(cmd.txid());
    auto order_book = get_order_book_of(order_id);

    // Verify caller is the owner of order
    auto order = *order_book.find(order_id);
    require_auth(order.trader);

    // Transfer fee 
    if(value.amount > 0) {
        transfer_token(_self, fee_recipient(), to_token(value), "Order cancellation fee");
    }

    // Cancel order
    order.expiration_time   = now();
    order.convert_on_expire = false;
    stop_ttl_timer(order_id);

    if(value >= expedite_cancel_order_fee(value)) {
        handle_expired_order(order_book, std::move(order), "Order was canceled");
    }
    else 
    {
        // Update order
        order.expiration_time += cancel_order_wait_time;
        order_book.modify(std::move(order), account);

        // Start order expiration timer
        start_ttl_timer(order_id, cancel_order_wait_time, account, "Order was canceled"s);
    }
}

void exchange::handle_expired_order(order_book& book, order_t order, std::string reason)
{
    eosio_assert(has_order_expired(order), "handle_expired_order: Order has not expired!");
    LOG_DEBUG("Order expired id= %", order.id);

    book.erase(order);
    if(order.convert_on_expire) // Buy/Sell RAM token on system ram market
    {
        ram_market rm;
        const auto price = rm.get_ramprice();

        // Buy RAM from market, issue RAM token and transfer RAM token to user
        if(is_buy_order(order))
        {
            LOG_DEBUG("Buying RAM token from system contract");

            /* Calculate output RAM - market fee */
            auto out_ram_in_eos = deduct_fee(order.value, ram_market_fee).value;
            auto out_ram_quantity = ram_asset(rm.convert_to_ram(out_ram_in_eos));
            
            // Buy RAM from ram market and transfer token;
            rm.buyram(_self, _self, order.value);

            // Issue RAM token
            issue_ram_token(out_ram_quantity);
            
            // Dduct token issuance and transfer fee
            auto da = deduct_trade_and_transfer_fee(
                out_ram_quantity, order.trader, issue_token_fee
            );

            // Transfer token and fees
            std::string memo = gen_trade_memo(order.value, out_ram_quantity, price);
            transfer_token(_self, order.trader, ram_asset(da.value), std::move(memo));

            if(da.fee.amount > 0) {
                transfer_token(_self, fee_recipient(), ram_asset(da.fee), "RAM token issuance fee");
            }
        }

        // Sell RAM on ram market, burn RAM token and transfer EOS to user
        else 
        {
            LOG_DEBUG("Selling RAM token to system contract");

            // Calculate output RAM - market fee
            auto out_eos_quantity = eos_asset(
                deduct_fee(rm.convert_to_eos(order.value), ram_market_fee).value
            );
            
            // Buy RAM from rammarket and transfer token;
            rm.sellrambytes(_self, order.value.amount);

            // Reduce issued RAM token supply
            burn_ram_token(order.value);
            
            // Decuct token supply reduction and transfer fee
            auto da = deduct_trade_and_transfer_fee(
                out_eos_quantity, order.trader, burn_token_fee
            );

            // Transfer token and fees
            std::string memo = gen_trade_memo(order.value, da.value, price);
            transfer_token(_self, order.trader, eos_asset(da.value), std::move(memo));

            if(da.fee.amount > 0) {
                transfer_token(_self, fee_recipient(), eos_asset(da.fee), "RAM token burn fee");
            }
        }
    } 
    else // Return assets back to trader's account
    {
        require_recipient(order.trader);
        transfer_token(_self, order.trader, to_token(order.value), std::move(reason));
    }
}

void exchange::issue_ram_token(asset amount)
{
    LOG_DEBUG("trace: exchange::issue_ram_token: amount=%", amount);
    std::string memo = "Issuing RAM token: " + to_string(amount);
    dispatch_inline(RAM_TOKEN_CONTRACT, N(issue),
        {{ _self, N(active) }}, std::make_tuple(_self, amount, std::move(memo)));
}

void exchange::burn_ram_token(asset amount)
{
    LOG_DEBUG("trace: exchange::burn_ram_token: amount=%", amount);
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
            auto error = onerror::from_current_action();
            eosio_assert(false, ("timer action error id= " + to_string(timer_id(error.sender_id).order_id())).c_str());
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
    auto order_book = get_order_book_of(order_id, "on_order_expired: Order does not exists!");
    auto order = *order_book.find(order_id);

    require_auth(order.trader);
    handle_expired_order(order_book, std::move(order), std::move(reason));
}

order_book exchange::get_order_book_of(order_id_t order_id, const char* error_msg) const
{
    auto opt_book = get_opt_order_book_of(order_id);
    eosio_assert(opt_book.has_value(), error_msg);
    return std::move(opt_book).value();
}

std::optional<order_book>
    exchange::get_opt_order_book_of(order_id_t id) const
{
    buy_order_book bbook(_self); 
    if(bbook.contains(id)) {
        return bbook;
    }

    sell_order_book sbook(_self);
    if(sbook.contains(id)) {
        return sbook;
    }

    return std::nullopt;
}

bool exchange::order_exists(order_id_t id) const
{
    return get_opt_order_book_of(id).has_value();
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

    order_book book = sym == EOS_SYMBOL ? order_book(buy_order_book(_self)) : order_book(sell_order_book(_self));
    auto it = book.begin();

    while(it != book.end() && limit --> 0)
    {
        transfer_token(_self, it->trader, to_token(it->value), reason);
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

EOSIO_ABI( eosram::exchange, (init)(buy)(sell)(cancel)(start)(stop)(setfeerecip)(clrallorders)(clrorders)(test) )