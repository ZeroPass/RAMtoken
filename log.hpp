#pragma once

#define DEBUG

#ifdef DEBUG
#include <eosiolib/eosio.hpp>
#define LOG_DEBUG(...) eosio::print_f(__VA_ARGS__); eosio::print("\n")
#else
#define LOG_DEBUG(...)
#endif