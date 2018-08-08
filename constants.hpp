#pragma once
#include <eosiolib/dispatcher.hpp>
#include <eosiolib/symbol.hpp>
#include "eosram.token.hpp"


#define EOS_TOKEN_CONTRACT N(eosio.token)
#define RAM_TOKEN_CONTRACT N(eosramtoken5)

inline eosio::extended_symbol eos_symbol() {
    return eosio::extended_symbol(CORE_SYMBOL, EOS_TOKEN_CONTRACT);
}

inline eosio::extended_symbol ram_symbol() {
    return eosio::extended_symbol(eosram::token::symbol(), EOS_TOKEN_CONTRACT);
}