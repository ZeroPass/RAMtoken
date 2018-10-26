#pragma once
#include <eosiolib/name.hpp>
#include <string>

#include "index_queue.hpp"

namespace eosram::ds {
    struct pending_trfx_recip_t : public index_queue_element
    {
        eosio::name name;
        std::string trfx_memo;

        pending_trfx_recip_t() = default;
        pending_trfx_recip_t(eosio::name n, std::string m) :
            name(n),
            trfx_memo(std::move(m))
        {}
 
        EOSLIB_SERIALIZE_DERIVED(pending_trfx_recip_t,
            index_queue_element, (name)(trfx_memo))
    };

    struct pending_trfx_queue_t : public 
        index_queue<"pendingtxfr"_n, pending_trfx_recip_t>
    {
        pending_trfx_queue_t(eosio::name owner) : 
            index_queue(owner, owner.value)
        {}

        inline void push(eosio::name recip, std::string trfx_memo, eosio::name ram_payer)
        {
            index_queue::push(pending_trfx_recip_t(recip, std::move(trfx_memo)), ram_payer);
        }
    };
}
