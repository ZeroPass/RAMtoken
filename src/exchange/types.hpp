#pragma once
#include <cstdint>
#include <eosiolib/types.h>

namespace eosram {
    using order_id_t = uint64_t;
    using ttl_t      = int32_t;
    using tx_id_t    = capi_checksum256;

    inline constexpr ttl_t minutes_to_ttl(int32_t minutes) {
#ifdef DEBUG
        return minutes; // return seconds
#else
        return ttl_t(minutes * 60);
#endif
    }
}