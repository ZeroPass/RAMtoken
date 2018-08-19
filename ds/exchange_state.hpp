#pragma once
#include <eosiolib/eosio.hpp>
#include <eosiolib/singleton.hpp>
#include <eosiolib/asset.hpp>

#include "index_queue.hpp"

namespace eosram::ds {
    using namespace eosio;

    //@abi table state
    struct state_t
    {
        account_name fee_account;
        bool exchange_running = false;

        EOSLIB_SERIALIZE(state_t, (fee_account)(exchange_running))
    };

    struct exchange_state : public singleton<N(state), state_t>
    {
        exchange_state(account_name owner) : 
            singleton(owner, owner) 
        {}
    };
}