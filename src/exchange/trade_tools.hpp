#pragma once
#include <eosiolib/asset.hpp>
#include <eosiolib/core_symbol.hpp>

#include "constants.hpp"
#include "fees.hpp"
#include "ds/ram_market.hpp"

#ifndef ABIGEN
#include "../token/eosram.token.hpp"
#endif

namespace eosram {
    using namespace eosio;

    struct deducted_amount {
        asset value;
        asset fee;
    };

    template<typename Lambda>
    static deducted_amount deduct_fee(asset amount, Lambda&& fee_f)
    {
        auto fee = fee_f(amount);
        if(fee > amount) 
        {
            fee = amount;
            amount.amount = 0;
        }
        else {
            amount -= fee;
        }

        return { amount, fee };
    }

    static bool is_account_owner_of(account_name account, const eosio::extended_symbol& tkn_sym)
    {
    #ifndef ABIGEN
        token t(tkn_sym.contract);
        return t.has_balance(account, tkn_sym.symbol);
    #else
        return false;
    #endif
    }

    static asset min_trade_amount(symbol_type sym) 
    {
        if(sym != RAM_SYMBOL)
        {
            ds::ram_market rm;
            return rm.convert_to_eos(asset(min_ram_trade_amount, RAM_SYMBOL));
        } else {
            return asset(min_ram_trade_amount, RAM_SYMBOL);
        }
    }

    static bool is_min_trade_amount(const asset& value)
    {
        return value >= min_trade_amount(value.symbol);
    }

    static void require_min_trade_amount(const asset& value, const char* msg)
    {
        eosio_assert(is_min_trade_amount(value), msg);
    }

    static std::string gen_trade_memo(const asset& sold_amnt, const asset& receive_amnt, asset price) 
    {
        const bool is_buy = sold_amnt.symbol == EOS_SYMBOL;
        return ( is_buy ? "Bought " : "Sold ") 
            + (is_buy ? to_string(receive_amnt) : to_string(sold_amnt)) 
            + " tokens @" + to_string(price) + "/KiB";
    }

    static asset min_asset(const asset& a1, const asset& a2)
    {
        eosio_assert(a1.symbol == a2.symbol, "Can't compare amount of different assets");
        return asset(std::min(a1.amount, a2.amount), a1.symbol);
    }
}
