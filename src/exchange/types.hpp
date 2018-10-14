#pragma once
#include <cstdint>
#include <eosiolib/types.h>

namespace eosram {
    using order_id_t = uint64_t;
    using ttl_t      = int32_t;
    using tx_id_t    = capi_checksum256;
}