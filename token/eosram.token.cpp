#include "eosram.token.hpp"
#include "../constants.hpp"
#include "../log.hpp"
#include <utility>

using namespace eosram;
using namespace eosio;

constexpr int64_t init_max_supply = 100000000000000;


symbol_type token::symbol()
{
    static auto sym = RAM_SYMBOL;
    return sym;
}

void token::create(account_name issuer)
{
    create_token(issuer, asset(init_max_supply, RAM_SYMBOL));
}

void token::create_token(account_name issuer, asset maximum_supply)
{
    require_auth(_self);

    auto sym = maximum_supply.symbol;
    eosio_assert(sym.is_valid(), "invalid symbol name");
    eosio_assert(maximum_supply.is_valid(), "invalid supply");
    eosio_assert(maximum_supply.amount > 0, "max-supply must be positive");

    stats statstable(_self, sym.name());
    auto existing = statstable.find( sym.name() );
    eosio_assert( existing == statstable.end(), "token with symbol already exists" );

    statstable.emplace(_self, [&](auto& s) {
        s.supply.symbol = maximum_supply.symbol;
        s.max_supply    = maximum_supply;
        s.issuer        = issuer;
    });
}

void token::issue(account_name to, asset quantity, string memo)
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
    eosio_assert(quantity.amount <= st.max_supply.amount - st.supply.amount, "quantity exceeds available supply");

    statstable.modify(st, 0, [&]( auto& s) {
        s.supply += quantity;
    });

    add_balance( st.issuer, quantity, st.issuer );

    if(to != st.issuer) {
        SEND_INLINE_ACTION(*this, transfer, {st.issuer,N(active)}, {st.issuer, to, quantity, memo});
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

void token::signup(account_name account)
{
    auto null_value = asset(0, symbol());
    DEBUG_ASSERT(null_value.amount == 0, "Quantity exceeds signup allowance!"); // Sanity check

    auto sym_name = null_value.symbol.name();
    stats statstable( _self, sym_name );
    auto existing = statstable.find(sym_name);
    eosio_assert(existing != statstable.end(), "RAM token does not exist yet!");

    require_auth(account);
    require_recipient(account);

    accounts owner_acnts(_self, account);
    auto currency = owner_acnts.find(sym_name);
    eosio_assert(currency == owner_acnts.end(), "Account has already balance!");

    add_balance(account, null_value, /*payer=*/account);
}

void token::transfer(account_name from, account_name to, asset quantity, string memo)
{
    transfer_token(from, to, /*ram_payer=*/from, quantity, std::move(memo));
}

void token::transfer_token(account_name from, account_name to, account_name ram_payer, asset quantity, string memo)
{
    eosio_assert(from != to, "cannot transfer to self");
    require_auth(from);
    eosio_assert(is_account(to), "to account does not exist");

    auto sym = quantity.symbol.name();
    stats statstable(_self, sym);
    const auto& st = statstable.get(sym);

    require_recipient(from);
    require_recipient(to);

    eosio_assert(quantity.is_valid(), "invalid quantity");
    eosio_assert(quantity.amount > 0, "must transfer positive quantity");
    eosio_assert(quantity.symbol == st.supply.symbol, "symbol precision mismatch");
    eosio_assert(memo.size() <= 256, "memo has more than 256 bytes");

    sub_balance(from, quantity);
    add_balance(to, quantity, ram_payer);
}

void token::sub_balance(account_name owner, asset value)
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

void token::add_balance(account_name owner, asset value, account_name ram_payer)
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

EOSIO_ABI( eosram::token, (create)(issue)(burn)(transfer)(signup) );
