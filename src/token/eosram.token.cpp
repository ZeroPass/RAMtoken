#include "eosram.token.hpp"
#ifndef ABIGEN
#include "../exchange/ds/exchange_state.hpp"
#endif
#include <utility>

using namespace eosram;
using namespace eosio;

void token::create(eosio::name issuer)
{
    static constexpr int64_t inf_supply = -1;
    create_token(issuer, asset(inf_supply, RAM_SYMBOL));
}

void token::create_token(eosio::name issuer, asset maximum_supply)
{
    require_auth(_self);

    auto sym = maximum_supply.symbol;
    eosio_assert(sym.is_valid(), "invalid RAM token symbol name");
    eosio_assert(maximum_supply.is_valid(), "invalid supply");

    stats statstable(_self, sym.name());
    auto existing = statstable.find(sym.name());
    eosio_assert( existing == statstable.end(), "token with symbol already exists" );

    statstable.emplace(_self, [&](auto& s) {
        s.supply.symbol = maximum_supply.symbol;
        s.max_supply    = maximum_supply;
        s.issuer        = issuer;
    });
}

void token::issue(eosio::name to, asset quantity, string memo)
{
    auto sym = quantity.symbol;
    eosio_assert(sym.is_valid(), "invalid symbol name");
    eosio_assert(memo.size() <= 256, "memo has more than 256 bytes");

    auto sym_name = sym.name();
    stats statstable(_self, sym_name);
    auto existing = statstable.find( sym_name );
    eosio_assert(existing != statstable.end(), "Invalid RAM token!");
    const auto& st = *existing;

    require_auth(st.issuer);
    eosio_assert(quantity.is_valid(), "invalid quantity");
    eosio_assert(quantity.amount > 0, "must issue positive quantity");

    eosio_assert(quantity.symbol == st.supply.symbol, "symbol precision mismatch");

    statstable.modify(st, 0, [&]( auto& s) {
        s.supply += quantity;
    });

    add_balance( st.issuer, quantity, st.issuer );

    if(to != st.issuer) {
        SEND_INLINE_ACTION(*this, transfer, {st.issuer, "active"_n}, {st.issuer, to, quantity, memo});
    }
}

void token::burn(asset quantity, string memo)
{
    auto sym = quantity.symbol;
    eosio_assert(sym.is_valid(), "Invalid symbol name");
    eosio_assert(memo.size() <= 256, "memo has more than 256 bytes");

    auto sym_name = sym.name();
    stats statstable(_self, sym_name);
    auto existing = statstable.find( sym_name );
    eosio_assert(existing != statstable.end(), "Invalid RAM token!");
    const auto& st = *existing;

    const auto& from = st.issuer;
    require_auth(from);
    require_recipient(from);
    eosio_assert(quantity.is_valid(), "Invalid quantity!");
    eosio_assert(quantity.amount > 0, "Must burn positive quantity!");

    eosio_assert(quantity.symbol == st.supply.symbol, "Symbol precision mismatch!");
    eosio_assert(quantity.amount <= st.supply.amount, "Quantity exceeds available supply!");

    sub_balance(from, quantity);
    statstable.modify(st, 0, [&](auto& s) {
        s.supply -= quantity;
    });
}

void token::open(eosio::name owner, symbol_type symbol, eosio::name ram_payer)
{
    require_auth(ram_payer);
    accounts acnts( _self, owner );
    auto it = acnts.find(symbol.name());
    if(it == acnts.end()) 
    {
        acnts.emplace( ram_payer, [&]( auto& a ){
            a.balance = asset{ 0, symbol };
        });
    }
}

void token::transfer(eosio::name from, eosio::name to, asset quantity, string memo)
{
    auto ram_payer = has_auth(to) ? to : from;
    transfer_token(from, to, ram_payer, quantity, std::move(memo));
}

void token::transfer_token(eosio::name from, eosio::name to, eosio::name ram_payer, asset quantity, string memo)
{
    eosio_assert(from != to, "cannot transfer to self");
    require_auth(from);
    eosio_assert(is_account(to), "to account does not exist");

    auto sym = quantity.symbol.name();
    stats statstable(_self, sym);
    const auto& st = statstable.get(sym);

    if(from != st.issuer || from != _self) 
    {
    #ifndef ABIGEN
        ds::exchange_state es(st.issuer);
        eosio_assert(es.get().exchange_running, "transfers are frozen");
    #else
        eosio_assert(false, "transfers are frozen");
    #endif
    }

    require_recipient(from);
    require_recipient(to);

    eosio_assert(quantity.is_valid(), "invalid quantity");
    eosio_assert(quantity.amount > 0, "must transfer positive quantity");
    eosio_assert(quantity.symbol == st.supply.symbol, "symbol precision mismatch");
    eosio_assert(memo.size() <= 256, "memo has more than 256 bytes");

    sub_balance(from, quantity);
    add_balance(to, quantity, ram_payer);
}

void token::sub_balance(eosio::name owner, asset value)
{
    accounts from_acnts(_self, owner);

    const auto& from = from_acnts.get(value.symbol.name(), "no balance object found");
    eosio_assert(from.balance.amount >= value.amount, "overdrawn balance");

    if(from.balance.amount == value.amount) {
        from_acnts.erase(from);
    } 
    else {
        from_acnts.modify(from, owner, [&](auto& a) {
            a.balance -= value;
        });
    }
}

void token::add_balance(eosio::name owner, asset value, eosio::name ram_payer)
{
    accounts to_acnts(_self, owner);
    auto to = to_acnts.find(value.symbol.name());
    if(to == to_acnts.end())
    {
        to_acnts.emplace(ram_payer, [&]( auto& a) {
            a.balance = value;
        });
    }
    else {
        to_acnts.modify( to, 0, [&](auto& a) {
            a.balance += value;
        });
    }
}

EOSIO_ABI( eosram::token, (create)(issue)(burn)(transfer)(open) );
