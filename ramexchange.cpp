#include "ramexchange.hpp"

using namespace eosio;
using namespace std;


namespace exchange{
	
ramexchange::ramexchange(account_name self) : contract(self)
{
}
	
static void transferToken(const account_name from, const account_name to, const eosio::asset amount, const std::string &memo)
{
	eosio_assert( memo.size() <= 256, "Memo has more than 256 bytes." );
	
	eosio::action(eosio::permission_level{from, N(active)}, N(eosio.token), N(transfer),
	std::make_tuple(from, to, amount, memo))
    .send();
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
	
	
	const auto offer = Offer{from, value, ttl, forceSell};

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
	
	
	const auto offer = Offer{from, value, ttl, forceSell};

	//add offer to the ladder of sell offers
	addToQueue(offer, sellLadder);
	
	//transfer EOS from caller to current account
    transferToken(from, _self, value, "RAM transfered to the RAMEXCHANGE smart contract.");
}


void ramexchange::getvalue()
{
	 //command to get from ram market
	 //./cleos.sh get table eosio eosio rammarket
	 // just calculate (quote.balance / base.balance) *1024 = RAM price per KB
	 //calculate fee: fee.amount = ( fee.amount + 199 ) / 200; /// .5% fee (round up)
}

void ramexchange::withdrawEOS(account_name to)
{
	require_auth(to);
	
	//checking accoung name
	eosio_assert(to == _self, "Cannot send to contract itself." );
	

	//transfer EOS to caller account
    transferToken(_self, to, asset(1), "EOS transfered to the RAMEXCHANGE smart contract.");
}

void ramexchange::withdrawRAM(account_name to)
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
		auto sellItem = getFromSellQueue();
		
	}
}

/*
*
* Queue functions - probably they go to the separate structure
*
*/

void ramexchange::addToQueue(Offer item, std::queue<Offer> queue)
{
	
}

ramexchange::Offer ramexchange::findInQueue(account_name acc)
{
	return Offer{acc, asset(1), 0, false};
}

ramexchange::Offer* ramexchange::getFromBuyQueue()
{
	return NULL;
}

ramexchange::Offer* ramexchange::getFromSellQueue()
{
	return NULL;
}

bool ramexchange::removeFromQueue(account_name account)
{
	return false;
}



} //exchange
