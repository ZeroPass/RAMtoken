#include <eosiolib/eosio.hpp>
#include "../../ram_market.hpp"

using namespace eosio;

struct rammarket_test : public eosio::contract 
{
    using eosio::contract::contract;

    // @abi action
    void printramstate()
    {
        auto es = m_rm.get_exchange_state();
        print_f("supply: %\nbase.balance: %\nbase.weight: %\nquote.balance:%\nquote.weight:%\n",
            es.supply, es.base.balance, es.base.weight, es.quote.balance, es.quote.weight
        );
    }

    // @abi action
    void ramprice()
    {
        auto price = m_rm.get_ramprice();
        print_f("Current RAM price: %/KiB\n", price);
    }

    private:
        ram_market m_rm;
};

EOSIO_ABI( rammarket_test, (printramstate)(ramprice) );