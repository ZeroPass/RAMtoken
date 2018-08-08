#pragma once
#include <eosiolib/asset.hpp>
#include <eosiolib/dispatcher.hpp>
#include <eosiolib/symbol.hpp>
#include <eosiolib/system.h>


#define EOSRAM_SYMBOL S(0, RAM)
#define EOS_TOKEN_CONTRACT N(eosio.token)
#define RAM_TOKEN_CONTRACT N(eosramtoken5)

#ifdef EOS_TOKEN_CONTRACT
inline eosio::extended_symbol eos_symbol() {
    return eosio::extended_symbol(CORE_SYMBOL, EOS_TOKEN_CONTRACT);
}

inline eosio::extended_asset eos_asset(eosio::asset asset) 
{
    eosio_assert(asset.symbol == CORE_SYMBOL, "Invalid EOS asset!");
    return eosio::extended_asset(asset, EOS_TOKEN_CONTRACT);
}
#endif 

#ifdef RAM_TOKEN_CONTRACT
inline eosio::extended_symbol ram_symbol() {
    return eosio::extended_symbol(EOSRAM_SYMBOL, EOS_TOKEN_CONTRACT);
}

inline eosio::extended_asset ram_asset(eosio::asset asset) 
{
    eosio_assert(asset.symbol == EOSRAM_SYMBOL, "Invalid RAM asset!");
    return eosio::extended_asset(asset, RAM_TOKEN_CONTRACT);
}
#endif