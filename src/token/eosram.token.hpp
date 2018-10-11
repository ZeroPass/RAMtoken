#pragma once

#include <eosiolib/asset.hpp>
#include <eosiolib/eosio.hpp>
#include <eosiolib/symbol.hpp>
#include <eosiolib/types.hpp>

#include <string>

namespace eosram {

    using std::string;
    using eosio::asset;
    using eosio::contract;
    using eosio::symbol_name;
    using eosio::symbol_type;

    static constexpr auto RAM_SYMBOL = S(0, RAM);

    class token : public contract 
    {
    public:
        using contract::contract;

    //public_api:
        [[eosio::action]]
        void open(eosio::name owner, symbol_type symbol, eosio::name ram_payer);

        [[eosio::action]]
        void transfer(eosio::name from, eosio::name to, asset quantity, string memo);

        inline asset get_supply(symbol_type sym) const;
        inline asset get_balance(eosio::name owner, symbol_type sym) const;
        inline bool has_balance(eosio::name owner, symbol_type sym) const;

    //private_api:
        [[eosio::action]]
        void create(eosio::name issuer);

        [[eosio::action]]
        void issue(eosio::name to, asset quantity, string memo);

        [[eosio::action]]
        void burn(asset quantity, string memo);

    private:
        struct [[eosio::table]] account
        {
            asset    balance;
            uint64_t primary_key() const { return balance.symbol.name(); }
        };

        struct [[eosio::table]] currency_stat
        {
            asset       supply;
            asset       max_supply;
            eosio::name issuer;

            uint64_t primary_key() const { return supply.symbol.name(); }
        };

        typedef eosio::multi_index<"accounts"_n, account> accounts;
        typedef eosio::multi_index<"stat"_n, currency_stat> stats;

        void create_token(eosio::name issuer, asset maximum_supply);
        void transfer_token(eosio::name from, eosio::name to, eosio::name ram_payer, asset quantity, string memo);

        void sub_balance(eosio::name owner, asset value);
        void add_balance(eosio::name owner, asset value, eosio::name ram_payer);

    public:
        struct transfer_args
        {
            eosio::name  from;
            eosio::name  to;
            asset        quantity;
            string       memo;
        };
    };

    asset token::get_supply(symbol_type sym) const
    {
        stats statstable(_self, sym);
        const auto& st = statstable.get(sym.name());
        return st.supply;
    }

    asset token::get_balance(eosio::name owner, symbol_type sym) const
    {
        accounts accountstable(_self, owner);
        const auto& ac = accountstable.get(sym.name());
        return ac.balance;
    }

    bool token::has_balance(eosio::name owner, symbol_type sym) const
    {
        accounts accnt(_self, owner);
        return accnt.find(sym.name()) != accnt.end();
    }
} /// namespace eosram
