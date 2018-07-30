#include <algorithm>
#include <cmath>
#include <eosiolib/asset.hpp>
#include <eosiolib/currency.hpp>
#include <eosiolib/eosio.hpp>
#include <eosiolib/public_key.hpp>
#include <eosiolib/print.hpp>
#include "ds/ram_market.hpp"
#include "ds/index_queue.hpp"

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
			void withdraw_eos(account_name to);
			//withdraw expired RAM tokens
			//@abi action
			void withdraw_ram(account_name to);
			//get current account volume
			//@abi action
			void getvolume();
			//do transaction - merge matches - it the future it goes to the private
			//@abi action
			void dotransfer();
			//remove entries with expired TTL - if needed buy/sell ram on EOS market
			//@abi action
			void doCleaning();
			
			
		private:
			eosio::ram_market rm;
			
			//@abi table
			struct Offer {
				uint64_t key;
				account_name account;
				eosio::asset value;
				uint32_t ttl;
				bool forced;
				
				constexpr bool operator == (const Offer& qv) const { 
					return account == qv.account && value == qv.value;
				}
				constexpr bool operator != (const Offer& qv) { return !(*this == qv); }
				uint64_t get_key() const { return key; }
				static uint64_t calculate_key(account_name account, uint64_t timestamp)
				{
					//TODO: implement that function will combine account and timestamp and then make hash of them together
					return timestamp;
				}
				
				EOSLIB_SERIALIZE(Offer, (account)(value)(ttl)(forced))
			};
			
			
			static constexpr uint64_t index_key = N("key");
			typedef eosio::index_queue<N(ladder),
				Offer, 
				eosio::indexed_by<index_key, eosio::const_mem_fun<Offer, uint64_t, &Offer::get_key>>
				> Ladder;
				
			//Ladder ladderBuy;
			//Ladder ladderSell;
				
			eosio::asset getLiveValue();
			eosio::asset getMinimum(eosio::asset a, eosio::asset b);
			eosio::asset getAmonutOfRamTokens(eosio::asset a, eosio::asset price);
			
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
			//iterate through queue and return found item (Account key is search key)
			Offer findInQueue(std::queue<Offer> queue, account_name acc);
			//get element (FIFO rules)
			Offer getFromBuyQueue();
			//get element (FIFO rules)
			Offer getFromSellQueue();
			//remove an item from queue - return false if it was not removed and vice versa
			bool removeFromQueue(account_name account);
			
			bool popFromBuyQueue();
			bool popFromSellQueue();
	
	};
	EOSIO_ABI( ramexchange, (buy)(sell)(getvalue)(withdraw_eos)(withdraw_ram)(getvolume)(dotransfer));
} // exchange