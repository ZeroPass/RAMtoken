#pragma once

#include <eosiolib/asset.hpp>
#include <eosiolib/eosio.hpp>
#include <eosiolib/name.hpp>
#include <eosiolib/symbol.hpp>
#include <string>

namespace eosram {

    using eosio::asset;
    using eosio::contract;
    using eosio::name;
    using eosio::symbol;
    using eosio::symbol_code;

    static constexpr auto RAM_SYMBOL = symbol(symbol_code("RAM"), 0);

    class [[eosio::contract("eosram.token")]] token : public contract 
    {
    public:
        using contract::contract;

    //public_api:
        [[eosio::action]]
        void open(name owner, const symbol& symbol, name ram_payer);

        [[eosio::action]]
        void close(name owner, const symbol& symbol);

        [[eosio::action]]
        void transfer(name from, name to, asset quantity, std::string memo);

        static asset get_supply(name ram_token_contract, symbol_code sym)
        {
            stats statstable(ram_token_contract, sym.raw());
            const auto& st = statstable.get(sym.raw());
            return st.supply;
        }

        static asset get_balance(name ram_token_contract, name owner, symbol_code sym)
        {
            accounts accnt(ram_token_contract, owner.value);
            const auto& ac = accnt.get(sym.raw());
            return ac.balance;
        }

        static bool has_balance(name ram_token_contract, name owner, symbol_code sym)
        {
            accounts accnt(ram_token_contract, owner.value);
            return accnt.find(sym.raw()) != accnt.end();
        }

    //private_api:
        [[eosio::action]]
        void create(name issuer);

        [[eosio::action]]
        void issue(name to, asset quantity, std::string memo);

        [[eosio::action]]
        void burn(asset quantity, std::string memo);

    private:
        struct [[eosio::table]] account
        {
            asset    balance;
            uint64_t primary_key() const { return balance.symbol.code().raw(); }
        };

        struct [[eosio::table]] currency_stat
        {
            asset       supply;
            asset       max_supply;
            eosio::name issuer;

            uint64_t primary_key() const { return supply.symbol.code().raw(); }
        };

        typedef eosio::multi_index<"accounts"_n, account> accounts;
        typedef eosio::multi_index<"stat"_n, currency_stat> stats;

        void create_token(eosio::name issuer, asset maximum_supply);
        void transfer_token(eosio::name from, name to, name ram_payer, asset quantity, std::string memo);

        void sub_balance(name owner, asset value);
        void add_balance(name owner, asset value, name ram_payer);
    };
} /// namespace eosram
