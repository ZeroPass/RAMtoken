#pragma once
#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>

#include "index_queue.hpp"
#include "../constants.hpp"
#include "../log.hpp"
#include "../order_utils.hpp"
#include "../utils.hpp"
#include "../types.hpp"

namespace eosram::ds {
    using namespace eosio;

    //@abi table orderbook
    struct order_t
    {
        order_id_t id;
        asset value;
        account_name trader;
        uint32_t expiration_time;
        bool convert_on_expire;  // if true, when order expires the RAM token will be issued (or burned) instead of exchanged and 
                                 // equal amount of RAM will be bought/sold on rammarket.

        constexpr bool operator == (const order_t& o) const { 
            return trader == o.trader && value == o.value;
        }

        constexpr bool operator != (const order_t& o) { return !(*this == o); }
        uint64_t get_id() const { return id; }

        EOSLIB_SERIALIZE(order_t, (trader)(value)(expiration_time)(convert_on_expire))
    };


    namespace detail {
        static constexpr auto index_order_id = N("id");
        typedef index_queue<N(orderbook), order_t,
            indexed_by<index_order_id, const_mem_fun<order_t, order_id_t, &order_t::get_id>>
        > order_queue_t;
    }

    struct order_book : public detail::order_queue_t
    {
        order_book(account_name owner, uint64_t scope) :
            detail::order_queue_t(owner, scope)
        {}

        auto find(order_id_t id) const
        {
            return detail::order_queue_t::find<detail::index_order_id>(id);
        }

        bool contains(order_id_t id) const
        {
            return detail::order_queue_t::contains<detail::index_order_id>(id);
        }

        void erase(order_id_t id)
        {
            auto it = find(id);
            if(it != end()) {
                detail::order_queue_t::erase(it);
            }
        }

        /** Makes new order entry at the back of the book */
        order_id_t emplace_order(account_name trader, asset value, ttl_t ttl, bool force_trade)
        {
            // Generate order id from current txid
            order_id_t order_id = get_order_id(get_txid()); 

            // Sanity checks
            eosio_assert(!this->contains(order_id), "Order already exists!");
            DEBUG_ASSERT(this->get_scope() == value.symbol, "Book.asset.symbol != value.symbol");

            order_t order;
            order.id                = order_id;
            order.value             = value;
            order.trader            = trader;
            order.expiration_time   = get_order_expiration_time(ttl);
            order.convert_on_expire = force_trade;

            // Push order to the back of the queue
            this->push(std::move(order), /*payer=*/trader);
            return order_id;
        }
    };

    struct buy_order_book : public order_book
    {
        buy_order_book(account_name owner) :
            order_book(owner, EOS_TOKEN_CONTRACT)
        {}
    };

    struct sell_order_book : public order_book
    {
        sell_order_book(account_name owner) :
            order_book(owner, RAM_TOKEN_CONTRACT)
        {}
    };
}