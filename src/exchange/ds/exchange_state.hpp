#pragma once
#include <eosiolib/eosio.hpp>
#include <eosiolib/singleton.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/types.hpp>

#include "index_queue.hpp"

namespace eosram::ds {
    using namespace eosio;

    struct [[eosio::table("state")]] state_t
    {
        eosio::name fee_account = eosio::name{0};
        eosio::name transfer_proxy = eosio::name{0};
        bool exchange_running = false;

        EOSLIB_SERIALIZE(state_t, (fee_account)(transfer_proxy)(exchange_running))
    };

    struct exchange_state : public singleton<"state"_n, state_t>
    {
        exchange_state(name owner) : 
            singleton(owner, owner) 
        {}
    };
}