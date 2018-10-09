#pragma once
#include <eosiolib/transaction.h>
#include <eosiolib/transaction.hpp>
#include <eosiolib/types.hpp>
#include <utility>

#include "types.hpp"


namespace eosram {
    struct timer_id 
    {
        timer_id(order_id_t order_id, eosio::name action_name) {
            value = (static_cast<uint128_t>(order_id) << 64) | action_name.value;
        }

        timer_id(uint128_t raw_id) : 
            value(std::move(raw_id))
        {}

        constexpr order_id_t order_id() const {
            return static_cast<uint64_t>(value >> 64);
        }

        constexpr eosio::name action_name() const {
            return eosio::name{ static_cast<uint64_t>(value) };
        }

        operator uint128_t() const {
            return value;
        }

        uint128_t value;
    };

    class order_timer
    {
    public:
        order_timer(order_id_t order_id) : o_id_(order_id) 
        {
            tx_.actions.resize(1);
        }

        timer_id id() const {
            return timer_id(o_id_, eosio::name{ tx_.actions.at(0).name });
        }

        template<typename... Args>
        void set_callback(eosio::name contract, eosio::name action, Args&&... args) 
        {
            auto& act = tx_.actions.at(0);
            act.account = contract;
            act.name = action;
            act.data = eosio::pack(std::make_tuple(std::forward<Args>(args)...));
        }

        void set_callback(eosio::name contract, eosio::name action) 
        {
            auto& act = tx_.actions.at(0);
            act.account = contract;
            act.name = action;
        }

        void set_permission(eosio::name account, permission_name permission)
        {
            set_permissions({ eosio::permission_level{account, permission} });
        }

        void set_permissions(std::vector<eosio::permission_level> perms)
        {
            tx_.actions.at(0).authorization = std::move(perms);
        }

        void start(unsigned_int time_out, eosio::name payer, bool replace = false)
        {
            tx_.delay_sec = time_out;
            tx_.send(id(), payer, replace);
        }

    private:
        order_id_t o_id_;
        eosio::transaction tx_;
    };

    static bool stop_order_timer(const timer_id& id) {
        return cancel_deferred(id) > 0;
    }
}