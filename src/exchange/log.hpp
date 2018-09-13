#pragma once

#ifdef DEBUG
#include <eosiolib/eosio.hpp>
#define LOG_DEBUG(...) eosio::print_f(__VA_ARGS__); eosio::print("\n")
#define DEBUG_ASSERT(...) ::eosio_assert(__VA_ARGS__)
#else
#define LOG_DEBUG(...)
#define DEBUG_ASSERT(...)
#endif