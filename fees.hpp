#pragma once
#include <eosiolib/asset.hpp>
#include <algorithm>

#include "constants.hpp"
#include "ds/ram_market.hpp"

namespace eosram {
    using namespace eosio;

    constexpr auto no_fee = [](const asset& amount) -> asset {
        auto fee = amount;
        fee.amount = 0;
        return  fee;
    };

    constexpr auto trade_fee = [](const asset& amount) -> asset {
        auto fee = amount;
        fee.amount = std::max((fee.amount + 999) / 1000LL, 1LL); // 0.1% fee (rounded up)
        return  fee;
    };

    constexpr auto issue_token_fee = [](const asset& a) -> asset {
        return no_fee(a);
    };

    constexpr auto burn_token_fee = [](const asset& a) -> asset {
        return issue_token_fee(a);
    };

    constexpr auto token_transfer_fee = [](const asset& amount) -> asset 
    {
        constexpr const int64_t transfer_fee_in_ram = 250;
        auto fee = amount;
        if(fee.symbol == EOS_SYMBOL) 
        {
            ds::ram_market rm;
            fee = rm.convert_to_eos(asset(transfer_fee_in_ram, RAM_SYMBOL));
        }
        else {
            fee.amount = transfer_fee_in_ram;
        }

        return fee;
    };

    constexpr auto cancel_order_fee = [](const asset& amount) -> asset {
        auto fee = asset(0'1000, EOS_SYMBOL);
        return  fee;
    };

    constexpr auto expedite_cancel_order_fee = [](const asset& amount) -> asset {
        auto fee = asset(1'0000, EOS_SYMBOL);
        return  fee;
    };


    // ram market fee of system contract (eosio.ram)
    // src: https://github.com/EOSIO/eos/blob/d7a6fd10ac0ab34595068f339f8b3d24a06f1db3/contracts/eosio.system/delegate_bandwidth.cpp#L111
    constexpr auto ram_market_fee = [](const asset& amount) -> asset {
        asset fee = amount;
        fee.amount = (fee.amount + 199 ) / 200; /// .5% fee (round up)
        return fee;
    };
}

