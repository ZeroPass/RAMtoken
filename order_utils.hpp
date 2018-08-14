#pragma once
#include <eosiolib/system.h>
#include <eosiolib/types.h>

#include "constants.hpp"
#include "types.hpp"

namespace eosram {

    /* Returns order id from transaction id */
    static order_id_t get_order_id(const transaction_id_type& txid)
    {
        static_assert(sizeof(order_id_t) == sizeof(uint64_t), "size mismatch!");
        const uint64_t* p64 = reinterpret_cast<const uint64_t*>(&txid);
        order_id_t order_id_l = p64[0] ^ p64[1];
        order_id_t order_id_r = p64[2] ^ p64[3];
        return order_id_l ^ order_id_r;
    }

    static bool ttl_infinite(ttl_t ttl) {
        return ttl <= infinite_ttl;
    }

    static bool ttl_valid(ttl_t ttl) {
        return ttl_infinite(ttl) || ttl >= min_ttl;
    }

   /**
    * Returns true if order has expired, otherwise false.
    * Order expires it's expiration time if greater than 0 and current time
    * is higher or equal than order expiration time.
    * 
    * @param order expiration time
    * @returns true/false
    */
    static bool order_expired(ttl_t time) {
        return time != 0 && now() >= time;
    }

   /** 
    * Returns order's expiration time based on current time and ttl.
    * If ttl is infinite than experation time is 0.
    * 
    * @param ttl
    * @returns order expiration time based on current time
    */
    static uint32_t get_order_expiration_time(ttl_t ttl) 
    {   
        eosio_assert(ttl_valid(ttl), "Invlid ttl!");
        return ttl_infinite(ttl) ? 0 : now() + ttl;
    }
}