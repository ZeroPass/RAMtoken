# EOS RAMtoken
RAM token is fully backed by EOS system RAM bytes.

## Contract Actions

You can either use:
### Transfer With Memo
Send either EOS (to buy RAM) or RAM (to sell RAM)  
And then put in the memo one of the options;  
`ttl,convert`(waits in the exchange for a buyer, if not matched, converts on tll expire)  
`ttl` (0-uint32 in minutes, waits on exchange, if not matched, send back on tll expire)  
`[null]` and then `ttl,cancel:txid”64 characters”` (without the quotes) to cancel it/withdraw  

Or:
### Public Actions:
`buy (buyer, value, ttl, force_buy)`  -> needs extra permission  
`sell (seller, value, ttl, force_sell)`   -> needs extra permission  
`cancel (order_id)`   *// cancels order by order id*  
`cancelbytxid (txid)` *// cancels order by transaction id*  

### Private Actions (requires exchange owner):

`init(fee_recipient)`		*// Initialize exchange*  
`setfeerecip(account)`	*// Sets fee recipient account*  
`setproxy(proxy)`			*// Sets transfer proxy contract*  
`start()`					*// Unfreezes exchange (requires admin permission)*  
`stop()`					*// Freezes exchange and RAM token transfer (requires admin permission)*  
`clrallorders(reason)`	 *// Clears order books and returns funds to traders (requires admin permission)*  
`clrorders(sym, reason)`	*// Clears order book of token and returns funds to traders (requires admin permission)*  

## Accounts

#### Mainnet
**[ramtoken.io](https://ramtoken.io/)**  

Exchange: [ramtokendapp](https://bloks.io/account/ramtokendapp)  
Token: [ramtokenmoon](https://bloks.io/account/ramtokenmoon)  
Exchange fee: [ramtokenfees](https://bloks.io/account/ramtokenfees)  
Transfer proxy: [proxytransax](https://bloks.io/account/proxytransax)  

#### CryptoKylin Testnet
**[kylin.ramtoken.io](https://kylin.ramtoken.io/)**  

Exchange: [eramexchange](https://kylin.bloks.io/account/eramexchange)  
Token: [ramramramtkn](https://kylin.bloks.io/account/ramramramtkn)  
Exchange fee: [ramxchangfee](https://kylin.bloks.io/account/ramxchangfee)  
Transfer proxy: [proxytransax](https://kylin.bloks.io/account/proxytransax)  

#### Jungle Testnet
Exchange: [eramexchange](https://jungle.bloks.io/account/eramexchange)  
Token: [ramramramtkn](https://jungle.bloks.io/account/ramramramtkn)  
Exchange fee: [ramxchangfee](https://jungle.bloks.io/account/ramxchangfee)  
Transfer proxy: [proxytransax](https://jungle.bloks.io/account/proxytransax)  

## Permissions

Exchange account  
* owner, admin, active  
  
Token account  
* active  
  
Fee account  
* active  

## Ricardian Contract
This exchange and token deployment is subject to [Ricardian Contract](https://github.com/ChainRift/RAMtoken/blob/master/bin/exchange/eosram.exchange_rc.md).
This Ricardian Contract is writen in the spirit of "v2 constitution".

