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

    // @abi action
    void getpriceof(uint32_t amount)
    {
        auto price = m_rm.get_ramprice();
        print_f("%KiB of RAM would cost: %\n", amount, price * amount);
    }

    // @abi action
    void buyram(account_name buyer, uint32_t quantity)
    {
        require_auth(buyer);
        m_rm.buyram(buyer, buyer, kibyte(quantity));
    }

    // @abi action
    void buyramfor(account_name buyer, account_name recipient, uint32_t quantity)
    {
        require_auth(buyer);
        m_rm.buyram(buyer, recipient, kibyte(quantity));
    }

    // @abi action
    void sellram(account_name seller, uint32_t quantity)
    {
        require_auth(seller);
        m_rm.sellram(seller, kibyte(quantity));
    }

    private:
        ram_market m_rm;
};

EOSIO_ABI( rammarket_test, (printramstate)(ramprice)(getpriceof)(buyram)(buyramfor)(sellram) );