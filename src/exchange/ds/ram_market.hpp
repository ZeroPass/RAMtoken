#pragma once
#include <eosiolib/eosio.hpp>
#include <eosio.system/eosio.system.hpp>
#include "ram_exchange_state.cpp"

namespace eosram::ds {
    using eosio::asset;

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
    public:
        ram_market() :
            m_(N(eosio), N(eosio))
        {}

        const eosiosystem::exchange_state& get_state() const
        {
            auto it = m_.find(S(4, RAMCORE));;
            eosio_assert(it != m_.end(), "ram_market: Could not find eosiosystem rammarket!");
            return *it;
        }

        /** Rerurns RAM price per KiB in EOS */
        asset get_ramprice() const
        {
            const auto& s = get_state();
            auto ramprice = s.quote.balance * 1024; // Calculate balance for 1 KiB
            ramprice /= s.base.balance.amount;

            eosio_assert(ramprice.is_valid(), "ram_market::get_ramprice: Could not calculate valid RAM price!");
            return ramprice;
        }

        asset convert_to_eos(asset from_ram) const
        {
            auto tmp = get_state();
            return tmp.convert(from_ram, CORE_SYMBOL);
        }

        asset convert_to_ram(asset from_eos) const
        {
            auto tmp = get_state();
            return tmp.convert(from_eos, S(0, RAM));
        }

        static void buyram(account_name buyer, account_name receiver, asset eos_quantity)
        {
            INLINE_ACTION_SENDER(eosiosystem::system_contract, buyram)(
                N(eosio), {{buyer, N(active)}}, {buyer, receiver, eos_quantity}
            );
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
        eosiosystem::rammarket m_;
    };
}