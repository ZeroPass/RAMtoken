#pragma once
#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/name.hpp>

#include "index_queue.hpp"
#include "../constants.hpp"
#include "../log.hpp"
#include "../types.hpp"


namespace eosram::ds {
    using namespace eosio;

    struct [[eosio::table("orderbook"), eosio::contract("eosram.exchange")]] order_t : index_queue_element
    {
        order_id_t id;
        asset value;
        eosio::name trader;
        uint32_t expiration_time;
        bool convert_on_expire;  // if true, when order expires the RAM token will be issued (or burned) instead of exchanged and
                                 // equal amount of RAM will be bought/sold on rammarket.

        order_t() = default;
        order_t(order_id_t oid, asset v, eosio::name t, uint32_t etime, bool exe_on_expire) :
            id(oid), value(v), trader(t),
            expiration_time(etime),
            convert_on_expire(exe_on_expire)
        {}

        constexpr bool operator == (const order_t& o) const {
            return trader == o.trader && value == o.value;
        }

        constexpr bool operator != (const order_t& o) { return !(*this == o); }
        uint64_t get_id() const { return id; }

        EOSLIB_SERIALIZE_DERIVED(order_t, index_queue_element, (id)(value)(trader)(expiration_time)(convert_on_expire))
    };


    namespace detail {
        static constexpr auto index_order_id = "id"_n;
        typedef index_queue<"orderbook"_n, order_t,
            indexed_by<index_order_id, const_mem_fun<order_t, order_id_t, &order_t::get_id>>
        > order_queue_t;
    }

    struct order_book : public detail::order_queue_t
    {
        order_book(eosio::name owner, uint64_t scope) :
            detail::order_queue_t(owner, scope)
        {}

        auto find(order_id_t id) const
        {
            return detail::order_queue_t::find<detail::index_order_id>(id);
        }

        auto get(order_id_t id) const
        {
            auto it = find(id);
            eosio_assert(it != end(), "Order doesn't exist");
            return std::move((*it));
        }

        bool contains(order_id_t id) const
        {
            return detail::order_queue_t::contains<detail::index_order_id>(id);
        }

        void modify(order_t order, eosio::name payer)
        {
            auto it = find(order.id);
            modify(it, std::move(order), payer);
        }

        void modify(const_iterator it, order_t order, eosio::name payer)
        {
            detail::order_queue_t::modify(it, std::move(order), payer);
        }

        void erase(order_id_t id)
        {
            auto it = find(id);
            if(it != end()) {
                detail::order_queue_t::erase(it);
            }
        }

        void erase(const order_t& order)
        {
            erase(order.id);
        }

        const_iterator erase(const_iterator it)
        {
            return detail::order_queue_t::erase(it);
        }

        /** Makes new order entry at the back of the book */
        void emplace_order(eosio::name ram_payer, order_id_t order_id, eosio::name trader, const asset& value, uint32_t expiration_time, bool force_trade)
        {
            order_t order;
            order.id                = order_id;
            order.value             = value;
            order.trader            = trader;
            order.expiration_time   = expiration_time;
            order.convert_on_expire = force_trade;

            // Push order to the back of the queue
            this->push(std::move(order), ram_payer);
        }
    };

    struct buy_order_book : public order_book
    {
        buy_order_book(eosio::name owner) :
            order_book(owner, get_scope())
        {}

        static uint64_t get_scope()
        {
            return EOS_TOKEN_CONTRACT.value;
        }
    };

    struct sell_order_book : public order_book
    {
        sell_order_book(eosio::name owner) :
            order_book(owner, get_scope())
        {}

        static uint64_t get_scope()
        {
            return RAM_TOKEN_CONTRACT.value;
        }
    };
}