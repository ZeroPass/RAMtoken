#pragma once
#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>

#include "index_queue.hpp"
#include "../constants.hpp"


namespace eosram {
    using namespace eosio;

    using order_id_t = uint64_t;

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
            return find(id) != end();
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