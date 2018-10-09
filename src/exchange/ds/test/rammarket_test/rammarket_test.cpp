#include <eosiolib/eosio.hpp>
#include "../../ram_market.hpp"

using namespace eosram::ds;
using namespace eosio;

struct rammarket_test : public eosio::contract 
{
    using eosio::contract::contract;

    // @abi action
    void printramstate()
    {
        auto es = m_rm.get_state();
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

    // @abi action
    void getpriceof(uint32_t amount)
    {
        auto price = m_rm.get_ramprice();
        print_f("%KiB of RAM would cost: %\n", amount, price * amount);
    }

    // @abi action
    void buyram(eosio::name buyer, uint32_t bytes)
    {
        require_auth(buyer);
        auto in_eos = m_rm.convert_to_eos(asset(bytes, S(0, RAM)));
        m_rm.buyram(buyer, buyer, in_eos);
    }

    // @abi action
    void buyramfor(eosio::name buyer, eosio::name recipient, uint32_t bytes)
    {
        require_auth(buyer);
        m_rm.buyrambytes(buyer, recipient, bytes);
    }

    // @abi action
    void sellram(eosio::name seller, uint32_t bytes)
    {
        require_auth(seller);
        m_rm.sellrambytes(seller, bytes);
    }

    // @abi action
    void convert(asset quantity)
    {
        asset c;
        asset c2;
        auto ram_price = m_rm.get_ramprice();
        if(quantity.symbol == CORE_SYMBOL) {
            c = m_rm.convert_to_ram(quantity);
            c2 = asset((quantity.amount * 1024) / ram_price.amount, S(0, RAM));
        } else {
            c = m_rm.convert_to_eos(quantity);
            c2 = asset(quantity.amount * ram_price.amount / 1024, CORE_SYMBOL);
        }

        print_f("% = %\n", quantity, c);
        print_f("% = %\n", quantity, c2);
    }

    private:
        ram_market m_rm;
};

EOSIO_ABI( rammarket_test, (printramstate)(ramprice)(getpriceof)(buyram)(buyramfor)(sellram)(convert) );