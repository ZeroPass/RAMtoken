#pragma once
#include <eosiolib/asset.hpp>
#include <eosiolib/dispatcher.hpp>
#include <eosiolib/symbol.hpp>
#include <eosiolib/system.h>
#include <eosiolib/types.hpp>

#include "../token/eosram.token.hpp"
#include "types.hpp"

#ifdef ABIGEN
    static constexpr auto RAM_SYMBOL = 0;
#endif
static constexpr auto EOS_SYMBOL = CORE_SYMBOL;
static constexpr auto EOS_TOKEN_CONTRACT = "eosio.token"_n;
static constexpr auto EOSIO_RAM_CONTRACT = "eosio.ram"_n;
static constexpr auto RAM_TOKEN_CONTRACT = "ramramramtkn"_n;


namespace eosram {
    static constexpr int32_t  min_ttl                = 1;       // 1sec
    static constexpr ttl_t    infinite_ttl           = -1;
    static constexpr int64_t  transfer_fee_in_ram    = 250;
    static constexpr int64_t  min_ram_trade_amount   = transfer_fee_in_ram;
    static constexpr uint32_t order_execution_limit  = 1;       // 1 order per execution
    static constexpr uint32_t order_execution_delay  = 1;       // 1s
    static constexpr uint32_t onerror_resend_delay   = 5;       // 5s

    static eosio::extended_symbol eos_symbol() {
        return eosio::extended_symbol{EOS_SYMBOL, EOS_TOKEN_CONTRACT};
    }

    static eosio::extended_asset eos_token(eosio::asset asset) 
    {
        eosio_assert(asset.symbol == EOS_SYMBOL, "Invalid EOS asset!");
        return eosio::extended_asset(asset, EOS_TOKEN_CONTRACT);
    }

    static eosio::extended_asset eos_token(int64_t amount) {
        return eos_token(eosio::asset(amount, EOS_SYMBOL));
    }

    static eosio::extended_symbol ram_symbol() {
        return eosio::extended_symbol{RAM_SYMBOL, RAM_TOKEN_CONTRACT};
    }

    static eosio::extended_asset ram_token(eosio::asset asset) 
    {
        eosio_assert(asset.symbol == RAM_SYMBOL, "Invalid RAM asset!");
        return eosio::extended_asset(asset, RAM_TOKEN_CONTRACT);
    }

    static eosio::extended_asset ram_token(int64_t amount) {
        return ram_token(eosio::asset(amount, RAM_SYMBOL));
    }

    static eosio::extended_asset to_token(eosio::asset asset) 
    {
        if(asset.symbol == EOS_SYMBOL) {
            return eos_token(asset);
        } else {
            return ram_token(asset);
        }
    }

    static auto operator"" _EOS (unsigned long long value) {
        return eos_token(static_cast<int64_t>(value));
    }

    static auto operator"" _RAM (unsigned long long value) {
        return ram_token(static_cast<int64_t>(value));
    }
}
