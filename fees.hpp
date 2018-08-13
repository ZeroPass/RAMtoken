#pragma once
#include <eosiolib/asset.hpp>
#include <eosiolib/core_symbol.hpp>
#include <algorithm>

#include "constants.hpp"

namespace eosram {
    using namespace eosio;

    template<typename Lambda>
    static auto deduct_fee(asset amount, Lambda&& fee_f) -> 
        std::pair</*deducted_amnt=*/asset, /*fee=*/asset>
    {
        auto fee = fee_f(amount);
        amount -= fee;
        return { amount, fee };
    }

    constexpr auto buy_fee = [](const asset& amount) {
        auto fee = amount;
        fee.amount = std::max((fee.amount + 999) / 1000, 1ll); // 0.1% fee (rounded up)
        return  fee;
    };

    constexpr auto sell_fee = [](const asset& a) {
        return buy_fee(a);
    };

    constexpr auto cancel_fee = [](const asset& amount) {
        auto fee = asset(1000, EOS_SYMBOL);
        return  fee;
    };

    constexpr auto expedite_cancel_fee = [](const asset& amount) {
        auto fee = asset(10000, EOS_SYMBOL);
        return  fee;
    };
}

