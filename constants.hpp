#pragma once
#include <eosiolib/asset.hpp>
#include <eosiolib/dispatcher.hpp>
#include <eosiolib/symbol.hpp>
#include <eosiolib/system.h>
#include "types.hpp"


#define RAM_SYMBOL S(0, RAM)
#define EOS_SYMBOL CORE_SYMBOL
#define EOS_TOKEN_CONTRACT N(eosio.token)
#define EOSIO_RAM_CONTRACT N(eosio.ram)
#define RAM_TOKEN_CONTRACT N(ram.token)


namespace eosram {
    static constexpr int32_t  min_ttl                = 1;       // 1sec
    static constexpr ttl_t    infinite_ttl           = -1;
    static constexpr int64_t  transfer_fee_in_ram    = 250;
    static constexpr int64_t  min_ram_trade_amount   = transfer_fee_in_ram;
    static constexpr int32_t  cancel_order_wait_time = min_ttl;
    static constexpr uint32_t order_execution_limit  = 1;       // 1 order per execution
    static constexpr uint32_t order_execution_delay  = 1;       // 1s
    static constexpr uint32_t onerror_resend_delay   = 5;       // 5s

    static eosio::extended_symbol eos_symbol() {
        return eosio::extended_symbol(EOS_SYMBOL, EOS_TOKEN_CONTRACT);
    }

    static eosio::extended_asset eos_asset(eosio::asset asset) 
    {
        eosio_assert(asset.symbol == EOS_SYMBOL, "Invalid EOS asset!");
        return eosio::extended_asset(asset, EOS_TOKEN_CONTRACT);
    }

    static eosio::extended_symbol ram_symbol() {
        return eosio::extended_symbol(RAM_SYMBOL, RAM_TOKEN_CONTRACT);
    }

    static eosio::extended_asset ram_asset(eosio::asset asset) 
    {
        eosio_assert(asset.symbol == RAM_SYMBOL, "Invalid RAM asset!");
        return eosio::extended_asset(asset, RAM_TOKEN_CONTRACT);
    }

    static eosio::extended_asset to_token(eosio::asset asset) 
    {
        if(asset.symbol == EOS_SYMBOL) {
            return eos_asset(asset);
        } else {
            return ram_asset(asset);
        }
    }

    static auto operator"" _EOS (unsigned long long value) {
        return eos_asset(eosio::asset(static_cast<int64_t>(value), EOS_SYMBOL));
    }

    static auto operator"" _RAM (unsigned long long value) {
        return ram_asset(eosio::asset(static_cast<int64_t>(value), RAM_SYMBOL));
    }
}