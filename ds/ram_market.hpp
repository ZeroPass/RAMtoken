#pragma once
#include <eosiolib/eosio.hpp>
#include <eosio.system/exchange_state.hpp>

namespace eosio {

    class ram_market
    {
    public:
        ram_market() :
            rm_(N(eosio), N(eosio))
        {}

        eosiosystem::exchange_state get_exchange_state() const
        {
            auto it = rm_.begin();
            eosio_assert(it != rm_.end(), "Could not get ram excgange state!");
            return *it;
        }

        /** Rerurns RAM price per KiB in EOS */
        asset get_ramprice() const
        {
            auto s = get_exchange_state();
            auto ramprice = s.quote.balance * 1024; // Calculate balance for 1 KiB
            ramprice /= s.base.balance.amount;

            eosio_assert(ramprice.is_valid(), "Could not calculate valid RAM price!");
            return ramprice;
        }

    private:
        eosiosystem::rammarket rm_;
    };
}