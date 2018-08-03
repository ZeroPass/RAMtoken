#pragma once
#include <eosiolib/eosio.hpp>
#include <eosio.system/exchange_state.hpp>
#include <eosio.system/eosio.system.hpp>

namespace eosio {

    /* Struct defines kibibyte unit */
    struct kibyte
    {
        constexpr explicit kibyte(uint64_t v) : value(v)
        {
            eosio_assert(v <= UINT32_MAX / 1024UL, "kibyte: Too big value for KiB unit!");
        }

        uint32_t value = 0;
        uint32_t to_bytes() const
        {
            return value * 1024UL;
        }
    };

    // kibyte literal
    constexpr kibyte operator"" _KiB (unsigned long long value)
    {
        return kibyte(value);
    }


    class ram_market
    {
        using rm_t = eosiosystem::rammarket;
    public:
        ram_market() :
            m_(N(eosio), N(eosio))
        {
            eosio_assert(get_marget_it() != m_.end(), "ram_market: Could not find eosio rammarket!");
        }

        eosiosystem::exchange_state get_exchange_state() const
        {
            return *get_marget_it();
        }

        /** Rerurns RAM price per KiB in EOS */
        asset get_ramprice() const
        {
            auto s = get_exchange_state();
            auto ramprice = s.quote.balance * 1024; // Calculate balance for 1 KiB
            ramprice /= s.base.balance.amount;

            eosio_assert(ramprice.is_valid(), "ram_market::get_ramprice: Could not calculate valid RAM price!");
            return ramprice;
        }

        static void buyram(account_name buyer, account_name receiver, kibyte quantity)
        {
            buyrambytes(buyer, receiver, quantity.to_bytes());
        }

        static void buyrambytes(account_name buyer, account_name receiver, uint32_t bytes)
        {
            INLINE_ACTION_SENDER(eosiosystem::system_contract, buyrambytes)(
                N(eosio), {{buyer, N(active)}}, {buyer, receiver, bytes}
            );
        }

        static void sellram(account_name seller, kibyte quantity)
        {
            sellrambytes(seller, quantity.to_bytes());
        }

        static void sellrambytes(account_name seller, uint32_t bytes)
        {
            INLINE_ACTION_SENDER(eosiosystem::system_contract, sellram)(
                N(eosio), {{seller, N(active)}}, {seller, bytes}
            );
        }

    private:
        rm_t::const_iterator get_marget_it() const 
        {
            return m_.find(S(4, RAMCORE));
        }

    private:
        rm_t m_;
    };
}