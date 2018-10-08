
#include <eosiolib/asset.hpp>
#include <eosiolib/eosio.hpp>
#include <eosiolib/transaction.hpp>
#include <eosiolib/types.hpp>

#include "constants.hpp"
#include "ds/ram_market.hpp"
#include "ds/order_book.hpp"
#include "ds/memo/memo.hpp"

#include <algorithm>
#include <cmath>
#include <string>

namespace eosram {
    using namespace eosio;

    class exchange : public eosio::contract
    {
    public:
        exchange(account_name self);

    //public_api:
       /**
        * Buys RAM token from the exchange.
        * If ttl is -1 order will never expire.
        */
        [[eosio::action]]
        void buy(account_name buyer, eosio::asset value, ttl_t ttl = infinite_ttl, bool force_buy = true);

       /**
        * Sells RAM token on the exchange.
        * If ttl is -1 order will never expire.
        */
        [[eosio::action]]
        void sell(account_name seller, eosio::asset value, ttl_t ttl = infinite_ttl, bool force_sell = true);

        /** Cancels order by order id */
        [[eosio::action]]
        void cancel(order_id_t order_id);

        /** Cancels order by order's transaction id */
        [[eosio::action]]
        void cancelbytxid(transaction_id_type txid);

    //private_api:
        [[eosio::action]]
        void init(account_name fee_recipient);

        [[eosio::action]]
        void setfeerecip(account_name account);

        [[eosio::action]]
        void setproxy(account_name proxy);

        [[eosio::action]]
        void start();

        [[eosio::action]]
        void stop();

        [[eosio::action]]
        void clrallorders(std::string reason);

        [[eosio::action]]
        void clrorders(symbol_type sym, std::string reason);

        // signal handler
        void on_notification(uint64_t sender, uint64_t action);

    private:
        void execute_memo_cmd(const ds::memo_cmd_make_order& cmd, account_name account, asset value);
        void execute_memo_cmd(const ds::memo_cmd_cancel_order& cmd, account_name account, asset value);
        void start_ttl_timer(order_id_t order_id, ttl_t ttl, account_name actor, std::string reason);

        ds::order_book& get_order_book_of(order_id_t order_id, const char* error_msg = "Order doesn't exists");
        ds::order_book* get_order_book_ptr_of(order_id_t id);
        bool order_exists(order_id_t id) const;

        void execute_order(order_id_t order_id);
        void execute_trade(ds::order_t& o1, ds::order_t& o2);
        void insert_and_execute_order(order_id_t order_id, account_name trader, asset value, ttl_t ttl, bool force_execution);
        void make_buy_order(order_id_t order_id, account_name buyer, asset value, ttl_t ttl, bool force_buy);
        void make_sell_order(order_id_t order_id, account_name seller, asset value, ttl_t ttl, bool force_sell);
        void make_order_and_execute(ds::order_book&, order_id_t order_id, account_name trader, asset value, ttl_t ttl, bool convert_on_expire);

        template<typename Lambda>
        void deduct_fee_and_transfer(account_name recipient, const asset& amount, Lambda&& fee, std::string transfer_memo, std::string fee_info);
        void make_transfer(account_name recipient, const asset& amount, std::string memo);
        void transfer_token(const account_name from, const account_name to, const extended_asset& amount, std::string memo = "");

        void handle_expired_order(ds::order_book& book, ds::order_t order, std::string reason);
        void issue_ram_token(asset amount);
        void burn_ram_token(asset amount);

        // signals
        void on_error(onerror error);
        void on_order_expired(order_id_t order_id, std::string reason);
        void on_payment_received(account_name from, asset quantity, std::string memo);
        void on_transfer(account_name from, account_name to, asset quantity, std::string memo);

        // authorization 
        void require_owner() const;
        void require_admin() const;

        // exchange state
        bool is_running() const;
        void require_running() const;
        account_name fee_recipient() const;
        account_name transfer_proxy() const;

    private:
        ds::buy_order_book bbook_;
        ds::sell_order_book sbook_;
    };
} // eosram