#include <algorithm>
#include <cmath>
#include <eosiolib/asset.hpp>
#include <eosiolib/currency.hpp>
#include <eosiolib/eosio.hpp>
#include <eosiolib/public_key.hpp>
#include <eosiolib/print.hpp>

#include <string>
#include <queue>

#define tokenSym "RAM"

namespace exchange {
	
	class ramexchange : public eosio::contract {
		public:
			ramexchange(account_name self);
			
			//buy RAM token
			//if ttl is 0(zero) we wont remove order from queue (if you want to get your tokens back, just call withdraw)
			//@abi action
			void buy (account_name from, eosio::asset value, uint32_t ttl, bool forceSell);
			//sell RAM token
			//@abi action
			void sell (account_name from, eosio::asset value, uint32_t ttl, bool forceSell);
			//get actual RAM price (Bancor algorithm)
			//@abi action
			void getvalue();
			//withdraw expired EOS tokens
			//@abi action
			void withdrawEOS(account_name to);
			//withdraw expired RAM tokens
			//@abi action
			void withdrawRAM(account_name to);
			//get current account volume
			//@abi action
			void getvolume();
			//do transaction - merge matches, remove entries with expired TTL - it the future it goes to the private
			//@abi action
			void dotransfer();
			
			
		private:
			
			//@abi table
			struct Offer {
				account_name supply;
				eosio::asset value;
				uint32_t ttl;
				bool forced;

				EOSLIB_SERIALIZE(Offer, (supply)(value)(ttl)(forced))
			};
			
			
			//just temp queue structure
			std::queue<Offer> buyLadder;
			std::queue<Offer> sellLadder;
			
			
			/*
			*
			* Queue functions - probably they go to the separate structure
			*
			*/
			//add item to the queue
			void addToQueue(Offer item, std::queue<Offer> queue);
			//iterate through queue and return found item (Offer is search key)
			Offer findInQueue(Offer offer);
			//iterate through queue and return found item (Account key is search key)
			Offer findInQueue(account_name acc);
			//get element (FIFO rules)
			Offer* getFromBuyQueue();
			//get element (FIFO rules)
			Offer* getFromSellQueue();
			//remove an item from queue - return false if it was not removed and vice versa
			bool removeFromQueue(account_name account);
			
			bool popFromBuyQueue();
			bool popFromSellQueue();
	
	};
	EOSIO_ABI( ramexchange, (buy)(sell)(getvalue)(withdrawEOS)(withdrawRAM)(getvolume)(dotransfer));
} // exchange