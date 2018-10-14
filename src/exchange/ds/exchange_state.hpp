#pragma once
#include <eosiolib/asset.hpp>
#include <eosiolib/eosio.hpp>
#include <eosiolib/name.hpp>
#include <eosiolib/singleton.hpp>

namespace eosram::ds {
    using namespace eosio;

    struct [[eosio::table, eosio::contract("eosram.exchange")]]
    state_t
    {
        name fee_account;
        name transfer_proxy;
        bool exchange_running = false;

        EOSLIB_SERIALIZE(state_t, (fee_account)(transfer_proxy)(exchange_running))
    };

    struct exchange_state : public singleton<"state"_n, state_t>
    {
        exchange_state(name owner) : 
            singleton(owner, owner.value) 
        {}
    };
}