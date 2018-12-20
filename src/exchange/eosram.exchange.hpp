#include <eosiolib/asset.hpp>
#include <eosiolib/eosio.hpp>
#include <eosiolib/transaction.hpp>
#include <eosiolib/name.hpp>

#include "constants.hpp"
#include "ds/ram_market.hpp"
#include "ds/order_book.hpp"
#include "ds/memo/memo.hpp"

#include <algorithm>
#include <cmath>
#include <string>

namespace eosram {
    using namespace eosio;

    class [[eosio::contract("eosram.exchange")]] exchange : public eosio::contract
    {
    public:
        exchange(name self, name code, datastream<const char*> ds);

    //public_api:
       /**
        * Buys RAM token from the exchange.
        * If ttl is -1 order will never expire.
        */
        [[eosio::action]]
        void buy(name buyer, asset value, ttl_t ttl = infinite_ttl, bool force_buy = true);

       /**
        * Sells RAM token on the exchange.
        * If ttl is -1 order will never expire.
        */
        [[eosio::action]]
        void sell(name seller, asset value, ttl_t ttl = infinite_ttl, bool force_sell = true);

        /** Cancels order by order id */
        [[eosio::action]]
        void cancel(order_id_t order_id);

        /** Cancels order by order's transaction id */
        [[eosio::action]]
        void cancelbytxid(const tx_id_t& txid);

    //private_api:
        [[eosio::action]]
        void init(name fee_recipient);

        [[eosio::action]]
        void setfeerecip(name account);

        [[eosio::action]]
        void setproxy(name proxy);

        [[eosio::action]]
        void start();

        [[eosio::action]]
        void stop();

        [[eosio::action]]
        void clrallorders(std::string reason);

        [[eosio::action]]
        void clrorders(const symbol& sym, std::string reason);

        // signal handler
        static void on_notification(name receiver, name code, name action);

    private:
        void execute_memo_cmd(const ds::memo_cmd_make_order& cmd, name account, const asset& value);
        void execute_memo_cmd(const ds::memo_cmd_cancel_order& cmd, name account, const asset& value);
        void start_ttl_timer(order_id_t order_id, ttl_t ttl, name actor, std::string reason);

        ds::order_book& get_order_book_of(order_id_t order_id, const char* error_msg = "Order doesn't exists");
        ds::order_book* get_order_book_ptr_of(order_id_t id);
        bool order_exists(order_id_t id) const;

        void execute_order(order_id_t order_id);
        void execute_trade(ds::order_t& o1, ds::order_t& o2);
        void execute_trade_loop(ds::order_t& buy_order, ds::order_book& sell_book);
        void insert_and_execute_order(order_id_t order_id, name trader, const asset& value, ttl_t ttl, bool force_execution);
        void make_buy_order(order_id_t order_id, name buyer, const asset& value, ttl_t ttl, bool force_buy);
        void make_sell_order(order_id_t order_id, name seller, const asset& value, ttl_t ttl, bool force_sell);
        void make_order_and_execute(ds::order_book&, order_id_t order_id, name trader, const asset& value, ttl_t ttl, bool convert_on_expire);
        bool preflight_check(ds::order_book& book, ds::order_t&& order);

        template<typename Lambda>
        void deduct_fee_and_transfer_to(name recipient, const asset& amount, Lambda&& fee, std::string transfer_memo, std::string fee_info, bool deferred = false);
        void make_transfer_to(const name recipient, const asset& amount, std::string memo, bool deferred = false);
        void open_token_balance(name owner, const extended_asset& buy_ram_amount, const bool burn_token);
        void transfer_token(const name from, const name to, const extended_asset& amount, std::string memo = "", bool deferred = false);

        void handle_expired_order(ds::order_book& book, ds::order_t order, std::string reason);
        void issue_ram_token(const asset& amount);
        void burn_ram_token(const asset& amount);

        // signal heandlers
        void on_error(onerror error);
        void on_order_expired(order_id_t order_id, std::string reason);
        void on_payment_received(name from, asset quantity, std::string memo);
        void on_transfer(name from, name to, asset quantity, std::string memo);

        // authorization
        void require_owner() const;
        void require_admin() const;
        name get_ram_payer(name action_actor, bool is_notify_action = false) const;
        name get_action_executor(name action_actor, bool is_notify_action = false) const;

        // exchange state
        bool is_running() const;
        void require_running() const;
        name fee_recipient() const;
        name transfer_proxy() const;

    private:
        ds::buy_order_book bbook_;
        ds::sell_order_book sbook_;
    };
} // eosram