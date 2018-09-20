# EOS RAMtoken
## Contract actions
  
You can either use
###Transfer with memo  
[missing]


Or 
### Public actions:  
`buy (buyer, value, ttl, force_buy)`  -> needs extra permission  
`sell (seller, value, ttl, force_sell)`   -> needs extra permission  
`cancel (order_id)`   *// cancels order by order id*  
`cancelbytxid (txid)` *// cancels order by transaction id*  

### Private actions (requires exchange owner):  

`init(fee_recipient)`		*// Initialize exchange*  
`setfeerecip(account)`	*// Sets fee recipient account*  
`setproxy(proxy)`			*// Sets transfer proxy contract*  
`start()`					*// Unfreezes exchange (requires admin permission)*  
`stop()`					*// Freezes exchange and RAM token transfer (requires admin permission)*  
`clrallorders(reason)`	 *// Clears order books and returns funds to traders (requires admin permission)*  
`clrorders(sym, reason)`	*// Clears order book of token and returns funds to traders (requires admin permission)*  


## Accounts

#### Mainet
Exchange: `ramtokendapp`  
Exchange fee: `ramtokenfees`  
Transfer proxy: `proxytransax`  


#### CryptoKylin testnet:
Exchange: `eramexchange`  
Exchange fee: `ramxchangfee`  
Transfer proxy: `proxytransax`  


## Permissions  

Exchange account  
*• owner, admin, active* 
  
Token account  
*• active*  
  
Fee account  
*• active*  

