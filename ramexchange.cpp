#include "ramexchange.hpp"

using namespace eosio;
using namespace std;
using namespace exchange;

ramexchange::ramexchange(account_name self) : 
    contract(self)
{}

static void transferToken(const account_name from, const account_name to, const eosio::asset amount, const std::string &memo)
{
    eosio_assert( memo.size() <= 256, "Memo has more than 256 bytes." );
    
    eosio::action(eosio::permission_level{from, N(active)}, N(eosio.token), N(transfer),
    std::make_tuple(from, to, amount, memo))
    .send();
}

static void buyRam(const account_name account, const eosio::asset amount)
{
    //TODO: buyRam function
}

static void sellRam(const account_name account, const uint64_t bytes)
{
    //TODO: sellRam function
}

asset ramexchange::getLiveValue()
{
    return this->rm.get_ramprice();
}
    
void ramexchange::buy (account_name from, eosio::asset value, uint32_t ttl, bool forceSell)
{
    require_auth(from);
    
    //checking accoung name
    eosio_assert(from == _self, "Contract address cannot buy." );
    
    //checking the value (EOS)
    eosio_assert(value.symbol.is_valid(), "Invalid symbol name" );
    eosio_assert(value.symbol == string_to_symbol(4, "EOS"), "The value must be in EOS.");
    eosio_assert(value.is_valid(), "Unvalid quantity.");
    eosio_assert(value.amount > 0, "EOS quaninty must be positive.");
    
    
    const auto offer = Offer{ Offer::calculate_key(from, current_time()), from, value, ttl, forceSell};

    //add offer to the ladder of buy offers
    addToQueue(offer, buyLadder);
    
    //transfer EOS from caller to current account
    transferToken(from, _self, value, "EOS transfered to the RAMEXCHANGE smart contract.");
    
}

void ramexchange::sell (account_name from, eosio::asset value, uint32_t ttl, bool forceSell)
{
    require_auth(from);
    
    //checking accoung name
    eosio_assert(from == _self, "Contract address cannot buy." );
    
    //checking the value (EOS)
    eosio_assert(value.symbol.is_valid(), "Invalid symbol name" );
    eosio_assert(value.symbol == string_to_symbol(4, tokenSym), "The value must be in EOS.");
    eosio_assert(value.is_valid(), "Unvalid quantity.");
    eosio_assert(value.amount > 0, "Token quaninty must be positive.");
    
    
    const auto offer = Offer{ Offer::calculate_key(from, current_time()), from, value, ttl, forceSell};

    //add offer to the ladder of sell offers
    addToQueue(offer, sellLadder);
    
    //transfer EOS from caller to current account
    transferToken(from, _self, value, "RAM transfered to the RAMEXCHANGE smart contract.");
}


void ramexchange::getvalue()
{
    //i use this function to test snipets
    eosio::print(current_time());
    eosio::print("bula bulafdfsd");
    auto value = asset(2);//rm.get_ramprice();
    asset bula133 = getAmonutOfRamTokens(asset(1000), value);
    eosio::print( "bula bula");
    eosio::print( "Current RAM price: ", bula133 );
}

void ramexchange::withdraweos(account_name to)
{
    require_auth(to);
    
    //checking accoung name
    eosio_assert(to == _self, "Cannot send to contract itself." );
    
    //

    //transfer EOS to caller account
    transferToken(_self, to, asset(1), "EOS transfered to the RAMEXCHANGE smart contract.");
}

void ramexchange::withdraw_ram(account_name to)
{
    
}

void ramexchange::getvolume()
{
    
}

//runs every minute
void ramexchange::dotransfer()
{
    //if one or both sides are empty
    if (buyLadder.size() == 0 || sellLadder.size() == 0)
            return;
        
    while(buyLadder.size() > 0)
    {
        auto buyItem = getFromBuyQueue();
        eosio_assert(buyItem.value.amount == 0, "Unvalid value (zero)" );
        
        asset currentPrice = getLiveValue();
        asset tokenAmountRAM = getAmonutOfRamTokens(buyItem.value, currentPrice);
        
        while ( buyItem.value.amount > 0.0 )
        {
            auto sellItem = getFromSellQueue(); //just get not pop
            eosio_assert(sellItem.value.amount == 0, "Unvalid value (zero)" );
            
            asset tokenToTransfer = getMinimum(tokenAmountRAM, sellItem.value);
            
            //transfer RAM tokens from seller to buyer
            transferToken(sellItem.account, buyItem.account, tokenToTransfer, "RAM token transfered.");
            
            //if buy order is completed
            if (tokenAmountRAM == tokenToTransfer)
            {
                buyItem.value -= tokenToTransfer;
            }
            
            //if sell order is completed
            if (tokenAmountRAM == sellItem.value)
            {
                popFromSellQueue();
            }
            else
            {
                sellItem.value -= tokenToTransfer;
            }
        }
        popFromBuyQueue();	
    }
}

void ramexchange::doCleaning()
{
    //TODO: iterate through RAM and call system buy/sell ram if needed
    //if Offer::forced is true...if it is false then return asset to user
    //if TTL = -1 then leave that Offer in queue until user call withdraw
}


asset ramexchange::getMinimum(asset a, asset b)
{
    return (a < b ? a : b);
}


asset ramexchange::getAmonutOfRamTokens(asset a, asset price)
{
    //at the end we need to multiplicate with 1024 to get B ( from KiB )
    //we multiplicate with 1000 becuase or token has 3 decimal places
    return asset((a / price * 1024) * 1000, string_to_symbol(3, "RAM"));
}

/*
*
* Queue functions - probably they go to the separate structure
*
*/

void ramexchange::addToQueue(Offer item, std::queue<ramexchange::Offer> queue)
{
    //TODO:implement compatible to index_queue
}
            
ramexchange::Offer ramexchange::findInQueue(std::queue<ramexchange::Offer> queue, account_name acc)
{
    //TODO:implement compatible to index_queue
    return ramexchange::Offer{ Offer::calculate_key(acc, current_time()), acc, asset(1), 0, false};
}

ramexchange::Offer ramexchange::getFromBuyQueue()
{
    //TODO:implement compatible to index_queue
    account_name acc = N('bula');
    return ramexchange::Offer{ Offer::calculate_key(acc, current_time()), acc, asset(1), 0, false};
}

ramexchange::Offer ramexchange::getFromSellQueue()
{
    //TODO:implement compatible to index_queue
    account_name acc = N('bula');
    return ramexchange::Offer{ Offer::calculate_key(acc, current_time()), acc, asset(1), 0, false};
}

bool ramexchange::removeFromQueue(account_name account)
{
    //TODO:implement compatible to index_queue
    return false;
}

bool ramexchange::popFromBuyQueue()
{
    //TODO:implement compatible to index_queue
    return false;
}

bool ramexchange::popFromSellQueue()
{
    //TODO:implement compatible to index_queue
    return false;
}