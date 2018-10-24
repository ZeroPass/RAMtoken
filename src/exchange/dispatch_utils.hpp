#pragma once
#include <eosiolib/dispatcher.hpp>

#undef EOSIO_DISPATCH
#define EOSIO_DISPATCH(TYPE, MEMBERS) \
extern "C" {  \
    void apply(uint64_t receiver, uint64_t code, uint64_t action) { \
        bool api_call = (code == receiver); \
        if(api_call) { \
            switch(action) { \
                EOSIO_DISPATCH_HELPER(TYPE, MEMBERS) \
                default: api_call = false; \
            } \
        } \
        if(!api_call) { \
            TYPE::on_notification(eosio::name(receiver),\
                eosio::name(code), eosio::name(action)); \
        } \
    } \
}

namespace eosram::detail {
    template<class none = void>
    inline constexpr bool code_equals(eosio::name code)
    {
        return false;
    }

    template<eosio::name::raw First, eosio::name::raw... Rest>
    inline constexpr bool code_equals(eosio::name code)
    {
        if(code == First) {
            return true;
        }
        return code_equals<Rest...>(code);
    }
}

#define IF_CODE(...) \
    if(eosram::detail::code_equals<__VA_ARGS__>(code))

#define IF_CONTRACT_SIGNAL if(receiver == code)

#define DISPATCH_SIGNAL(SIGNAL, FUNC, ...) \
    case SIGNAL.value: { __VA_ARGS__ execute_action(receiver, code, &FUNC); } break

