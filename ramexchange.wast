(module
 (type $FUNCSIG$vijiii (func (param i32 i64 i32 i32 i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vij (func (param i32 i64)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$j (func (result i64)))
 (type $FUNCSIG$vjj (func (param i64 i64)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$iiii (func (param i32 i32 i32) (result i32)))
 (type $FUNCSIG$ijjjj (func (param i64 i64 i64 i64) (result i32)))
 (type $FUNCSIG$i (func (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$vj (func (param i64)))
 (import "env" "abort" (func $abort))
 (import "env" "action_data_size" (func $action_data_size (result i32)))
 (import "env" "current_time" (func $current_time (result i64)))
 (import "env" "db_get_i64" (func $db_get_i64 (param i32 i32 i32) (result i32)))
 (import "env" "db_lowerbound_i64" (func $db_lowerbound_i64 (param i64 i64 i64 i64) (result i32)))
 (import "env" "eosio_assert" (func $eosio_assert (param i32 i32)))
 (import "env" "memcpy" (func $memcpy (param i32 i32 i32) (result i32)))
 (import "env" "memmove" (func $memmove (param i32 i32 i32) (result i32)))
 (import "env" "printi" (func $printi (param i64)))
 (import "env" "prints" (func $prints (param i32)))
 (import "env" "prints_l" (func $prints_l (param i32 i32)))
 (import "env" "printui" (func $printui (param i64)))
 (import "env" "read_action_data" (func $read_action_data (param i32 i32) (result i32)))
 (import "env" "require_auth" (func $require_auth (param i64)))
 (import "env" "require_auth2" (func $require_auth2 (param i64 i64)))
 (import "env" "send_inline" (func $send_inline (param i32 i32)))
 (table 8 8 anyfunc)
 (elem (i32.const 0) $__wasm_nullptr $_ZN8exchange11ramexchange10dotransferEv $_ZN8exchange11ramexchange12withdraw_ramEy $_ZN8exchange11ramexchange9getvolumeEv $_ZN8exchange11ramexchange3buyEyN5eosio5assetEmb $_ZN8exchange11ramexchange4sellEyN5eosio5assetEmb $_ZN8exchange11ramexchange12withdraw_eosEy $_ZN8exchange11ramexchange8getvalueEv)
 (memory $0 1)
 (data (i32.const 4) "@f\00\00")
 (data (i32.const 16) "onerror\00")
 (data (i32.const 32) "eosio\00")
 (data (i32.const 48) "onerror action\'s are only valid from the \"eosio\" system account\00")
 (data (i32.const 112) "invalid symbol name\00")
 (data (i32.const 144) "Unvalid value (zero)\00")
 (data (i32.const 176) "comparison of assets with different symbols is not allowed\00")
 (data (i32.const 240) "RAM token transfered.\00")
 (data (i32.const 272) "attempt to subtract asset with different symbol\00")
 (data (i32.const 320) "subtraction underflow\00")
 (data (i32.const 352) "subtraction overflow\00")
 (data (i32.const 384) "magnitude of asset amount must be less than 2^62\00")
 (data (i32.const 448) "Could not get ram excgange state!\00")
 (data (i32.const 496) "multiplication overflow or underflow\00")
 (data (i32.const 544) "multiplication underflow\00")
 (data (i32.const 576) "multiplication overflow\00")
 (data (i32.const 608) "Could not calculate valid RAM price!\00")
 (data (i32.const 656) "error reading iterator\00")
 (data (i32.const 688) "read\00")
 (data (i32.const 704) "\'bula\'\00")
 (data (i32.const 720) "Memo has more than 256 bytes.\00")
 (data (i32.const 752) "active\00")
 (data (i32.const 768) "eosio.token\00")
 (data (i32.const 784) "transfer\00")
 (data (i32.const 800) "write\00")
 (data (i32.const 816) "Cannot send to contract itself.\00")
 (data (i32.const 848) "EOS transfered to the RAMEXCHANGE smart contract.\00")
 (data (i32.const 912) "bula bulafdfsd\00")
 (data (i32.const 928) "bula bula\00")
 (data (i32.const 944) "Current RAM price: \00")
 (data (i32.const 976) ".\00")
 (data (i32.const 992) " \00")
 (data (i32.const 1008) ",\00")
 (data (i32.const 1024) "Contract address cannot buy.\00")
 (data (i32.const 1056) "Invalid symbol name\00")
 (data (i32.const 1088) "Unvalid quantity.\00")
 (data (i32.const 1120) "Token quaninty must be positive.\00")
 (data (i32.const 1168) "RAM transfered to the RAMEXCHANGE smart contract.\00")
 (data (i32.const 1232) "The value must be in EOS.\00")
 (data (i32.const 1264) "EOS quaninty must be positive.\00")
 (data (i32.const 9696) "malloc_from_freed was designed to only be called after _heap was completely allocated\00")
 (export "memory" (memory $0))
 (export "_ZeqRK11checksum256S1_" (func $_ZeqRK11checksum256S1_))
 (export "_ZeqRK11checksum160S1_" (func $_ZeqRK11checksum160S1_))
 (export "_ZneRK11checksum160S1_" (func $_ZneRK11checksum160S1_))
 (export "now" (func $now))
 (export "_ZN5eosio12require_authERKNS_16permission_levelE" (func $_ZN5eosio12require_authERKNS_16permission_levelE))
 (export "apply" (func $apply))
 (export "_ZN8exchange11ramexchange3buyEyN5eosio5assetEmb" (func $_ZN8exchange11ramexchange3buyEyN5eosio5assetEmb))
 (export "_ZN8exchange11ramexchange4sellEyN5eosio5assetEmb" (func $_ZN8exchange11ramexchange4sellEyN5eosio5assetEmb))
 (export "_ZN8exchange11ramexchange8getvalueEv" (func $_ZN8exchange11ramexchange8getvalueEv))
 (export "_ZN8exchange11ramexchange12withdraw_eosEy" (func $_ZN8exchange11ramexchange12withdraw_eosEy))
 (export "_ZN8exchange11ramexchange12withdraw_ramEy" (func $_ZN8exchange11ramexchange12withdraw_ramEy))
 (export "_ZN8exchange11ramexchange9getvolumeEv" (func $_ZN8exchange11ramexchange9getvolumeEv))
 (export "_ZN8exchange11ramexchange10dotransferEv" (func $_ZN8exchange11ramexchange10dotransferEv))
 (export "_ZN8exchange11ramexchange16getFromSellQueueEv" (func $_ZN8exchange11ramexchange16getFromSellQueueEv))
 (export "_ZN8exchange11ramexchange15getFromBuyQueueEv" (func $_ZN8exchange11ramexchange15getFromBuyQueueEv))
 (export "_ZN8exchange11ramexchangeC2Ey" (func $_ZN8exchange11ramexchangeC2Ey))
 (export "_ZN8exchange11ramexchange12getLiveValueEv" (func $_ZN8exchange11ramexchange12getLiveValueEv))
 (export "_ZN8exchange11ramexchange10addToQueueENS0_5OfferENSt3__15queueIS1_NS2_5dequeIS1_NS2_9allocatorIS1_EEEEEE" (func $_ZN8exchange11ramexchange10addToQueueENS0_5OfferENSt3__15queueIS1_NS2_5dequeIS1_NS2_9allocatorIS1_EEEEEE))
 (export "_ZN8exchange11ramexchange20getAmonutOfRamTokensEN5eosio5assetES2_" (func $_ZN8exchange11ramexchange20getAmonutOfRamTokensEN5eosio5assetES2_))
 (export "_ZN8exchange11ramexchange10getMinimumEN5eosio5assetES2_" (func $_ZN8exchange11ramexchange10getMinimumEN5eosio5assetES2_))
 (export "_ZN8exchange11ramexchange16popFromSellQueueEv" (func $_ZN8exchange11ramexchange16popFromSellQueueEv))
 (export "_ZN8exchange11ramexchange15popFromBuyQueueEv" (func $_ZN8exchange11ramexchange15popFromBuyQueueEv))
 (export "_ZN8exchange11ramexchange10doCleaningEv" (func $_ZN8exchange11ramexchange10doCleaningEv))
 (export "_ZN8exchange11ramexchange11findInQueueENSt3__15queueINS0_5OfferENS1_5dequeIS3_NS1_9allocatorIS3_EEEEEEy" (func $_ZN8exchange11ramexchange11findInQueueENSt3__15queueINS0_5OfferENS1_5dequeIS3_NS1_9allocatorIS3_EEEEEEy))
 (export "_ZN8exchange11ramexchange15removeFromQueueEy" (func $_ZN8exchange11ramexchange15removeFromQueueEy))
 (export "malloc" (func $malloc))
 (export "free" (func $free))
 (export "memcmp" (func $memcmp))
 (export "strlen" (func $strlen))
 (func $_ZeqRK11checksum256S1_ (param $0 i32) (param $1 i32) (result i32)
  (i32.eqz
   (call $memcmp
    (get_local $0)
    (get_local $1)
    (i32.const 32)
   )
  )
 )
 (func $_ZeqRK11checksum160S1_ (param $0 i32) (param $1 i32) (result i32)
  (i32.eqz
   (call $memcmp
    (get_local $0)
    (get_local $1)
    (i32.const 32)
   )
  )
 )
 (func $_ZneRK11checksum160S1_ (param $0 i32) (param $1 i32) (result i32)
  (i32.ne
   (call $memcmp
    (get_local $0)
    (get_local $1)
    (i32.const 32)
   )
   (i32.const 0)
  )
 )
 (func $now (result i32)
  (i32.wrap/i64
   (i64.div_u
    (call $current_time)
    (i64.const 1000000)
   )
  )
 )
 (func $_ZN5eosio12require_authERKNS_16permission_levelE (param $0 i32)
  (call $require_auth2
   (i64.load
    (get_local $0)
   )
   (i64.load offset=8
    (get_local $0)
   )
  )
 )
 (func $apply (param $0 i64) (param $1 i64) (param $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $12
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 208)
    )
   )
  )
  (set_local $4
   (i64.const 0)
  )
  (set_local $3
   (i64.const 59)
  )
  (set_local $10
   (i32.const 16)
  )
  (set_local $5
   (i64.const 0)
  )
  (loop $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_if $label$5
         (i64.gt_u
          (get_local $4)
          (i64.const 6)
         )
        )
        (br_if $label$4
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $9
             (i32.load8_s
              (get_local $10)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $9
         (i32.add
          (get_local $9)
          (i32.const 165)
         )
        )
        (br $label$3)
       )
       (set_local $6
        (i64.const 0)
       )
       (br_if $label$2
        (i64.le_u
         (get_local $4)
         (i64.const 11)
        )
       )
       (br $label$1)
      )
      (set_local $9
       (select
        (i32.add
         (get_local $9)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $9)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $6
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $9)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $6
     (i64.shl
      (i64.and
       (get_local $6)
       (i64.const 31)
      )
      (i64.and
       (get_local $3)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $10
    (i32.add
     (get_local $10)
     (i32.const 1)
    )
   )
   (set_local $4
    (i64.add
     (get_local $4)
     (i64.const 1)
    )
   )
   (set_local $5
    (i64.or
     (get_local $6)
     (get_local $5)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $3
      (i64.add
       (get_local $3)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (block $label$6
   (br_if $label$6
    (i64.ne
     (get_local $5)
     (get_local $2)
    )
   )
   (set_local $4
    (i64.const 0)
   )
   (set_local $3
    (i64.const 59)
   )
   (set_local $10
    (i32.const 32)
   )
   (set_local $5
    (i64.const 0)
   )
   (loop $label$7
    (block $label$8
     (block $label$9
      (block $label$10
       (block $label$11
        (block $label$12
         (br_if $label$12
          (i64.gt_u
           (get_local $4)
           (i64.const 4)
          )
         )
         (br_if $label$11
          (i32.gt_u
           (i32.and
            (i32.add
             (tee_local $9
              (i32.load8_s
               (get_local $10)
              )
             )
             (i32.const -97)
            )
            (i32.const 255)
           )
           (i32.const 25)
          )
         )
         (set_local $9
          (i32.add
           (get_local $9)
           (i32.const 165)
          )
         )
         (br $label$10)
        )
        (set_local $6
         (i64.const 0)
        )
        (br_if $label$9
         (i64.le_u
          (get_local $4)
          (i64.const 11)
         )
        )
        (br $label$8)
       )
       (set_local $9
        (select
         (i32.add
          (get_local $9)
          (i32.const 208)
         )
         (i32.const 0)
         (i32.lt_u
          (i32.and
           (i32.add
            (get_local $9)
            (i32.const -49)
           )
           (i32.const 255)
          )
          (i32.const 5)
         )
        )
       )
      )
      (set_local $6
       (i64.shr_s
        (i64.shl
         (i64.extend_u/i32
          (get_local $9)
         )
         (i64.const 56)
        )
        (i64.const 56)
       )
      )
     )
     (set_local $6
      (i64.shl
       (i64.and
        (get_local $6)
        (i64.const 31)
       )
       (i64.and
        (get_local $3)
        (i64.const 4294967295)
       )
      )
     )
    )
    (set_local $10
     (i32.add
      (get_local $10)
      (i32.const 1)
     )
    )
    (set_local $4
     (i64.add
      (get_local $4)
      (i64.const 1)
     )
    )
    (set_local $5
     (i64.or
      (get_local $6)
      (get_local $5)
     )
    )
    (br_if $label$7
     (i64.ne
      (tee_local $3
       (i64.add
        (get_local $3)
        (i64.const -5)
       )
      )
      (i64.const -6)
     )
    )
   )
   (call $eosio_assert
    (i64.eq
     (get_local $5)
     (get_local $1)
    )
    (i32.const 48)
   )
  )
  (block $label$13
   (block $label$14
    (br_if $label$14
     (i64.eq
      (get_local $1)
      (get_local $0)
     )
    )
    (set_local $4
     (i64.const 0)
    )
    (set_local $3
     (i64.const 59)
    )
    (set_local $10
     (i32.const 16)
    )
    (set_local $5
     (i64.const 0)
    )
    (loop $label$15
     (block $label$16
      (block $label$17
       (block $label$18
        (block $label$19
         (block $label$20
          (br_if $label$20
           (i64.gt_u
            (get_local $4)
            (i64.const 6)
           )
          )
          (br_if $label$19
           (i32.gt_u
            (i32.and
             (i32.add
              (tee_local $9
               (i32.load8_s
                (get_local $10)
               )
              )
              (i32.const -97)
             )
             (i32.const 255)
            )
            (i32.const 25)
           )
          )
          (set_local $9
           (i32.add
            (get_local $9)
            (i32.const 165)
           )
          )
          (br $label$18)
         )
         (set_local $6
          (i64.const 0)
         )
         (br_if $label$17
          (i64.le_u
           (get_local $4)
           (i64.const 11)
          )
         )
         (br $label$16)
        )
        (set_local $9
         (select
          (i32.add
           (get_local $9)
           (i32.const 208)
          )
          (i32.const 0)
          (i32.lt_u
           (i32.and
            (i32.add
             (get_local $9)
             (i32.const -49)
            )
            (i32.const 255)
           )
           (i32.const 5)
          )
         )
        )
       )
       (set_local $6
        (i64.shr_s
         (i64.shl
          (i64.extend_u/i32
           (get_local $9)
          )
          (i64.const 56)
         )
         (i64.const 56)
        )
       )
      )
      (set_local $6
       (i64.shl
        (i64.and
         (get_local $6)
         (i64.const 31)
        )
        (i64.and
         (get_local $3)
         (i64.const 4294967295)
        )
       )
      )
     )
     (set_local $10
      (i32.add
       (get_local $10)
       (i32.const 1)
      )
     )
     (set_local $4
      (i64.add
       (get_local $4)
       (i64.const 1)
      )
     )
     (set_local $5
      (i64.or
       (get_local $6)
       (get_local $5)
      )
     )
     (br_if $label$15
      (i64.ne
       (tee_local $3
        (i64.add
         (get_local $3)
         (i64.const -5)
        )
       )
       (i64.const -6)
      )
     )
    )
    (br_if $label$13
     (i64.ne
      (get_local $5)
      (get_local $2)
     )
    )
   )
   (i64.store offset=112
    (get_local $12)
    (get_local $0)
   )
   (set_local $4
    (i64.const 0)
   )
   (set_local $3
    (i64.const 59)
   )
   (set_local $10
    (i32.const 32)
   )
   (set_local $5
    (i64.const 0)
   )
   (loop $label$21
    (block $label$22
     (block $label$23
      (block $label$24
       (block $label$25
        (block $label$26
         (br_if $label$26
          (i64.gt_u
           (get_local $4)
           (i64.const 4)
          )
         )
         (br_if $label$25
          (i32.gt_u
           (i32.and
            (i32.add
             (tee_local $9
              (i32.load8_s
               (get_local $10)
              )
             )
             (i32.const -97)
            )
            (i32.const 255)
           )
           (i32.const 25)
          )
         )
         (set_local $9
          (i32.add
           (get_local $9)
           (i32.const 165)
          )
         )
         (br $label$24)
        )
        (set_local $6
         (i64.const 0)
        )
        (br_if $label$23
         (i64.le_u
          (get_local $4)
          (i64.const 11)
         )
        )
        (br $label$22)
       )
       (set_local $9
        (select
         (i32.add
          (get_local $9)
          (i32.const 208)
         )
         (i32.const 0)
         (i32.lt_u
          (i32.and
           (i32.add
            (get_local $9)
            (i32.const -49)
           )
           (i32.const 255)
          )
          (i32.const 5)
         )
        )
       )
      )
      (set_local $6
       (i64.shr_s
        (i64.shl
         (i64.extend_u/i32
          (get_local $9)
         )
         (i64.const 56)
        )
        (i64.const 56)
       )
      )
     )
     (set_local $6
      (i64.shl
       (i64.and
        (get_local $6)
        (i64.const 31)
       )
       (i64.and
        (get_local $3)
        (i64.const 4294967295)
       )
      )
     )
    )
    (set_local $10
     (i32.add
      (get_local $10)
      (i32.const 1)
     )
    )
    (set_local $4
     (i64.add
      (get_local $4)
      (i64.const 1)
     )
    )
    (set_local $5
     (i64.or
      (get_local $6)
      (get_local $5)
     )
    )
    (br_if $label$21
     (i64.ne
      (tee_local $3
       (i64.add
        (get_local $3)
        (i64.const -5)
       )
      )
      (i64.const -6)
     )
    )
   )
   (set_local $4
    (i64.const 0)
   )
   (set_local $3
    (i64.const 59)
   )
   (set_local $10
    (i32.const 32)
   )
   (set_local $0
    (i64.const 0)
   )
   (loop $label$27
    (block $label$28
     (block $label$29
      (block $label$30
       (block $label$31
        (block $label$32
         (br_if $label$32
          (i64.gt_u
           (get_local $4)
           (i64.const 4)
          )
         )
         (br_if $label$31
          (i32.gt_u
           (i32.and
            (i32.add
             (tee_local $9
              (i32.load8_s
               (get_local $10)
              )
             )
             (i32.const -97)
            )
            (i32.const 255)
           )
           (i32.const 25)
          )
         )
         (set_local $9
          (i32.add
           (get_local $9)
           (i32.const 165)
          )
         )
         (br $label$30)
        )
        (set_local $6
         (i64.const 0)
        )
        (br_if $label$29
         (i64.le_u
          (get_local $4)
          (i64.const 11)
         )
        )
        (br $label$28)
       )
       (set_local $9
        (select
         (i32.add
          (get_local $9)
          (i32.const 208)
         )
         (i32.const 0)
         (i32.lt_u
          (i32.and
           (i32.add
            (get_local $9)
            (i32.const -49)
           )
           (i32.const 255)
          )
          (i32.const 5)
         )
        )
       )
      )
      (set_local $6
       (i64.shr_s
        (i64.shl
         (i64.extend_u/i32
          (get_local $9)
         )
         (i64.const 56)
        )
        (i64.const 56)
       )
      )
     )
     (set_local $6
      (i64.shl
       (i64.and
        (get_local $6)
        (i64.const 31)
       )
       (i64.and
        (get_local $3)
        (i64.const 4294967295)
       )
      )
     )
    )
    (set_local $10
     (i32.add
      (get_local $10)
      (i32.const 1)
     )
    )
    (set_local $4
     (i64.add
      (get_local $4)
      (i64.const 1)
     )
    )
    (set_local $0
     (i64.or
      (get_local $6)
      (get_local $0)
     )
    )
    (br_if $label$27
     (i64.ne
      (tee_local $3
       (i64.add
        (get_local $3)
        (i64.const -5)
       )
      )
      (i64.const -6)
     )
    )
   )
   (i64.store
    (i32.add
     (get_local $12)
     (i32.const 128)
    )
    (get_local $0)
   )
   (i64.store
    (i32.add
     (get_local $12)
     (i32.const 136)
    )
    (i64.const -1)
   )
   (i64.store
    (i32.add
     (get_local $12)
     (i32.const 144)
    )
    (i64.const 0)
   )
   (i32.store
    (i32.add
     (get_local $12)
     (i32.const 152)
    )
    (i32.const 0)
   )
   (i64.store offset=120
    (get_local $12)
    (get_local $5)
   )
   (i32.store offset=160
    (get_local $12)
    (i32.const 0)
   )
   (i32.store
    (i32.add
     (get_local $12)
     (i32.const 164)
    )
    (i32.const 0)
   )
   (i32.store
    (i32.add
     (get_local $12)
     (i32.const 168)
    )
    (i32.const 0)
   )
   (i32.store
    (i32.add
     (get_local $12)
     (i32.const 172)
    )
    (i32.const 0)
   )
   (i32.store
    (i32.add
     (get_local $12)
     (i32.const 176)
    )
    (i32.const 0)
   )
   (i32.store
    (i32.add
     (get_local $12)
     (i32.const 180)
    )
    (i32.const 0)
   )
   (i32.store offset=184
    (get_local $12)
    (i32.const 0)
   )
   (i32.store
    (i32.add
     (get_local $12)
     (i32.const 188)
    )
    (i32.const 0)
   )
   (i32.store
    (i32.add
     (get_local $12)
     (i32.const 192)
    )
    (i32.const 0)
   )
   (i32.store
    (i32.add
     (get_local $12)
     (i32.const 196)
    )
    (i32.const 0)
   )
   (i32.store
    (i32.add
     (get_local $12)
     (i32.const 200)
    )
    (i32.const 0)
   )
   (i32.store
    (i32.add
     (get_local $12)
     (i32.const 204)
    )
    (i32.const 0)
   )
   (block $label$33
    (block $label$34
     (block $label$35
      (block $label$36
       (block $label$37
        (block $label$38
         (block $label$39
          (br_if $label$39
           (i64.le_s
            (get_local $2)
            (i64.const 4520488125973135359)
           )
          )
          (br_if $label$38
           (i64.gt_s
            (get_local $2)
            (i64.const 7112225355313709055)
           )
          )
          (br_if $label$37
           (i64.eq
            (get_local $2)
            (i64.const 4520488125973135360)
           )
          )
          (br_if $label$33
           (i64.ne
            (get_local $2)
            (i64.const 5562916748062474240)
           )
          )
          (i32.store offset=60
           (get_local $12)
           (i32.const 0)
          )
          (i32.store offset=56
           (get_local $12)
           (i32.const 1)
          )
          (i64.store offset=48 align=4
           (get_local $12)
           (i64.load offset=56
            (get_local $12)
           )
          )
          (drop
           (call $_ZN5eosio14execute_actionIN8exchange11ramexchangeES2_JEEEbPT_MT0_FvDpT1_E
            (i32.add
             (get_local $12)
             (i32.const 112)
            )
            (i32.add
             (get_local $12)
             (i32.const 48)
            )
           )
          )
          (br $label$33)
         )
         (br_if $label$36
          (i64.eq
           (get_local $2)
           (i64.const -4421672816961650688)
          )
         )
         (br_if $label$35
          (i64.eq
           (get_local $2)
           (i64.const -2039333636196357760)
          )
         )
         (br_if $label$33
          (i64.ne
           (get_local $2)
           (i64.const -2039333636196152032)
          )
         )
         (i32.store offset=76
          (get_local $12)
          (i32.const 0)
         )
         (i32.store offset=72
          (get_local $12)
          (i32.const 2)
         )
         (i64.store offset=32 align=4
          (get_local $12)
          (i64.load offset=72
           (get_local $12)
          )
         )
         (drop
          (call $_ZN5eosio14execute_actionIN8exchange11ramexchangeES2_JyEEEbPT_MT0_FvDpT1_E
           (i32.add
            (get_local $12)
            (i32.const 112)
           )
           (i32.add
            (get_local $12)
            (i32.const 32)
           )
          )
         )
         (br $label$33)
        )
        (br_if $label$34
         (i64.eq
          (get_local $2)
          (i64.const 7112225355313709056)
         )
        )
        (br_if $label$33
         (i64.ne
          (get_local $2)
          (i64.const 7112233052034564096)
         )
        )
        (i32.store offset=68
         (get_local $12)
         (i32.const 0)
        )
        (i32.store offset=64
         (get_local $12)
         (i32.const 3)
        )
        (i64.store offset=40 align=4
         (get_local $12)
         (i64.load offset=64
          (get_local $12)
         )
        )
        (drop
         (call $_ZN5eosio14execute_actionIN8exchange11ramexchangeES2_JEEEbPT_MT0_FvDpT1_E
          (i32.add
           (get_local $12)
           (i32.const 112)
          )
          (i32.add
           (get_local $12)
           (i32.const 40)
          )
         )
        )
        (br $label$33)
       )
       (i32.store offset=108
        (get_local $12)
        (i32.const 0)
       )
       (i32.store offset=104
        (get_local $12)
        (i32.const 4)
       )
       (i64.store align=4
        (get_local $12)
        (i64.load offset=104
         (get_local $12)
        )
       )
       (drop
        (call $_ZN5eosio14execute_actionIN8exchange11ramexchangeES2_JyNS_5assetEmbEEEbPT_MT0_FvDpT1_E
         (i32.add
          (get_local $12)
          (i32.const 112)
         )
         (get_local $12)
        )
       )
       (br $label$33)
      )
      (i32.store offset=100
       (get_local $12)
       (i32.const 0)
      )
      (i32.store offset=96
       (get_local $12)
       (i32.const 5)
      )
      (i64.store offset=8 align=4
       (get_local $12)
       (i64.load offset=96
        (get_local $12)
       )
      )
      (drop
       (call $_ZN5eosio14execute_actionIN8exchange11ramexchangeES2_JyNS_5assetEmbEEEbPT_MT0_FvDpT1_E
        (i32.add
         (get_local $12)
         (i32.const 112)
        )
        (i32.add
         (get_local $12)
         (i32.const 8)
        )
       )
      )
      (br $label$33)
     )
     (i32.store offset=84
      (get_local $12)
      (i32.const 0)
     )
     (i32.store offset=80
      (get_local $12)
      (i32.const 6)
     )
     (i64.store offset=24 align=4
      (get_local $12)
      (i64.load offset=80
       (get_local $12)
      )
     )
     (drop
      (call $_ZN5eosio14execute_actionIN8exchange11ramexchangeES2_JyEEEbPT_MT0_FvDpT1_E
       (i32.add
        (get_local $12)
        (i32.const 112)
       )
       (i32.add
        (get_local $12)
        (i32.const 24)
       )
      )
     )
     (br $label$33)
    )
    (i32.store offset=92
     (get_local $12)
     (i32.const 0)
    )
    (i32.store offset=88
     (get_local $12)
     (i32.const 7)
    )
    (i64.store offset=16 align=4
     (get_local $12)
     (i64.load offset=88
      (get_local $12)
     )
    )
    (drop
     (call $_ZN5eosio14execute_actionIN8exchange11ramexchangeES2_JEEEbPT_MT0_FvDpT1_E
      (i32.add
       (get_local $12)
       (i32.const 112)
      )
      (i32.add
       (get_local $12)
       (i32.const 16)
      )
     )
    )
   )
   (set_local $8
    (i32.add
     (tee_local $10
      (i32.load
       (i32.add
        (get_local $12)
        (i32.const 188)
       )
      )
     )
     (i32.shl
      (i32.div_u
       (tee_local $9
        (i32.load
         (i32.add
          (get_local $12)
          (i32.const 200)
         )
        )
       )
       (i32.const 102)
      )
      (i32.const 2)
     )
    )
   )
   (block $label$40
    (block $label$41
     (br_if $label$41
      (i32.eq
       (tee_local $11
        (i32.load
         (i32.add
          (get_local $12)
          (i32.const 192)
         )
        )
       )
       (get_local $10)
      )
     )
     (set_local $7
      (i32.add
       (i32.load
        (i32.add
         (get_local $10)
         (i32.shl
          (i32.div_u
           (tee_local $7
            (i32.add
             (i32.load
              (i32.add
               (get_local $12)
               (i32.const 204)
              )
             )
             (get_local $9)
            )
           )
           (i32.const 102)
          )
          (i32.const 2)
         )
        )
       )
       (i32.mul
        (i32.rem_u
         (get_local $7)
         (i32.const 102)
        )
        (i32.const 40)
       )
      )
     )
     (set_local $9
      (i32.add
       (i32.load
        (get_local $8)
       )
       (i32.mul
        (i32.rem_u
         (get_local $9)
         (i32.const 102)
        )
        (i32.const 40)
       )
      )
     )
     (br $label$40)
    )
    (set_local $9
     (i32.const 0)
    )
    (set_local $7
     (i32.const 0)
    )
   )
   (block $label$42
    (br_if $label$42
     (i32.eq
      (get_local $9)
      (get_local $7)
     )
    )
    (loop $label$43
     (block $label$44
      (br_if $label$44
       (i32.ne
        (i32.sub
         (tee_local $9
          (i32.add
           (get_local $9)
           (i32.const 40)
          )
         )
         (i32.load
          (get_local $8)
         )
        )
        (i32.const 4080)
       )
      )
      (set_local $9
       (i32.load offset=4
        (get_local $8)
       )
      )
      (set_local $8
       (i32.add
        (get_local $8)
        (i32.const 4)
       )
      )
     )
     (br_if $label$43
      (i32.ne
       (get_local $9)
       (get_local $7)
      )
     )
    )
   )
   (i32.store
    (i32.add
     (get_local $12)
     (i32.const 204)
    )
    (i32.const 0)
   )
   (block $label$45
    (br_if $label$45
     (i32.lt_u
      (tee_local $8
       (i32.shr_s
        (i32.sub
         (get_local $11)
         (get_local $10)
        )
        (i32.const 2)
       )
      )
      (i32.const 3)
     )
    )
    (set_local $9
     (i32.add
      (get_local $12)
      (i32.const 188)
     )
    )
    (set_local $7
     (i32.add
      (get_local $12)
      (i32.const 192)
     )
    )
    (loop $label$46
     (call $_ZdlPv
      (i32.load
       (get_local $10)
      )
     )
     (i32.store
      (get_local $9)
      (tee_local $10
       (i32.add
        (i32.load
         (get_local $9)
        )
        (i32.const 4)
       )
      )
     )
     (br_if $label$46
      (i32.gt_u
       (tee_local $8
        (i32.shr_s
         (i32.sub
          (tee_local $11
           (i32.load
            (get_local $7)
           )
          )
          (get_local $10)
         )
         (i32.const 2)
        )
       )
       (i32.const 2)
      )
     )
    )
   )
   (block $label$47
    (block $label$48
     (block $label$49
      (br_if $label$49
       (i32.eq
        (get_local $8)
        (i32.const 2)
       )
      )
      (br_if $label$47
       (i32.ne
        (get_local $8)
        (i32.const 1)
       )
      )
      (set_local $9
       (i32.const 51)
      )
      (br $label$48)
     )
     (set_local $9
      (i32.const 102)
     )
    )
    (i32.store
     (i32.add
      (get_local $12)
      (i32.const 200)
     )
     (get_local $9)
    )
   )
   (block $label$50
    (br_if $label$50
     (i32.eq
      (get_local $10)
      (get_local $11)
     )
    )
    (loop $label$51
     (call $_ZdlPv
      (i32.load
       (get_local $10)
      )
     )
     (br_if $label$51
      (i32.ne
       (get_local $11)
       (tee_local $10
        (i32.add
         (get_local $10)
         (i32.const 4)
        )
       )
      )
     )
    )
    (br_if $label$50
     (i32.eq
      (tee_local $10
       (i32.load
        (tee_local $9
         (i32.add
          (get_local $12)
          (i32.const 192)
         )
        )
       )
      )
      (tee_local $11
       (i32.load
        (i32.add
         (get_local $12)
         (i32.const 188)
        )
       )
      )
     )
    )
    (i32.store
     (get_local $9)
     (i32.add
      (get_local $10)
      (i32.and
       (i32.xor
        (i32.sub
         (i32.add
          (get_local $10)
          (i32.const -4)
         )
         (get_local $11)
        )
        (i32.const -1)
       )
       (i32.const -4)
      )
     )
    )
   )
   (block $label$52
    (br_if $label$52
     (i32.eqz
      (tee_local $10
       (i32.load
        (i32.add
         (get_local $12)
         (i32.const 184)
        )
       )
      )
     )
    )
    (call $_ZdlPv
     (get_local $10)
    )
   )
   (set_local $8
    (i32.add
     (tee_local $10
      (i32.load
       (i32.add
        (get_local $12)
        (i32.const 164)
       )
      )
     )
     (i32.shl
      (i32.div_u
       (tee_local $9
        (i32.load
         (i32.add
          (get_local $12)
          (i32.const 176)
         )
        )
       )
       (i32.const 102)
      )
      (i32.const 2)
     )
    )
   )
   (block $label$53
    (block $label$54
     (br_if $label$54
      (i32.eq
       (tee_local $11
        (i32.load
         (i32.add
          (get_local $12)
          (i32.const 168)
         )
        )
       )
       (get_local $10)
      )
     )
     (set_local $7
      (i32.add
       (i32.load
        (i32.add
         (get_local $10)
         (i32.shl
          (i32.div_u
           (tee_local $7
            (i32.add
             (i32.load
              (i32.add
               (get_local $12)
               (i32.const 180)
              )
             )
             (get_local $9)
            )
           )
           (i32.const 102)
          )
          (i32.const 2)
         )
        )
       )
       (i32.mul
        (i32.rem_u
         (get_local $7)
         (i32.const 102)
        )
        (i32.const 40)
       )
      )
     )
     (set_local $9
      (i32.add
       (i32.load
        (get_local $8)
       )
       (i32.mul
        (i32.rem_u
         (get_local $9)
         (i32.const 102)
        )
        (i32.const 40)
       )
      )
     )
     (br $label$53)
    )
    (set_local $9
     (i32.const 0)
    )
    (set_local $7
     (i32.const 0)
    )
   )
   (block $label$55
    (br_if $label$55
     (i32.eq
      (get_local $9)
      (get_local $7)
     )
    )
    (loop $label$56
     (block $label$57
      (br_if $label$57
       (i32.ne
        (i32.sub
         (tee_local $9
          (i32.add
           (get_local $9)
           (i32.const 40)
          )
         )
         (i32.load
          (get_local $8)
         )
        )
        (i32.const 4080)
       )
      )
      (set_local $9
       (i32.load offset=4
        (get_local $8)
       )
      )
      (set_local $8
       (i32.add
        (get_local $8)
        (i32.const 4)
       )
      )
     )
     (br_if $label$56
      (i32.ne
       (get_local $9)
       (get_local $7)
      )
     )
    )
   )
   (i32.store
    (i32.add
     (get_local $12)
     (i32.const 180)
    )
    (i32.const 0)
   )
   (block $label$58
    (br_if $label$58
     (i32.lt_u
      (tee_local $8
       (i32.shr_s
        (i32.sub
         (get_local $11)
         (get_local $10)
        )
        (i32.const 2)
       )
      )
      (i32.const 3)
     )
    )
    (set_local $9
     (i32.add
      (get_local $12)
      (i32.const 164)
     )
    )
    (set_local $7
     (i32.add
      (get_local $12)
      (i32.const 168)
     )
    )
    (loop $label$59
     (call $_ZdlPv
      (i32.load
       (get_local $10)
      )
     )
     (i32.store
      (get_local $9)
      (tee_local $10
       (i32.add
        (i32.load
         (get_local $9)
        )
        (i32.const 4)
       )
      )
     )
     (br_if $label$59
      (i32.gt_u
       (tee_local $8
        (i32.shr_s
         (i32.sub
          (tee_local $11
           (i32.load
            (get_local $7)
           )
          )
          (get_local $10)
         )
         (i32.const 2)
        )
       )
       (i32.const 2)
      )
     )
    )
   )
   (block $label$60
    (block $label$61
     (block $label$62
      (br_if $label$62
       (i32.eq
        (get_local $8)
        (i32.const 2)
       )
      )
      (br_if $label$60
       (i32.ne
        (get_local $8)
        (i32.const 1)
       )
      )
      (set_local $9
       (i32.const 51)
      )
      (br $label$61)
     )
     (set_local $9
      (i32.const 102)
     )
    )
    (i32.store
     (i32.add
      (get_local $12)
      (i32.const 176)
     )
     (get_local $9)
    )
   )
   (block $label$63
    (br_if $label$63
     (i32.eq
      (get_local $10)
      (get_local $11)
     )
    )
    (loop $label$64
     (call $_ZdlPv
      (i32.load
       (get_local $10)
      )
     )
     (br_if $label$64
      (i32.ne
       (get_local $11)
       (tee_local $10
        (i32.add
         (get_local $10)
         (i32.const 4)
        )
       )
      )
     )
    )
    (br_if $label$63
     (i32.eq
      (tee_local $10
       (i32.load
        (tee_local $9
         (i32.add
          (get_local $12)
          (i32.const 168)
         )
        )
       )
      )
      (tee_local $11
       (i32.load
        (i32.add
         (get_local $12)
         (i32.const 164)
        )
       )
      )
     )
    )
    (i32.store
     (get_local $9)
     (i32.add
      (get_local $10)
      (i32.and
       (i32.xor
        (i32.sub
         (i32.add
          (get_local $10)
          (i32.const -4)
         )
         (get_local $11)
        )
        (i32.const -1)
       )
       (i32.const -4)
      )
     )
    )
   )
   (block $label$65
    (br_if $label$65
     (i32.eqz
      (tee_local $10
       (i32.load
        (i32.add
         (get_local $12)
         (i32.const 160)
        )
       )
      )
     )
    )
    (call $_ZdlPv
     (get_local $10)
    )
   )
   (br_if $label$13
    (i32.eqz
     (tee_local $11
      (i32.load
       (i32.add
        (get_local $12)
        (i32.const 144)
       )
      )
     )
    )
   )
   (block $label$66
    (block $label$67
     (br_if $label$67
      (i32.eq
       (tee_local $10
        (i32.load
         (tee_local $8
          (i32.add
           (get_local $12)
           (i32.const 148)
          )
         )
        )
       )
       (get_local $11)
      )
     )
     (loop $label$68
      (set_local $9
       (i32.load
        (tee_local $10
         (i32.add
          (get_local $10)
          (i32.const -24)
         )
        )
       )
      )
      (i32.store
       (get_local $10)
       (i32.const 0)
      )
      (block $label$69
       (br_if $label$69
        (i32.eqz
         (get_local $9)
        )
       )
       (call $_ZdlPv
        (get_local $9)
       )
      )
      (br_if $label$68
       (i32.ne
        (get_local $11)
        (get_local $10)
       )
      )
     )
     (set_local $10
      (i32.load
       (i32.add
        (get_local $12)
        (i32.const 144)
       )
      )
     )
     (br $label$66)
    )
    (set_local $10
     (get_local $11)
    )
   )
   (i32.store
    (get_local $8)
    (get_local $11)
   )
   (call $_ZdlPv
    (get_local $10)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $12)
    (i32.const 208)
   )
  )
 )
 (func $_ZN8exchange11ramexchange3buyEyN5eosio5assetEmb (type $FUNCSIG$vijiii) (param $0 i32) (param $1 i64) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $14
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 96)
    )
   )
  )
  (call $require_auth
   (get_local $1)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (get_local $1)
   )
   (i32.const 1024)
  )
  (set_local $12
   (i32.const 0)
  )
  (set_local $7
   (tee_local $8
    (i64.shr_u
     (tee_local $5
      (i64.load offset=8
       (get_local $2)
      )
     )
     (i64.const 8)
    )
   )
  )
  (block $label$0
   (block $label$1
    (loop $label$2
     (br_if $label$1
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $7)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$3
      (br_if $label$3
       (i64.ne
        (i64.and
         (tee_local $7
          (i64.shr_u
           (get_local $7)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$4
       (br_if $label$1
        (i64.ne
         (i64.and
          (tee_local $7
           (i64.shr_u
            (get_local $7)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$4
        (i32.lt_s
         (tee_local $12
          (i32.add
           (get_local $12)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $11
      (i32.const 1)
     )
     (br_if $label$2
      (i32.lt_s
       (tee_local $12
        (i32.add
         (get_local $12)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$0)
    )
   )
   (set_local $11
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $11)
   (i32.const 1056)
  )
  (call $eosio_assert
   (i64.eq
    (get_local $5)
    (i64.const 1397703940)
   )
   (i32.const 1232)
  )
  (set_local $13
   (i32.const 0)
  )
  (set_local $11
   (i32.const 0)
  )
  (block $label$5
   (br_if $label$5
    (i64.ge_u
     (i64.add
      (tee_local $7
       (i64.load
        (get_local $2)
       )
      )
      (i64.const 4611686018427387903)
     )
     (i64.const 9223372036854775807)
    )
   )
   (set_local $12
    (i32.const 0)
   )
   (block $label$6
    (loop $label$7
     (br_if $label$6
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $8)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$8
      (br_if $label$8
       (i64.ne
        (i64.and
         (tee_local $8
          (i64.shr_u
           (get_local $8)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$9
       (br_if $label$6
        (i64.ne
         (i64.and
          (tee_local $8
           (i64.shr_u
            (get_local $8)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$9
        (i32.lt_s
         (tee_local $12
          (i32.add
           (get_local $12)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $11
      (i32.const 1)
     )
     (br_if $label$7
      (i32.lt_s
       (tee_local $12
        (i32.add
         (get_local $12)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$5)
    )
   )
   (set_local $11
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $11)
   (i32.const 1088)
  )
  (call $eosio_assert
   (i64.gt_s
    (get_local $7)
    (i64.const 0)
   )
   (i32.const 1264)
  )
  (drop
   (call $current_time)
  )
  (i64.store offset=64
   (get_local $14)
   (i64.const 0)
  )
  (i64.store offset=72
   (get_local $14)
   (i64.const 0)
  )
  (i64.store offset=80
   (get_local $14)
   (i64.const 0)
  )
  (set_local $10
   (i32.add
    (tee_local $12
     (i32.load
      (i32.add
       (get_local $0)
       (i32.const 52)
      )
     )
    )
    (i32.shl
     (i32.div_u
      (tee_local $11
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 64)
        )
       )
      )
      (i32.const 102)
     )
     (i32.const 2)
    )
   )
  )
  (block $label$10
   (br_if $label$10
    (tee_local $9
     (i32.eq
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 56)
       )
      )
      (get_local $12)
     )
    )
   )
   (set_local $13
    (i32.add
     (i32.load
      (get_local $10)
     )
     (i32.mul
      (i32.rem_u
       (get_local $11)
       (i32.const 102)
      )
      (i32.const 40)
     )
    )
   )
  )
  (i32.store offset=36
   (get_local $14)
   (get_local $13)
  )
  (i32.store offset=32
   (get_local $14)
   (get_local $10)
  )
  (set_local $12
   (i32.add
    (get_local $12)
    (i32.shl
     (i32.div_u
      (tee_local $10
       (i32.add
        (i32.load
         (i32.add
          (get_local $0)
          (i32.const 68)
         )
        )
        (get_local $11)
       )
      )
      (i32.const 102)
     )
     (i32.const 2)
    )
   )
  )
  (set_local $11
   (i32.const 0)
  )
  (set_local $13
   (i32.const 0)
  )
  (block $label$11
   (br_if $label$11
    (get_local $9)
   )
   (set_local $13
    (i32.add
     (i32.load
      (get_local $12)
     )
     (i32.mul
      (i32.rem_u
       (get_local $10)
       (i32.const 102)
      )
      (i32.const 40)
     )
    )
   )
  )
  (i32.store offset=92
   (get_local $14)
   (get_local $13)
  )
  (i32.store offset=88
   (get_local $14)
   (get_local $12)
  )
  (i64.store offset=24 align=4
   (get_local $14)
   (i64.load offset=32
    (get_local $14)
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $14)
     (i32.const 16)
    )
    (i32.const 4)
   )
   (i32.load offset=92
    (get_local $14)
   )
  )
  (i32.store offset=16
   (get_local $14)
   (i32.load offset=88
    (get_local $14)
   )
  )
  (call $_ZNSt3__15dequeIN8exchange11ramexchange5OfferENS_9allocatorIS3_EEE8__appendINS_16__deque_iteratorIS3_PKS3_RS9_PKSA_iLi102EEEEEvT_SF_PNS_9enable_ifIXsr21__is_forward_iteratorISF_EE5valueEvE4typeE
   (i32.add
    (get_local $14)
    (i32.const 64)
   )
   (i32.add
    (get_local $14)
    (i32.const 24)
   )
   (i32.add
    (get_local $14)
    (i32.const 16)
   )
   (i32.const 0)
  )
  (set_local $10
   (i32.add
    (tee_local $12
     (i32.load offset=68
      (get_local $14)
     )
    )
    (i32.shl
     (i32.div_u
      (tee_local $6
       (i32.load
        (i32.add
         (get_local $14)
         (i32.const 80)
        )
       )
      )
      (i32.const 102)
     )
     (i32.const 2)
    )
   )
  )
  (block $label$12
   (block $label$13
    (br_if $label$13
     (i32.eq
      (tee_local $13
       (i32.load
        (i32.add
         (get_local $14)
         (i32.const 72)
        )
       )
      )
      (get_local $12)
     )
    )
    (set_local $9
     (i32.add
      (i32.load
       (i32.add
        (get_local $12)
        (i32.shl
         (i32.div_u
          (tee_local $11
           (i32.add
            (i32.load
             (i32.add
              (get_local $14)
              (i32.const 84)
             )
            )
            (get_local $6)
           )
          )
          (i32.const 102)
         )
         (i32.const 2)
        )
       )
      )
      (i32.mul
       (i32.rem_u
        (get_local $11)
        (i32.const 102)
       )
       (i32.const 40)
      )
     )
    )
    (set_local $11
     (i32.add
      (i32.load
       (get_local $10)
      )
      (i32.mul
       (i32.rem_u
        (get_local $6)
        (i32.const 102)
       )
       (i32.const 40)
      )
     )
    )
    (br $label$12)
   )
   (set_local $9
    (i32.const 0)
   )
  )
  (block $label$14
   (br_if $label$14
    (i32.eq
     (get_local $11)
     (get_local $9)
    )
   )
   (loop $label$15
    (block $label$16
     (br_if $label$16
      (i32.ne
       (i32.sub
        (tee_local $11
         (i32.add
          (get_local $11)
          (i32.const 40)
         )
        )
        (i32.load
         (get_local $10)
        )
       )
       (i32.const 4080)
      )
     )
     (set_local $11
      (i32.load offset=4
       (get_local $10)
      )
     )
     (set_local $10
      (i32.add
       (get_local $10)
       (i32.const 4)
      )
     )
    )
    (br_if $label$15
     (i32.ne
      (get_local $11)
      (get_local $9)
     )
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $14)
    (i32.const 84)
   )
   (i32.const 0)
  )
  (block $label$17
   (br_if $label$17
    (i32.lt_u
     (tee_local $11
      (i32.shr_s
       (i32.sub
        (get_local $13)
        (get_local $12)
       )
       (i32.const 2)
      )
     )
     (i32.const 3)
    )
   )
   (set_local $10
    (i32.add
     (get_local $14)
     (i32.const 72)
    )
   )
   (loop $label$18
    (call $_ZdlPv
     (i32.load
      (get_local $12)
     )
    )
    (i32.store offset=68
     (get_local $14)
     (tee_local $12
      (i32.add
       (i32.load offset=68
        (get_local $14)
       )
       (i32.const 4)
      )
     )
    )
    (br_if $label$18
     (i32.gt_u
      (tee_local $11
       (i32.shr_s
        (i32.sub
         (tee_local $13
          (i32.load
           (get_local $10)
          )
         )
         (get_local $12)
        )
        (i32.const 2)
       )
      )
      (i32.const 2)
     )
    )
   )
  )
  (block $label$19
   (block $label$20
    (block $label$21
     (br_if $label$21
      (i32.eq
       (get_local $11)
       (i32.const 2)
      )
     )
     (br_if $label$19
      (i32.ne
       (get_local $11)
       (i32.const 1)
      )
     )
     (set_local $11
      (i32.const 51)
     )
     (br $label$20)
    )
    (set_local $11
     (i32.const 102)
    )
   )
   (i32.store
    (i32.add
     (get_local $14)
     (i32.const 80)
    )
    (get_local $11)
   )
  )
  (block $label$22
   (br_if $label$22
    (i32.eq
     (get_local $12)
     (get_local $13)
    )
   )
   (loop $label$23
    (call $_ZdlPv
     (i32.load
      (get_local $12)
     )
    )
    (br_if $label$23
     (i32.ne
      (get_local $13)
      (tee_local $12
       (i32.add
        (get_local $12)
        (i32.const 4)
       )
      )
     )
    )
   )
   (br_if $label$22
    (i32.eq
     (tee_local $12
      (i32.load
       (tee_local $11
        (i32.add
         (get_local $14)
         (i32.const 72)
        )
       )
      )
     )
     (tee_local $13
      (i32.load offset=68
       (get_local $14)
      )
     )
    )
   )
   (i32.store
    (get_local $11)
    (i32.add
     (get_local $12)
     (i32.and
      (i32.xor
       (i32.sub
        (i32.add
         (get_local $12)
         (i32.const -4)
        )
        (get_local $13)
       )
       (i32.const -1)
      )
      (i32.const -4)
     )
    )
   )
  )
  (block $label$24
   (br_if $label$24
    (i32.eqz
     (tee_local $12
      (i32.load offset=64
       (get_local $14)
      )
     )
    )
   )
   (call $_ZdlPv
    (get_local $12)
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $14)
     (i32.const 48)
    )
    (i32.const 12)
   )
   (i32.load
    (i32.add
     (get_local $2)
     (i32.const 12)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $14)
     (i32.const 48)
    )
    (i32.const 8)
   )
   (i32.load
    (i32.add
     (get_local $2)
     (i32.const 8)
    )
   )
  )
  (i32.store offset=48
   (get_local $14)
   (i32.load
    (get_local $2)
   )
  )
  (i32.store offset=52
   (get_local $14)
   (i32.load
    (i32.add
     (get_local $2)
     (i32.const 4)
    )
   )
  )
  (set_local $7
   (i64.load
    (get_local $0)
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $14)
     (i32.const 32)
    )
    (i32.const 8)
   )
   (i32.const 0)
  )
  (i64.store offset=32
   (get_local $14)
   (i64.const 0)
  )
  (block $label$25
   (br_if $label$25
    (i32.ge_u
     (tee_local $12
      (call $strlen
       (i32.const 848)
      )
     )
     (i32.const -16)
    )
   )
   (block $label$26
    (block $label$27
     (block $label$28
      (br_if $label$28
       (i32.ge_u
        (get_local $12)
        (i32.const 11)
       )
      )
      (i32.store8 offset=32
       (get_local $14)
       (i32.shl
        (get_local $12)
        (i32.const 1)
       )
      )
      (set_local $11
       (i32.or
        (i32.add
         (get_local $14)
         (i32.const 32)
        )
        (i32.const 1)
       )
      )
      (br_if $label$27
       (get_local $12)
      )
      (br $label$26)
     )
     (set_local $11
      (call $_Znwj
       (tee_local $13
        (i32.and
         (i32.add
          (get_local $12)
          (i32.const 16)
         )
         (i32.const -16)
        )
       )
      )
     )
     (i32.store offset=32
      (get_local $14)
      (i32.or
       (get_local $13)
       (i32.const 1)
      )
     )
     (i32.store offset=40
      (get_local $14)
      (get_local $11)
     )
     (i32.store offset=36
      (get_local $14)
      (get_local $12)
     )
    )
    (drop
     (call $memcpy
      (get_local $11)
      (i32.const 848)
      (get_local $12)
     )
    )
   )
   (i32.store8
    (i32.add
     (get_local $11)
     (get_local $12)
    )
    (i32.const 0)
   )
   (i64.store
    (i32.add
     (get_local $14)
     (i32.const 8)
    )
    (i64.load
     (i32.add
      (i32.add
       (get_local $14)
       (i32.const 48)
      )
      (i32.const 8)
     )
    )
   )
   (i64.store
    (get_local $14)
    (i64.load offset=48
     (get_local $14)
    )
   )
   (call $_ZN8exchangeL13transferTokenEyyN5eosio5assetERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE
    (get_local $1)
    (get_local $7)
    (get_local $14)
    (i32.add
     (get_local $14)
     (i32.const 32)
    )
   )
   (block $label$29
    (br_if $label$29
     (i32.eqz
      (i32.and
       (i32.load8_u offset=32
        (get_local $14)
       )
       (i32.const 1)
      )
     )
    )
    (call $_ZdlPv
     (i32.load offset=40
      (get_local $14)
     )
    )
   )
   (i32.store offset=4
    (i32.const 0)
    (i32.add
     (get_local $14)
     (i32.const 96)
    )
   )
   (return)
  )
  (call $_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
   (i32.add
    (get_local $14)
    (i32.const 32)
   )
  )
  (unreachable)
 )
 (func $_ZN5eosio14execute_actionIN8exchange11ramexchangeES2_JyNS_5assetEmbEEEbPT_MT0_FvDpT1_E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (set_local $9
   (tee_local $7
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 96)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (get_local $7)
  )
  (set_local $2
   (i32.load offset=4
    (get_local $1)
   )
  )
  (set_local $8
   (i32.load
    (get_local $1)
   )
  )
  (set_local $1
   (i32.const 0)
  )
  (set_local $5
   (i32.const 0)
  )
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (tee_local $3
      (call $action_data_size)
     )
    )
   )
   (block $label$1
    (block $label$2
     (br_if $label$2
      (i32.lt_u
       (get_local $3)
       (i32.const 513)
      )
     )
     (set_local $5
      (call $malloc
       (get_local $3)
      )
     )
     (br $label$1)
    )
    (i32.store offset=4
     (i32.const 0)
     (tee_local $5
      (i32.sub
       (get_local $7)
       (i32.and
        (i32.add
         (get_local $3)
         (i32.const 15)
        )
        (i32.const -16)
       )
      )
     )
    )
   )
   (drop
    (call $read_action_data
     (get_local $5)
     (get_local $3)
    )
   )
  )
  (i64.store
   (i32.add
    (get_local $9)
    (i32.const 32)
   )
   (i64.const 1398362884)
  )
  (i64.store offset=24
   (get_local $9)
   (i64.const 0)
  )
  (i64.store offset=16
   (get_local $9)
   (i64.const 0)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 384)
  )
  (set_local $6
   (i64.const 5462355)
  )
  (block $label$3
   (block $label$4
    (loop $label$5
     (br_if $label$4
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $6)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$6
      (br_if $label$6
       (i64.ne
        (i64.and
         (tee_local $6
          (i64.shr_u
           (get_local $6)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$7
       (br_if $label$4
        (i64.ne
         (i64.and
          (tee_local $6
           (i64.shr_u
            (get_local $6)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$7
        (i32.lt_s
         (tee_local $1
          (i32.add
           (get_local $1)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $7
      (i32.const 1)
     )
     (br_if $label$5
      (i32.lt_s
       (tee_local $1
        (i32.add
         (get_local $1)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$3)
    )
   )
   (set_local $7
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $7)
   (i32.const 112)
  )
  (i32.store8 offset=44
   (get_local $9)
   (i32.const 0)
  )
  (i32.store offset=40
   (get_local $9)
   (i32.const 0)
  )
  (i32.store offset=84
   (get_local $9)
   (get_local $5)
  )
  (i32.store offset=80
   (get_local $9)
   (get_local $5)
  )
  (i32.store offset=88
   (get_local $9)
   (i32.add
    (get_local $5)
    (get_local $3)
   )
  )
  (i32.store offset=48
   (get_local $9)
   (i32.add
    (get_local $9)
    (i32.const 80)
   )
  )
  (i32.store offset=64
   (get_local $9)
   (i32.add
    (get_local $9)
    (i32.const 16)
   )
  )
  (call $_ZN5boost6fusion6detail17for_each_unrolledILi4EE4callINS0_18std_tuple_iteratorINSt3__15tupleIJyN5eosio5assetEmbEEELi0EEEZNS8_rsINS8_10datastreamIPKcEEJyS9_mbEEERT_SI_RNS7_IJDpT0_EEEEUlSI_E_EEvRKSH_RKT0_
   (i32.add
    (get_local $9)
    (i32.const 64)
   )
   (i32.add
    (get_local $9)
    (i32.const 48)
   )
  )
  (block $label$8
   (br_if $label$8
    (i32.lt_u
     (get_local $3)
     (i32.const 513)
    )
   )
   (call $free
    (get_local $5)
   )
  )
  (i64.store
   (tee_local $1
    (i32.add
     (i32.add
      (get_local $9)
      (i32.const 48)
     )
     (i32.const 8)
    )
   )
   (i64.load
    (i32.add
     (get_local $9)
     (i32.const 32)
    )
   )
  )
  (set_local $6
   (i64.load offset=16
    (get_local $9)
   )
  )
  (i64.store offset=48
   (get_local $9)
   (i64.load offset=24
    (get_local $9)
   )
  )
  (set_local $5
   (i32.load8_u
    (i32.add
     (get_local $9)
     (i32.const 44)
    )
   )
  )
  (set_local $7
   (i32.load
    (i32.add
     (get_local $9)
     (i32.const 40)
    )
   )
  )
  (i64.store
   (i32.add
    (i32.add
     (get_local $9)
     (i32.const 64)
    )
    (i32.const 8)
   )
   (i64.load
    (get_local $1)
   )
  )
  (i64.store offset=64
   (get_local $9)
   (i64.load offset=48
    (get_local $9)
   )
  )
  (set_local $1
   (i32.add
    (get_local $0)
    (i32.shr_s
     (get_local $2)
     (i32.const 1)
    )
   )
  )
  (block $label$9
   (br_if $label$9
    (i32.eqz
     (i32.and
      (get_local $2)
      (i32.const 1)
     )
    )
   )
   (set_local $8
    (i32.load
     (i32.add
      (i32.load
       (get_local $1)
      )
      (get_local $8)
     )
    )
   )
  )
  (i64.store
   (i32.add
    (i32.add
     (get_local $9)
     (i32.const 80)
    )
    (i32.const 8)
   )
   (tee_local $4
    (i64.load
     (i32.add
      (i32.add
       (get_local $9)
       (i32.const 64)
      )
      (i32.const 8)
     )
    )
   )
  )
  (i64.store
   (i32.add
    (get_local $9)
    (i32.const 8)
   )
   (get_local $4)
  )
  (i64.store offset=80
   (get_local $9)
   (tee_local $4
    (i64.load offset=64
     (get_local $9)
    )
   )
  )
  (i64.store
   (get_local $9)
   (get_local $4)
  )
  (call_indirect (type $FUNCSIG$vijiii)
   (get_local $1)
   (get_local $6)
   (get_local $9)
   (get_local $7)
   (i32.ne
    (i32.and
     (get_local $5)
     (i32.const 255)
    )
    (i32.const 0)
   )
   (get_local $8)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $9)
    (i32.const 96)
   )
  )
  (i32.const 1)
 )
 (func $_ZN8exchange11ramexchange4sellEyN5eosio5assetEmb (type $FUNCSIG$vijiii) (param $0 i32) (param $1 i64) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $14
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 96)
    )
   )
  )
  (call $require_auth
   (get_local $1)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (get_local $1)
   )
   (i32.const 1024)
  )
  (set_local $12
   (i32.const 0)
  )
  (set_local $7
   (tee_local $8
    (i64.shr_u
     (tee_local $5
      (i64.load offset=8
       (get_local $2)
      )
     )
     (i64.const 8)
    )
   )
  )
  (block $label$0
   (block $label$1
    (loop $label$2
     (br_if $label$1
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $7)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$3
      (br_if $label$3
       (i64.ne
        (i64.and
         (tee_local $7
          (i64.shr_u
           (get_local $7)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$4
       (br_if $label$1
        (i64.ne
         (i64.and
          (tee_local $7
           (i64.shr_u
            (get_local $7)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$4
        (i32.lt_s
         (tee_local $12
          (i32.add
           (get_local $12)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $11
      (i32.const 1)
     )
     (br_if $label$2
      (i32.lt_s
       (tee_local $12
        (i32.add
         (get_local $12)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$0)
    )
   )
   (set_local $11
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $11)
   (i32.const 1056)
  )
  (call $eosio_assert
   (i64.eq
    (get_local $5)
    (i64.const 1296126468)
   )
   (i32.const 1232)
  )
  (set_local $13
   (i32.const 0)
  )
  (set_local $11
   (i32.const 0)
  )
  (block $label$5
   (br_if $label$5
    (i64.ge_u
     (i64.add
      (tee_local $7
       (i64.load
        (get_local $2)
       )
      )
      (i64.const 4611686018427387903)
     )
     (i64.const 9223372036854775807)
    )
   )
   (set_local $12
    (i32.const 0)
   )
   (block $label$6
    (loop $label$7
     (br_if $label$6
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $8)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$8
      (br_if $label$8
       (i64.ne
        (i64.and
         (tee_local $8
          (i64.shr_u
           (get_local $8)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$9
       (br_if $label$6
        (i64.ne
         (i64.and
          (tee_local $8
           (i64.shr_u
            (get_local $8)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$9
        (i32.lt_s
         (tee_local $12
          (i32.add
           (get_local $12)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $11
      (i32.const 1)
     )
     (br_if $label$7
      (i32.lt_s
       (tee_local $12
        (i32.add
         (get_local $12)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$5)
    )
   )
   (set_local $11
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $11)
   (i32.const 1088)
  )
  (call $eosio_assert
   (i64.gt_s
    (get_local $7)
    (i64.const 0)
   )
   (i32.const 1120)
  )
  (drop
   (call $current_time)
  )
  (i64.store offset=64
   (get_local $14)
   (i64.const 0)
  )
  (i64.store offset=72
   (get_local $14)
   (i64.const 0)
  )
  (i64.store offset=80
   (get_local $14)
   (i64.const 0)
  )
  (set_local $10
   (i32.add
    (tee_local $12
     (i32.load
      (i32.add
       (get_local $0)
       (i32.const 76)
      )
     )
    )
    (i32.shl
     (i32.div_u
      (tee_local $11
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 88)
        )
       )
      )
      (i32.const 102)
     )
     (i32.const 2)
    )
   )
  )
  (block $label$10
   (br_if $label$10
    (tee_local $9
     (i32.eq
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 80)
       )
      )
      (get_local $12)
     )
    )
   )
   (set_local $13
    (i32.add
     (i32.load
      (get_local $10)
     )
     (i32.mul
      (i32.rem_u
       (get_local $11)
       (i32.const 102)
      )
      (i32.const 40)
     )
    )
   )
  )
  (i32.store offset=36
   (get_local $14)
   (get_local $13)
  )
  (i32.store offset=32
   (get_local $14)
   (get_local $10)
  )
  (set_local $12
   (i32.add
    (get_local $12)
    (i32.shl
     (i32.div_u
      (tee_local $10
       (i32.add
        (i32.load
         (i32.add
          (get_local $0)
          (i32.const 92)
         )
        )
        (get_local $11)
       )
      )
      (i32.const 102)
     )
     (i32.const 2)
    )
   )
  )
  (set_local $11
   (i32.const 0)
  )
  (set_local $13
   (i32.const 0)
  )
  (block $label$11
   (br_if $label$11
    (get_local $9)
   )
   (set_local $13
    (i32.add
     (i32.load
      (get_local $12)
     )
     (i32.mul
      (i32.rem_u
       (get_local $10)
       (i32.const 102)
      )
      (i32.const 40)
     )
    )
   )
  )
  (i32.store offset=92
   (get_local $14)
   (get_local $13)
  )
  (i32.store offset=88
   (get_local $14)
   (get_local $12)
  )
  (i64.store offset=24 align=4
   (get_local $14)
   (i64.load offset=32
    (get_local $14)
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $14)
     (i32.const 16)
    )
    (i32.const 4)
   )
   (i32.load offset=92
    (get_local $14)
   )
  )
  (i32.store offset=16
   (get_local $14)
   (i32.load offset=88
    (get_local $14)
   )
  )
  (call $_ZNSt3__15dequeIN8exchange11ramexchange5OfferENS_9allocatorIS3_EEE8__appendINS_16__deque_iteratorIS3_PKS3_RS9_PKSA_iLi102EEEEEvT_SF_PNS_9enable_ifIXsr21__is_forward_iteratorISF_EE5valueEvE4typeE
   (i32.add
    (get_local $14)
    (i32.const 64)
   )
   (i32.add
    (get_local $14)
    (i32.const 24)
   )
   (i32.add
    (get_local $14)
    (i32.const 16)
   )
   (i32.const 0)
  )
  (set_local $10
   (i32.add
    (tee_local $12
     (i32.load offset=68
      (get_local $14)
     )
    )
    (i32.shl
     (i32.div_u
      (tee_local $6
       (i32.load
        (i32.add
         (get_local $14)
         (i32.const 80)
        )
       )
      )
      (i32.const 102)
     )
     (i32.const 2)
    )
   )
  )
  (block $label$12
   (block $label$13
    (br_if $label$13
     (i32.eq
      (tee_local $13
       (i32.load
        (i32.add
         (get_local $14)
         (i32.const 72)
        )
       )
      )
      (get_local $12)
     )
    )
    (set_local $9
     (i32.add
      (i32.load
       (i32.add
        (get_local $12)
        (i32.shl
         (i32.div_u
          (tee_local $11
           (i32.add
            (i32.load
             (i32.add
              (get_local $14)
              (i32.const 84)
             )
            )
            (get_local $6)
           )
          )
          (i32.const 102)
         )
         (i32.const 2)
        )
       )
      )
      (i32.mul
       (i32.rem_u
        (get_local $11)
        (i32.const 102)
       )
       (i32.const 40)
      )
     )
    )
    (set_local $11
     (i32.add
      (i32.load
       (get_local $10)
      )
      (i32.mul
       (i32.rem_u
        (get_local $6)
        (i32.const 102)
       )
       (i32.const 40)
      )
     )
    )
    (br $label$12)
   )
   (set_local $9
    (i32.const 0)
   )
  )
  (block $label$14
   (br_if $label$14
    (i32.eq
     (get_local $11)
     (get_local $9)
    )
   )
   (loop $label$15
    (block $label$16
     (br_if $label$16
      (i32.ne
       (i32.sub
        (tee_local $11
         (i32.add
          (get_local $11)
          (i32.const 40)
         )
        )
        (i32.load
         (get_local $10)
        )
       )
       (i32.const 4080)
      )
     )
     (set_local $11
      (i32.load offset=4
       (get_local $10)
      )
     )
     (set_local $10
      (i32.add
       (get_local $10)
       (i32.const 4)
      )
     )
    )
    (br_if $label$15
     (i32.ne
      (get_local $11)
      (get_local $9)
     )
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $14)
    (i32.const 84)
   )
   (i32.const 0)
  )
  (block $label$17
   (br_if $label$17
    (i32.lt_u
     (tee_local $11
      (i32.shr_s
       (i32.sub
        (get_local $13)
        (get_local $12)
       )
       (i32.const 2)
      )
     )
     (i32.const 3)
    )
   )
   (set_local $10
    (i32.add
     (get_local $14)
     (i32.const 72)
    )
   )
   (loop $label$18
    (call $_ZdlPv
     (i32.load
      (get_local $12)
     )
    )
    (i32.store offset=68
     (get_local $14)
     (tee_local $12
      (i32.add
       (i32.load offset=68
        (get_local $14)
       )
       (i32.const 4)
      )
     )
    )
    (br_if $label$18
     (i32.gt_u
      (tee_local $11
       (i32.shr_s
        (i32.sub
         (tee_local $13
          (i32.load
           (get_local $10)
          )
         )
         (get_local $12)
        )
        (i32.const 2)
       )
      )
      (i32.const 2)
     )
    )
   )
  )
  (block $label$19
   (block $label$20
    (block $label$21
     (br_if $label$21
      (i32.eq
       (get_local $11)
       (i32.const 2)
      )
     )
     (br_if $label$19
      (i32.ne
       (get_local $11)
       (i32.const 1)
      )
     )
     (set_local $11
      (i32.const 51)
     )
     (br $label$20)
    )
    (set_local $11
     (i32.const 102)
    )
   )
   (i32.store
    (i32.add
     (get_local $14)
     (i32.const 80)
    )
    (get_local $11)
   )
  )
  (block $label$22
   (br_if $label$22
    (i32.eq
     (get_local $12)
     (get_local $13)
    )
   )
   (loop $label$23
    (call $_ZdlPv
     (i32.load
      (get_local $12)
     )
    )
    (br_if $label$23
     (i32.ne
      (get_local $13)
      (tee_local $12
       (i32.add
        (get_local $12)
        (i32.const 4)
       )
      )
     )
    )
   )
   (br_if $label$22
    (i32.eq
     (tee_local $12
      (i32.load
       (tee_local $11
        (i32.add
         (get_local $14)
         (i32.const 72)
        )
       )
      )
     )
     (tee_local $13
      (i32.load offset=68
       (get_local $14)
      )
     )
    )
   )
   (i32.store
    (get_local $11)
    (i32.add
     (get_local $12)
     (i32.and
      (i32.xor
       (i32.sub
        (i32.add
         (get_local $12)
         (i32.const -4)
        )
        (get_local $13)
       )
       (i32.const -1)
      )
      (i32.const -4)
     )
    )
   )
  )
  (block $label$24
   (br_if $label$24
    (i32.eqz
     (tee_local $12
      (i32.load offset=64
       (get_local $14)
      )
     )
    )
   )
   (call $_ZdlPv
    (get_local $12)
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $14)
     (i32.const 48)
    )
    (i32.const 12)
   )
   (i32.load
    (i32.add
     (get_local $2)
     (i32.const 12)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $14)
     (i32.const 48)
    )
    (i32.const 8)
   )
   (i32.load
    (i32.add
     (get_local $2)
     (i32.const 8)
    )
   )
  )
  (i32.store offset=48
   (get_local $14)
   (i32.load
    (get_local $2)
   )
  )
  (i32.store offset=52
   (get_local $14)
   (i32.load
    (i32.add
     (get_local $2)
     (i32.const 4)
    )
   )
  )
  (set_local $7
   (i64.load
    (get_local $0)
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $14)
     (i32.const 32)
    )
    (i32.const 8)
   )
   (i32.const 0)
  )
  (i64.store offset=32
   (get_local $14)
   (i64.const 0)
  )
  (block $label$25
   (br_if $label$25
    (i32.ge_u
     (tee_local $12
      (call $strlen
       (i32.const 1168)
      )
     )
     (i32.const -16)
    )
   )
   (block $label$26
    (block $label$27
     (block $label$28
      (br_if $label$28
       (i32.ge_u
        (get_local $12)
        (i32.const 11)
       )
      )
      (i32.store8 offset=32
       (get_local $14)
       (i32.shl
        (get_local $12)
        (i32.const 1)
       )
      )
      (set_local $11
       (i32.or
        (i32.add
         (get_local $14)
         (i32.const 32)
        )
        (i32.const 1)
       )
      )
      (br_if $label$27
       (get_local $12)
      )
      (br $label$26)
     )
     (set_local $11
      (call $_Znwj
       (tee_local $13
        (i32.and
         (i32.add
          (get_local $12)
          (i32.const 16)
         )
         (i32.const -16)
        )
       )
      )
     )
     (i32.store offset=32
      (get_local $14)
      (i32.or
       (get_local $13)
       (i32.const 1)
      )
     )
     (i32.store offset=40
      (get_local $14)
      (get_local $11)
     )
     (i32.store offset=36
      (get_local $14)
      (get_local $12)
     )
    )
    (drop
     (call $memcpy
      (get_local $11)
      (i32.const 1168)
      (get_local $12)
     )
    )
   )
   (i32.store8
    (i32.add
     (get_local $11)
     (get_local $12)
    )
    (i32.const 0)
   )
   (i64.store
    (i32.add
     (get_local $14)
     (i32.const 8)
    )
    (i64.load
     (i32.add
      (i32.add
       (get_local $14)
       (i32.const 48)
      )
      (i32.const 8)
     )
    )
   )
   (i64.store
    (get_local $14)
    (i64.load offset=48
     (get_local $14)
    )
   )
   (call $_ZN8exchangeL13transferTokenEyyN5eosio5assetERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE
    (get_local $1)
    (get_local $7)
    (get_local $14)
    (i32.add
     (get_local $14)
     (i32.const 32)
    )
   )
   (block $label$29
    (br_if $label$29
     (i32.eqz
      (i32.and
       (i32.load8_u offset=32
        (get_local $14)
       )
       (i32.const 1)
      )
     )
    )
    (call $_ZdlPv
     (i32.load offset=40
      (get_local $14)
     )
    )
   )
   (i32.store offset=4
    (i32.const 0)
    (i32.add
     (get_local $14)
     (i32.const 96)
    )
   )
   (return)
  )
  (call $_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
   (i32.add
    (get_local $14)
    (i32.const 32)
   )
  )
  (unreachable)
 )
 (func $_ZN8exchange11ramexchange8getvalueEv (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $4
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
  (call $printui
   (call $current_time)
  )
  (call $prints
   (i32.const 912)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 384)
  )
  (set_local $2
   (i32.const 0)
  )
  (set_local $1
   (i64.const 5462355)
  )
  (block $label$0
   (block $label$1
    (loop $label$2
     (br_if $label$1
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $1)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$3
      (br_if $label$3
       (i64.ne
        (i64.and
         (tee_local $1
          (i64.shr_u
           (get_local $1)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$4
       (br_if $label$1
        (i64.ne
         (i64.and
          (tee_local $1
           (i64.shr_u
            (get_local $1)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$4
        (i32.lt_s
         (tee_local $2
          (i32.add
           (get_local $2)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $3
      (i32.const 1)
     )
     (br_if $label$2
      (i32.lt_s
       (tee_local $2
        (i32.add
         (get_local $2)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$0)
    )
   )
   (set_local $3
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $3)
   (i32.const 112)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 384)
  )
  (set_local $1
   (i64.const 5462355)
  )
  (set_local $2
   (i32.const 0)
  )
  (block $label$5
   (block $label$6
    (loop $label$7
     (br_if $label$6
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $1)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$8
      (br_if $label$8
       (i64.ne
        (i64.and
         (tee_local $1
          (i64.shr_u
           (get_local $1)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$9
       (br_if $label$6
        (i64.ne
         (i64.and
          (tee_local $1
           (i64.shr_u
            (get_local $1)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$9
        (i32.lt_s
         (tee_local $2
          (i32.add
           (get_local $2)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $3
      (i32.const 1)
     )
     (br_if $label$7
      (i32.lt_s
       (tee_local $2
        (i32.add
         (get_local $2)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$5)
    )
   )
   (set_local $3
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $3)
   (i32.const 112)
  )
  (call $eosio_assert
   (i64.eq
    (i64.const 1398362884)
    (i64.const 1398362884)
   )
   (i32.const 176)
  )
  (i64.store offset=8
   (get_local $4)
   (i64.const 1296126467)
  )
  (i64.store
   (get_local $4)
   (i64.const 512000000)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 384)
  )
  (set_local $1
   (i64.const 5062994)
  )
  (set_local $2
   (i32.const 0)
  )
  (block $label$10
   (block $label$11
    (loop $label$12
     (br_if $label$11
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $1)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$13
      (br_if $label$13
       (i64.ne
        (i64.and
         (tee_local $1
          (i64.shr_u
           (get_local $1)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$14
       (br_if $label$11
        (i64.ne
         (i64.and
          (tee_local $1
           (i64.shr_u
            (get_local $1)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$14
        (i32.lt_s
         (tee_local $2
          (i32.add
           (get_local $2)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $3
      (i32.const 1)
     )
     (br_if $label$12
      (i32.lt_s
       (tee_local $2
        (i32.add
         (get_local $2)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$10)
    )
   )
   (set_local $3
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $3)
   (i32.const 112)
  )
  (call $prints
   (i32.const 928)
  )
  (call $prints
   (i32.const 944)
  )
  (call $_ZNK5eosio5asset5printEv
   (get_local $4)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $4)
    (i32.const 16)
   )
  )
 )
 (func $_ZN5eosio14execute_actionIN8exchange11ramexchangeES2_JEEEbPT_MT0_FvDpT1_E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (set_local $4
   (tee_local $5
    (i32.load offset=4
     (i32.const 0)
    )
   )
  )
  (set_local $2
   (i32.load offset=4
    (get_local $1)
   )
  )
  (set_local $1
   (i32.load
    (get_local $1)
   )
  )
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (tee_local $3
      (call $action_data_size)
     )
    )
   )
   (block $label$1
    (br_if $label$1
     (i32.le_u
      (get_local $3)
      (i32.const 512)
     )
    )
    (drop
     (call $read_action_data
      (tee_local $5
       (call $malloc
        (get_local $3)
       )
      )
      (get_local $3)
     )
    )
    (call $free
     (get_local $5)
    )
    (br $label$0)
   )
   (i32.store offset=4
    (i32.const 0)
    (tee_local $5
     (i32.sub
      (get_local $5)
      (i32.and
       (i32.add
        (get_local $3)
        (i32.const 15)
       )
       (i32.const -16)
      )
     )
    )
   )
   (drop
    (call $read_action_data
     (get_local $5)
     (get_local $3)
    )
   )
  )
  (set_local $3
   (i32.add
    (get_local $0)
    (i32.shr_s
     (get_local $2)
     (i32.const 1)
    )
   )
  )
  (block $label$2
   (br_if $label$2
    (i32.eqz
     (i32.and
      (get_local $2)
      (i32.const 1)
     )
    )
   )
   (set_local $1
    (i32.load
     (i32.add
      (i32.load
       (get_local $3)
      )
      (get_local $1)
     )
    )
   )
  )
  (call_indirect (type $FUNCSIG$vi)
   (get_local $3)
   (get_local $1)
  )
  (i32.store offset=4
   (i32.const 0)
   (get_local $4)
  )
  (i32.const 1)
 )
 (func $_ZN8exchange11ramexchange12withdraw_eosEy (type $FUNCSIG$vij) (param $0 i32) (param $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $6
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 48)
    )
   )
  )
  (call $require_auth
   (get_local $1)
  )
  (call $eosio_assert
   (i64.eq
    (i64.load
     (get_local $0)
    )
    (get_local $1)
   )
   (i32.const 816)
  )
  (i64.store offset=32
   (get_local $6)
   (i64.const 1)
  )
  (i64.store offset=40
   (get_local $6)
   (i64.const 1398362884)
  )
  (set_local $2
   (i64.load
    (get_local $0)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 384)
  )
  (set_local $0
   (i32.const 0)
  )
  (set_local $4
   (i64.const 5462355)
  )
  (block $label$0
   (block $label$1
    (loop $label$2
     (br_if $label$1
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $4)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$3
      (br_if $label$3
       (i64.ne
        (i64.and
         (tee_local $4
          (i64.shr_u
           (get_local $4)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$4
       (br_if $label$1
        (i64.ne
         (i64.and
          (tee_local $4
           (i64.shr_u
            (get_local $4)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$4
        (i32.lt_s
         (tee_local $0
          (i32.add
           (get_local $0)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $5
      (i32.const 1)
     )
     (br_if $label$2
      (i32.lt_s
       (tee_local $0
        (i32.add
         (get_local $0)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$0)
    )
   )
   (set_local $5
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $5)
   (i32.const 112)
  )
  (i32.store
   (i32.add
    (get_local $6)
    (i32.const 24)
   )
   (i32.const 0)
  )
  (i64.store offset=16
   (get_local $6)
   (i64.const 0)
  )
  (block $label$5
   (br_if $label$5
    (i32.ge_u
     (tee_local $0
      (call $strlen
       (i32.const 848)
      )
     )
     (i32.const -16)
    )
   )
   (block $label$6
    (block $label$7
     (block $label$8
      (br_if $label$8
       (i32.ge_u
        (get_local $0)
        (i32.const 11)
       )
      )
      (i32.store8 offset=16
       (get_local $6)
       (i32.shl
        (get_local $0)
        (i32.const 1)
       )
      )
      (set_local $5
       (i32.or
        (i32.add
         (get_local $6)
         (i32.const 16)
        )
        (i32.const 1)
       )
      )
      (br_if $label$7
       (get_local $0)
      )
      (br $label$6)
     )
     (set_local $5
      (call $_Znwj
       (tee_local $3
        (i32.and
         (i32.add
          (get_local $0)
          (i32.const 16)
         )
         (i32.const -16)
        )
       )
      )
     )
     (i32.store offset=16
      (get_local $6)
      (i32.or
       (get_local $3)
       (i32.const 1)
      )
     )
     (i32.store offset=24
      (get_local $6)
      (get_local $5)
     )
     (i32.store offset=20
      (get_local $6)
      (get_local $0)
     )
    )
    (drop
     (call $memcpy
      (get_local $5)
      (i32.const 848)
      (get_local $0)
     )
    )
   )
   (i32.store8
    (i32.add
     (get_local $5)
     (get_local $0)
    )
    (i32.const 0)
   )
   (i64.store
    (i32.add
     (get_local $6)
     (i32.const 8)
    )
    (i64.load
     (i32.add
      (i32.add
       (get_local $6)
       (i32.const 32)
      )
      (i32.const 8)
     )
    )
   )
   (i64.store
    (get_local $6)
    (i64.load offset=32
     (get_local $6)
    )
   )
   (call $_ZN8exchangeL13transferTokenEyyN5eosio5assetERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE
    (get_local $2)
    (get_local $1)
    (get_local $6)
    (i32.add
     (get_local $6)
     (i32.const 16)
    )
   )
   (block $label$9
    (br_if $label$9
     (i32.eqz
      (i32.and
       (i32.load8_u offset=16
        (get_local $6)
       )
       (i32.const 1)
      )
     )
    )
    (call $_ZdlPv
     (i32.load offset=24
      (get_local $6)
     )
    )
   )
   (i32.store offset=4
    (i32.const 0)
    (i32.add
     (get_local $6)
     (i32.const 48)
    )
   )
   (return)
  )
  (call $_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
   (i32.add
    (get_local $6)
    (i32.const 16)
   )
  )
  (unreachable)
 )
 (func $_ZN5eosio14execute_actionIN8exchange11ramexchangeES2_JyEEEbPT_MT0_FvDpT1_E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (set_local $6
   (tee_local $4
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (get_local $4)
  )
  (set_local $2
   (i32.load offset=4
    (get_local $1)
   )
  )
  (set_local $5
   (i32.load
    (get_local $1)
   )
  )
  (block $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (br_if $label$3
       (i32.eqz
        (tee_local $1
         (call $action_data_size)
        )
       )
      )
      (br_if $label$2
       (i32.lt_u
        (get_local $1)
        (i32.const 513)
       )
      )
      (set_local $4
       (call $malloc
        (get_local $1)
       )
      )
      (br $label$1)
     )
     (set_local $4
      (i32.const 0)
     )
     (br $label$0)
    )
    (i32.store offset=4
     (i32.const 0)
     (tee_local $4
      (i32.sub
       (get_local $4)
       (i32.and
        (i32.add
         (get_local $1)
         (i32.const 15)
        )
        (i32.const -16)
       )
      )
     )
    )
   )
   (drop
    (call $read_action_data
     (get_local $4)
     (get_local $1)
    )
   )
  )
  (i64.store offset=8
   (get_local $6)
   (i64.const 0)
  )
  (call $eosio_assert
   (i32.gt_u
    (get_local $1)
    (i32.const 7)
   )
   (i32.const 688)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $6)
     (i32.const 8)
    )
    (get_local $4)
    (i32.const 8)
   )
  )
  (set_local $3
   (i64.load offset=8
    (get_local $6)
   )
  )
  (block $label$4
   (br_if $label$4
    (i32.lt_u
     (get_local $1)
     (i32.const 513)
    )
   )
   (call $free
    (get_local $4)
   )
  )
  (set_local $1
   (i32.add
    (get_local $0)
    (i32.shr_s
     (get_local $2)
     (i32.const 1)
    )
   )
  )
  (block $label$5
   (br_if $label$5
    (i32.eqz
     (i32.and
      (get_local $2)
      (i32.const 1)
     )
    )
   )
   (set_local $5
    (i32.load
     (i32.add
      (i32.load
       (get_local $1)
      )
      (get_local $5)
     )
    )
   )
  )
  (call_indirect (type $FUNCSIG$vij)
   (get_local $1)
   (get_local $3)
   (get_local $5)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $6)
    (i32.const 16)
   )
  )
  (i32.const 1)
 )
 (func $_ZN8exchange11ramexchange12withdraw_ramEy (type $FUNCSIG$vij) (param $0 i32) (param $1 i64)
 )
 (func $_ZN8exchange11ramexchange9getvolumeEv (type $FUNCSIG$vi) (param $0 i32)
 )
 (func $_ZN8exchange11ramexchange10dotransferEv (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $16
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 176)
    )
   )
  )
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.eqz
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 68)
       )
      )
     )
    )
    (br_if $label$1
     (i32.eqz
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 92)
       )
      )
     )
    )
    (set_local $1
     (i32.add
      (get_local $0)
      (i32.const 8)
     )
    )
    (set_local $3
     (i32.or
      (i32.add
       (get_local $16)
       (i32.const 160)
      )
      (i32.const 1)
     )
    )
    (set_local $2
     (i32.add
      (i32.add
       (get_local $16)
       (i32.const 48)
      )
      (i32.const 16)
     )
    )
    (set_local $10
     (i32.add
      (i32.add
       (get_local $16)
       (i32.const 104)
      )
      (i32.const 24)
     )
    )
    (set_local $14
     (i32.add
      (get_local $0)
      (i32.const 68)
     )
    )
    (loop $label$2
     (call $_ZN8exchange11ramexchange15getFromBuyQueueEv
      (i32.add
       (get_local $16)
       (i32.const 104)
      )
      (get_local $16)
     )
     (call $eosio_assert
      (i64.eqz
       (tee_local $5
        (i64.load
         (tee_local $9
          (i32.add
           (i32.add
            (get_local $16)
            (i32.const 104)
           )
           (i32.const 16)
          )
         )
        )
       )
      )
      (i32.const 144)
     )
     (call $_ZNK5eosio10ram_market12get_rampriceEv
      (i32.add
       (get_local $16)
       (i32.const 88)
      )
      (get_local $1)
     )
     (set_local $8
      (i64.load offset=88
       (get_local $16)
      )
     )
     (call $eosio_assert
      (i64.eq
       (i64.load
        (get_local $10)
       )
       (i64.load
        (i32.add
         (i32.add
          (get_local $16)
          (i32.const 88)
         )
         (i32.const 8)
        )
       )
      )
      (i32.const 176)
     )
     (call $eosio_assert
      (i64.lt_u
       (i64.add
        (tee_local $8
         (i64.mul
          (i64.div_s
           (get_local $5)
           (get_local $8)
          )
          (i64.const 1024000)
         )
        )
        (i64.const 4611686018427387903)
       )
       (i64.const 9223372036854775807)
      )
      (i32.const 384)
     )
     (set_local $4
      (i64.const 5062994)
     )
     (set_local $0
      (i32.const 0)
     )
     (block $label$3
      (loop $label$4
       (set_local $11
        (i32.const 0)
       )
       (br_if $label$3
        (i32.gt_u
         (i32.add
          (i32.shl
           (i32.wrap/i64
            (get_local $4)
           )
           (i32.const 24)
          )
          (i32.const -1073741825)
         )
         (i32.const 452984830)
        )
       )
       (block $label$5
        (br_if $label$5
         (i64.ne
          (i64.and
           (tee_local $4
            (i64.shr_u
             (get_local $4)
             (i64.const 8)
            )
           )
           (i64.const 255)
          )
          (i64.const 0)
         )
        )
        (loop $label$6
         (br_if $label$3
          (i64.ne
           (i64.and
            (tee_local $4
             (i64.shr_u
              (get_local $4)
              (i64.const 8)
             )
            )
            (i64.const 255)
           )
           (i64.const 0)
          )
         )
         (br_if $label$6
          (i32.lt_s
           (tee_local $0
            (i32.add
             (get_local $0)
             (i32.const 1)
            )
           )
           (i32.const 7)
          )
         )
        )
       )
       (set_local $11
        (i32.const 1)
       )
       (br_if $label$4
        (i32.lt_s
         (tee_local $0
          (i32.add
           (get_local $0)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (call $eosio_assert
      (get_local $11)
      (i32.const 112)
     )
     (block $label$7
      (br_if $label$7
       (i64.lt_s
        (get_local $5)
        (i64.const 1)
       )
      )
      (loop $label$8
       (call $_ZN8exchange11ramexchange16getFromSellQueueEv
        (i32.add
         (get_local $16)
         (i32.const 48)
        )
        (get_local $16)
       )
       (call $eosio_assert
        (i64.eqz
         (i64.load
          (get_local $2)
         )
        )
        (i32.const 144)
       )
       (i64.store
        (tee_local $0
         (i32.add
          (i32.add
           (get_local $16)
           (i32.const 32)
          )
          (i32.const 8)
         )
        )
        (i64.load
         (i32.add
          (get_local $2)
          (i32.const 8)
         )
        )
       )
       (i64.store offset=32
        (get_local $16)
        (i64.load
         (get_local $2)
        )
       )
       (i64.store
        (tee_local $11
         (i32.add
          (i32.add
           (get_local $16)
           (i32.const 160)
          )
          (i32.const 8)
         )
        )
        (i64.load
         (get_local $0)
        )
       )
       (i64.store
        (i32.add
         (i32.add
          (get_local $16)
          (i32.const 144)
         )
         (i32.const 8)
        )
        (i64.const 1296126467)
       )
       (i64.store offset=160
        (get_local $16)
        (i64.load offset=32
         (get_local $16)
        )
       )
       (set_local $4
        (i64.load
         (get_local $11)
        )
       )
       (i64.store offset=144
        (get_local $16)
        (get_local $8)
       )
       (call $eosio_assert
        (i64.eq
         (get_local $4)
         (i64.const 1296126467)
        )
        (i32.const 176)
       )
       (set_local $4
        (i64.load
         (tee_local $0
          (select
           (i32.add
            (get_local $16)
            (i32.const 144)
           )
           (i32.add
            (get_local $16)
            (i32.const 160)
           )
           (i64.lt_s
            (get_local $8)
            (i64.load offset=160
             (get_local $16)
            )
           )
          )
         )
        )
       )
       (set_local $7
        (i64.load
         (i32.add
          (i32.add
           (get_local $16)
           (i32.const 104)
          )
          (i32.const 8)
         )
        )
       )
       (set_local $6
        (i64.load
         (i32.add
          (i32.add
           (get_local $16)
           (i32.const 48)
          )
          (i32.const 8)
         )
        )
       )
       (i64.store
        (tee_local $12
         (i32.add
          (i32.add
           (get_local $16)
           (i32.const 16)
          )
          (i32.const 8)
         )
        )
        (tee_local $5
         (i64.load offset=8
          (get_local $0)
         )
        )
       )
       (i64.store offset=16
        (get_local $16)
        (get_local $4)
       )
       (i32.store
        (get_local $11)
        (i32.const 0)
       )
       (i64.store offset=160
        (get_local $16)
        (i64.const 0)
       )
       (br_if $label$0
        (i32.ge_u
         (tee_local $0
          (call $strlen
           (i32.const 240)
          )
         )
         (i32.const -16)
        )
       )
       (block $label$9
        (block $label$10
         (block $label$11
          (br_if $label$11
           (i32.ge_u
            (get_local $0)
            (i32.const 11)
           )
          )
          (i32.store8 offset=160
           (get_local $16)
           (i32.shl
            (get_local $0)
            (i32.const 1)
           )
          )
          (set_local $15
           (get_local $3)
          )
          (br_if $label$10
           (get_local $0)
          )
          (br $label$9)
         )
         (i32.store
          (get_local $11)
          (tee_local $15
           (call $_Znwj
            (tee_local $13
             (i32.and
              (i32.add
               (get_local $0)
               (i32.const 16)
              )
              (i32.const -16)
             )
            )
           )
          )
         )
         (i32.store offset=160
          (get_local $16)
          (i32.or
           (get_local $13)
           (i32.const 1)
          )
         )
         (i32.store offset=164
          (get_local $16)
          (get_local $0)
         )
        )
        (drop
         (call $memcpy
          (get_local $15)
          (i32.const 240)
          (get_local $0)
         )
        )
       )
       (i32.store8
        (i32.add
         (get_local $15)
         (get_local $0)
        )
        (i32.const 0)
       )
       (i64.store
        (i32.add
         (get_local $16)
         (i32.const 8)
        )
        (i64.load
         (get_local $12)
        )
       )
       (i64.store
        (get_local $16)
        (i64.load offset=16
         (get_local $16)
        )
       )
       (call $_ZN8exchangeL13transferTokenEyyN5eosio5assetERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE
        (get_local $6)
        (get_local $7)
        (get_local $16)
        (i32.add
         (get_local $16)
         (i32.const 160)
        )
       )
       (block $label$12
        (br_if $label$12
         (i32.eqz
          (i32.and
           (i32.load8_u offset=160
            (get_local $16)
           )
           (i32.const 1)
          )
         )
        )
        (call $_ZdlPv
         (i32.load
          (get_local $11)
         )
        )
       )
       (call $eosio_assert
        (i64.eq
         (get_local $5)
         (i64.const 1296126467)
        )
        (i32.const 176)
       )
       (block $label$13
        (br_if $label$13
         (i64.ne
          (get_local $8)
          (get_local $4)
         )
        )
        (call $eosio_assert
         (i64.eq
          (get_local $5)
          (i64.load
           (get_local $10)
          )
         )
         (i32.const 272)
        )
        (i64.store
         (get_local $9)
         (tee_local $7
          (i64.sub
           (i64.load
            (get_local $9)
           )
           (get_local $8)
          )
         )
        )
        (call $eosio_assert
         (i64.gt_s
          (get_local $7)
          (i64.const -4611686018427387904)
         )
         (i32.const 320)
        )
        (call $eosio_assert
         (i64.lt_s
          (get_local $7)
          (i64.const 4611686018427387904)
         )
         (i32.const 352)
        )
       )
       (call $eosio_assert
        (i64.eq
         (tee_local $7
          (i64.load
           (i32.add
            (i32.add
             (get_local $16)
             (i32.const 48)
            )
            (i32.const 24)
           )
          )
         )
         (i64.const 1296126467)
        )
        (i32.const 176)
       )
       (block $label$14
        (br_if $label$14
         (i64.eq
          (get_local $8)
          (tee_local $6
           (i64.load
            (get_local $2)
           )
          )
         )
        )
        (call $eosio_assert
         (i64.eq
          (get_local $5)
          (get_local $7)
         )
         (i32.const 272)
        )
        (i64.store
         (get_local $2)
         (tee_local $4
          (i64.sub
           (get_local $6)
           (get_local $4)
          )
         )
        )
        (call $eosio_assert
         (i64.gt_s
          (get_local $4)
          (i64.const -4611686018427387904)
         )
         (i32.const 320)
        )
        (call $eosio_assert
         (i64.lt_s
          (get_local $4)
          (i64.const 4611686018427387904)
         )
         (i32.const 352)
        )
       )
       (br_if $label$8
        (i64.gt_s
         (i64.load
          (get_local $9)
         )
         (i64.const 0)
        )
       )
      )
     )
     (br_if $label$2
      (i32.load
       (get_local $14)
      )
     )
    )
   )
   (i32.store offset=4
    (i32.const 0)
    (i32.add
     (get_local $16)
     (i32.const 176)
    )
   )
   (return)
  )
  (call $_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
   (i32.add
    (get_local $16)
    (i32.const 160)
   )
  )
  (unreachable)
 )
 (func $_ZN8exchange11ramexchange16getFromSellQueueEv (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (set_local $5
   (i64.const 0)
  )
  (set_local $4
   (i64.const 59)
  )
  (set_local $3
   (i32.const 704)
  )
  (set_local $6
   (i64.const 0)
  )
  (loop $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_if $label$5
         (i64.gt_u
          (get_local $5)
          (i64.const 5)
         )
        )
        (br_if $label$4
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $2
             (i32.load8_s
              (get_local $3)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $2
         (i32.add
          (get_local $2)
          (i32.const 165)
         )
        )
        (br $label$3)
       )
       (set_local $7
        (i64.const 0)
       )
       (br_if $label$2
        (i64.le_u
         (get_local $5)
         (i64.const 11)
        )
       )
       (br $label$1)
      )
      (set_local $2
       (select
        (i32.add
         (get_local $2)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $2)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $7
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $2)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $7
     (i64.shl
      (i64.and
       (get_local $7)
       (i64.const 31)
      )
      (i64.and
       (get_local $4)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $3
    (i32.add
     (get_local $3)
     (i32.const 1)
    )
   )
   (set_local $5
    (i64.add
     (get_local $5)
     (i64.const 1)
    )
   )
   (set_local $6
    (i64.or
     (get_local $7)
     (get_local $6)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $4
      (i64.add
       (get_local $4)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (set_local $5
   (call $current_time)
  )
  (i64.store offset=8
   (get_local $0)
   (get_local $6)
  )
  (i64.store
   (get_local $0)
   (get_local $5)
  )
  (i64.store offset=16
   (get_local $0)
   (i64.const 1)
  )
  (i64.store
   (i32.add
    (get_local $0)
    (i32.const 24)
   )
   (i64.const 1398362884)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 384)
  )
  (set_local $5
   (i64.const 5462355)
  )
  (set_local $3
   (i32.const 0)
  )
  (block $label$6
   (block $label$7
    (loop $label$8
     (br_if $label$7
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $5)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$9
      (br_if $label$9
       (i64.ne
        (i64.and
         (tee_local $5
          (i64.shr_u
           (get_local $5)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$10
       (br_if $label$7
        (i64.ne
         (i64.and
          (tee_local $5
           (i64.shr_u
            (get_local $5)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$10
        (i32.lt_s
         (tee_local $3
          (i32.add
           (get_local $3)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $2
      (i32.const 1)
     )
     (br_if $label$8
      (i32.lt_s
       (tee_local $3
        (i32.add
         (get_local $3)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$6)
    )
   )
   (set_local $2
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $2)
   (i32.const 112)
  )
  (i32.store8 offset=36
   (get_local $0)
   (i32.const 0)
  )
  (i32.store offset=32
   (get_local $0)
   (i32.const 0)
  )
 )
 (func $_ZN8exchangeL13transferTokenEyyN5eosio5assetERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE (param $0 i64) (param $1 i64) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $12
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 128)
    )
   )
  )
  (call $eosio_assert
   (i32.lt_u
    (select
     (i32.load offset=4
      (get_local $3)
     )
     (i32.shr_u
      (tee_local $5
       (i32.load8_u
        (get_local $3)
       )
      )
      (i32.const 1)
     )
     (i32.and
      (get_local $5)
      (i32.const 1)
     )
    )
    (i32.const 257)
   )
   (i32.const 720)
  )
  (set_local $7
   (i64.const 0)
  )
  (set_local $6
   (i64.const 59)
  )
  (set_local $5
   (i32.const 752)
  )
  (set_local $8
   (i64.const 0)
  )
  (loop $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_if $label$5
         (i64.gt_u
          (get_local $7)
          (i64.const 5)
         )
        )
        (br_if $label$4
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $4
             (i32.load8_s
              (get_local $5)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $4
         (i32.add
          (get_local $4)
          (i32.const 165)
         )
        )
        (br $label$3)
       )
       (set_local $9
        (i64.const 0)
       )
       (br_if $label$2
        (i64.le_u
         (get_local $7)
         (i64.const 11)
        )
       )
       (br $label$1)
      )
      (set_local $4
       (select
        (i32.add
         (get_local $4)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $4)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $9
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $4)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $9
     (i64.shl
      (i64.and
       (get_local $9)
       (i64.const 31)
      )
      (i64.and
       (get_local $6)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $5
    (i32.add
     (get_local $5)
     (i32.const 1)
    )
   )
   (set_local $7
    (i64.add
     (get_local $7)
     (i64.const 1)
    )
   )
   (set_local $8
    (i64.or
     (get_local $9)
     (get_local $8)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $6
      (i64.add
       (get_local $6)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (set_local $7
   (i64.const 0)
  )
  (set_local $6
   (i64.const 59)
  )
  (set_local $5
   (i32.const 768)
  )
  (set_local $10
   (i64.const 0)
  )
  (loop $label$6
   (block $label$7
    (block $label$8
     (block $label$9
      (block $label$10
       (block $label$11
        (br_if $label$11
         (i64.gt_u
          (get_local $7)
          (i64.const 10)
         )
        )
        (br_if $label$10
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $4
             (i32.load8_s
              (get_local $5)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $4
         (i32.add
          (get_local $4)
          (i32.const 165)
         )
        )
        (br $label$9)
       )
       (set_local $9
        (i64.const 0)
       )
       (br_if $label$8
        (i64.eq
         (get_local $7)
         (i64.const 11)
        )
       )
       (br $label$7)
      )
      (set_local $4
       (select
        (i32.add
         (get_local $4)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $4)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $9
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $4)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $9
     (i64.shl
      (i64.and
       (get_local $9)
       (i64.const 31)
      )
      (i64.and
       (get_local $6)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $5
    (i32.add
     (get_local $5)
     (i32.const 1)
    )
   )
   (set_local $6
    (i64.add
     (get_local $6)
     (i64.const -5)
    )
   )
   (set_local $10
    (i64.or
     (get_local $9)
     (get_local $10)
    )
   )
   (br_if $label$6
    (i64.ne
     (tee_local $7
      (i64.add
       (get_local $7)
       (i64.const 1)
      )
     )
     (i64.const 13)
    )
   )
  )
  (set_local $7
   (i64.const 0)
  )
  (set_local $6
   (i64.const 59)
  )
  (set_local $5
   (i32.const 784)
  )
  (set_local $11
   (i64.const 0)
  )
  (loop $label$12
   (block $label$13
    (block $label$14
     (block $label$15
      (block $label$16
       (block $label$17
        (br_if $label$17
         (i64.gt_u
          (get_local $7)
          (i64.const 7)
         )
        )
        (br_if $label$16
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $4
             (i32.load8_s
              (get_local $5)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $4
         (i32.add
          (get_local $4)
          (i32.const 165)
         )
        )
        (br $label$15)
       )
       (set_local $9
        (i64.const 0)
       )
       (br_if $label$14
        (i64.le_u
         (get_local $7)
         (i64.const 11)
        )
       )
       (br $label$13)
      )
      (set_local $4
       (select
        (i32.add
         (get_local $4)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $4)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $9
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $4)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $9
     (i64.shl
      (i64.and
       (get_local $9)
       (i64.const 31)
      )
      (i64.and
       (get_local $6)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $5
    (i32.add
     (get_local $5)
     (i32.const 1)
    )
   )
   (set_local $7
    (i64.add
     (get_local $7)
     (i64.const 1)
    )
   )
   (set_local $11
    (i64.or
     (get_local $9)
     (get_local $11)
    )
   )
   (br_if $label$12
    (i64.ne
     (tee_local $6
      (i64.add
       (get_local $6)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $12)
     (i32.const 8)
    )
    (i32.const 28)
   )
   (i32.load
    (i32.add
     (get_local $2)
     (i32.const 12)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $12)
     (i32.const 8)
    )
    (i32.const 24)
   )
   (i32.load
    (i32.add
     (get_local $2)
     (i32.const 8)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $12)
     (i32.const 8)
    )
    (i32.const 20)
   )
   (i32.load
    (i32.add
     (get_local $2)
     (i32.const 4)
    )
   )
  )
  (i64.store offset=16
   (get_local $12)
   (get_local $1)
  )
  (i64.store offset=8
   (get_local $12)
   (get_local $0)
  )
  (i32.store offset=24
   (get_local $12)
   (i32.load
    (get_local $2)
   )
  )
  (drop
   (call $_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2ERKS5_
    (i32.add
     (i32.add
      (get_local $12)
      (i32.const 8)
     )
     (i32.const 32)
    )
    (get_local $3)
   )
  )
  (i64.store offset=64
   (get_local $12)
   (get_local $11)
  )
  (i64.store offset=56
   (get_local $12)
   (get_local $10)
  )
  (i64.store
   (tee_local $5
    (call $_Znwj
     (i32.const 16)
    )
   )
   (get_local $0)
  )
  (i64.store offset=8
   (get_local $5)
   (get_local $8)
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $12)
     (i32.const 56)
    )
    (i32.const 32)
   )
   (i32.const 0)
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $12)
     (i32.const 56)
    )
    (i32.const 24)
   )
   (tee_local $4
    (i32.add
     (get_local $5)
     (i32.const 16)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $12)
     (i32.const 56)
    )
    (i32.const 20)
   )
   (get_local $4)
  )
  (i32.store offset=72
   (get_local $12)
   (get_local $5)
  )
  (i32.store offset=84
   (get_local $12)
   (i32.const 0)
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $12)
     (i32.const 56)
    )
    (i32.const 36)
   )
   (i32.const 0)
  )
  (set_local $5
   (i32.add
    (tee_local $4
     (select
      (i32.load
       (i32.add
        (i32.add
         (get_local $12)
         (i32.const 8)
        )
        (i32.const 36)
       )
      )
      (i32.shr_u
       (tee_local $5
        (i32.load8_u offset=40
         (get_local $12)
        )
       )
       (i32.const 1)
      )
      (i32.and
       (get_local $5)
       (i32.const 1)
      )
     )
    )
    (i32.const 32)
   )
  )
  (set_local $7
   (i64.extend_u/i32
    (get_local $4)
   )
  )
  (set_local $4
   (i32.add
    (i32.add
     (get_local $12)
     (i32.const 56)
    )
    (i32.const 28)
   )
  )
  (loop $label$18
   (set_local $5
    (i32.add
     (get_local $5)
     (i32.const 1)
    )
   )
   (br_if $label$18
    (i64.ne
     (tee_local $7
      (i64.shr_u
       (get_local $7)
       (i64.const 7)
      )
     )
     (i64.const 0)
    )
   )
  )
  (block $label$19
   (block $label$20
    (br_if $label$20
     (i32.eqz
      (get_local $5)
     )
    )
    (call $_ZNSt3__16vectorIcNS_9allocatorIcEEE8__appendEj
     (get_local $4)
     (get_local $5)
    )
    (set_local $4
     (i32.load
      (i32.add
       (get_local $12)
       (i32.const 88)
      )
     )
    )
    (set_local $5
     (i32.load
      (i32.add
       (get_local $12)
       (i32.const 84)
      )
     )
    )
    (br $label$19)
   )
   (set_local $4
    (i32.const 0)
   )
   (set_local $5
    (i32.const 0)
   )
  )
  (i32.store offset=100
   (get_local $12)
   (get_local $5)
  )
  (i32.store offset=96
   (get_local $12)
   (get_local $5)
  )
  (i32.store offset=104
   (get_local $12)
   (get_local $4)
  )
  (i32.store offset=112
   (get_local $12)
   (i32.add
    (get_local $12)
    (i32.const 96)
   )
  )
  (i32.store offset=120
   (get_local $12)
   (i32.add
    (get_local $12)
    (i32.const 8)
   )
  )
  (call $_ZN5boost6fusion6detail17for_each_unrolledILi4EE4callINS0_18std_tuple_iteratorIKNSt3__15tupleIJyyN5eosio5assetENS6_12basic_stringIcNS6_11char_traitsIcEENS6_9allocatorIcEEEEEEELi0EEEZNS8_lsINS8_10datastreamIPcEEJyyS9_SF_EEERT_SO_RKNS7_IJDpT0_EEEEUlRKSN_E_EEvSV_RKT0_
   (i32.add
    (get_local $12)
    (i32.const 120)
   )
   (i32.add
    (get_local $12)
    (i32.const 112)
   )
  )
  (call $_ZN5eosio4packINS_6actionEEENSt3__16vectorIcNS2_9allocatorIcEEEERKT_
   (i32.add
    (get_local $12)
    (i32.const 96)
   )
   (i32.add
    (get_local $12)
    (i32.const 56)
   )
  )
  (call $send_inline
   (tee_local $5
    (i32.load offset=96
     (get_local $12)
    )
   )
   (i32.sub
    (i32.load offset=100
     (get_local $12)
    )
    (get_local $5)
   )
  )
  (block $label$21
   (br_if $label$21
    (i32.eqz
     (tee_local $5
      (i32.load offset=96
       (get_local $12)
      )
     )
    )
   )
   (i32.store offset=100
    (get_local $12)
    (get_local $5)
   )
   (call $_ZdlPv
    (get_local $5)
   )
  )
  (block $label$22
   (br_if $label$22
    (i32.eqz
     (tee_local $5
      (i32.load offset=84
       (get_local $12)
      )
     )
    )
   )
   (i32.store
    (i32.add
     (get_local $12)
     (i32.const 88)
    )
    (get_local $5)
   )
   (call $_ZdlPv
    (get_local $5)
   )
  )
  (block $label$23
   (br_if $label$23
    (i32.eqz
     (tee_local $5
      (i32.load offset=72
       (get_local $12)
      )
     )
    )
   )
   (i32.store
    (i32.add
     (get_local $12)
     (i32.const 76)
    )
    (get_local $5)
   )
   (call $_ZdlPv
    (get_local $5)
   )
  )
  (block $label$24
   (br_if $label$24
    (i32.eqz
     (i32.and
      (i32.load8_u offset=40
       (get_local $12)
      )
      (i32.const 1)
     )
    )
   )
   (call $_ZdlPv
    (i32.load
     (i32.add
      (get_local $12)
      (i32.const 48)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $12)
    (i32.const 128)
   )
  )
 )
 (func $_ZN8exchange11ramexchange15getFromBuyQueueEv (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (set_local $5
   (i64.const 0)
  )
  (set_local $4
   (i64.const 59)
  )
  (set_local $3
   (i32.const 704)
  )
  (set_local $6
   (i64.const 0)
  )
  (loop $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_if $label$5
         (i64.gt_u
          (get_local $5)
          (i64.const 5)
         )
        )
        (br_if $label$4
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $2
             (i32.load8_s
              (get_local $3)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $2
         (i32.add
          (get_local $2)
          (i32.const 165)
         )
        )
        (br $label$3)
       )
       (set_local $7
        (i64.const 0)
       )
       (br_if $label$2
        (i64.le_u
         (get_local $5)
         (i64.const 11)
        )
       )
       (br $label$1)
      )
      (set_local $2
       (select
        (i32.add
         (get_local $2)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $2)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $7
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $2)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $7
     (i64.shl
      (i64.and
       (get_local $7)
       (i64.const 31)
      )
      (i64.and
       (get_local $4)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $3
    (i32.add
     (get_local $3)
     (i32.const 1)
    )
   )
   (set_local $5
    (i64.add
     (get_local $5)
     (i64.const 1)
    )
   )
   (set_local $6
    (i64.or
     (get_local $7)
     (get_local $6)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $4
      (i64.add
       (get_local $4)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (set_local $5
   (call $current_time)
  )
  (i64.store offset=8
   (get_local $0)
   (get_local $6)
  )
  (i64.store
   (get_local $0)
   (get_local $5)
  )
  (i64.store offset=16
   (get_local $0)
   (i64.const 1)
  )
  (i64.store
   (i32.add
    (get_local $0)
    (i32.const 24)
   )
   (i64.const 1398362884)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 384)
  )
  (set_local $5
   (i64.const 5462355)
  )
  (set_local $3
   (i32.const 0)
  )
  (block $label$6
   (block $label$7
    (loop $label$8
     (br_if $label$7
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $5)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$9
      (br_if $label$9
       (i64.ne
        (i64.and
         (tee_local $5
          (i64.shr_u
           (get_local $5)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$10
       (br_if $label$7
        (i64.ne
         (i64.and
          (tee_local $5
           (i64.shr_u
            (get_local $5)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$10
        (i32.lt_s
         (tee_local $3
          (i32.add
           (get_local $3)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $2
      (i32.const 1)
     )
     (br_if $label$8
      (i32.lt_s
       (tee_local $3
        (i32.add
         (get_local $3)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$6)
    )
   )
   (set_local $2
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $2)
   (i32.const 112)
  )
  (i32.store8 offset=36
   (get_local $0)
   (i32.const 0)
  )
  (i32.store offset=32
   (get_local $0)
   (i32.const 0)
  )
 )
 (func $_ZNK5eosio10ram_market12get_rampriceEv (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $7
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 32)
    )
   )
  )
  (set_local $6
   (i32.const 0)
  )
  (set_local $5
   (i32.const 0)
  )
  (block $label$0
   (br_if $label$0
    (i32.lt_s
     (tee_local $2
      (call $db_lowerbound_i64
       (i64.load
        (get_local $1)
       )
       (i64.load offset=8
        (get_local $1)
       )
       (i64.const -5069606918720847872)
       (i64.const 0)
      )
     )
     (i32.const 0)
    )
   )
   (set_local $5
    (call $_ZNK5eosio11multi_indexILy13377137154988703744EN11eosiosystem14exchange_stateEJEE31load_object_by_primary_iteratorEl
     (get_local $1)
     (get_local $2)
    )
   )
  )
  (call $eosio_assert
   (i32.ne
    (get_local $5)
    (i32.const 0)
   )
   (i32.const 448)
  )
  (i32.store
   (i32.add
    (get_local $7)
    (i32.const 28)
   )
   (i32.load
    (i32.add
     (get_local $5)
     (i32.const 52)
    )
   )
  )
  (i32.store
   (tee_local $1
    (i32.add
     (get_local $7)
     (i32.const 24)
    )
   )
   (i32.load
    (i32.add
     (get_local $5)
     (i32.const 48)
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $7)
    (i32.const 20)
   )
   (i32.load
    (i32.add
     (get_local $5)
     (i32.const 44)
    )
   )
  )
  (i32.store
   (tee_local $2
    (i32.add
     (get_local $7)
     (i32.const 16)
    )
   )
   (i32.load
    (i32.add
     (get_local $5)
     (i32.const 40)
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $7)
    (i32.const 12)
   )
   (i32.load
    (i32.add
     (get_local $5)
     (i32.const 36)
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $7)
    (i32.const 8)
   )
   (i32.load
    (i32.add
     (get_local $5)
     (i32.const 32)
    )
   )
  )
  (i32.store offset=4
   (get_local $7)
   (i32.load
    (i32.add
     (get_local $5)
     (i32.const 28)
    )
   )
  )
  (i32.store
   (get_local $7)
   (i32.load
    (i32.add
     (get_local $5)
     (i32.const 24)
    )
   )
  )
  (set_local $3
   (i64.load offset=16
    (get_local $5)
   )
  )
  (i64.store
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
   (i64.load
    (get_local $1)
   )
  )
  (i64.store
   (get_local $0)
   (i64.load
    (get_local $2)
   )
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 496)
  )
  (call $eosio_assert
   (i64.gt_s
    (tee_local $4
     (i64.load
      (get_local $0)
     )
    )
    (i64.const -4611686018427387904)
   )
   (i32.const 544)
  )
  (call $eosio_assert
   (i64.lt_s
    (get_local $4)
    (i64.const 4611686018427387904)
   )
   (i32.const 576)
  )
  (i64.store
   (get_local $0)
   (tee_local $4
    (i64.div_s
     (i64.shl
      (get_local $4)
      (i64.const 10)
     )
     (get_local $3)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i64.gt_u
     (i64.add
      (get_local $4)
      (i64.const 4611686018427387903)
     )
     (i64.const 9223372036854775806)
    )
   )
   (set_local $4
    (i64.shr_u
     (i64.load offset=8
      (get_local $0)
     )
     (i64.const 8)
    )
   )
   (set_local $5
    (i32.const 0)
   )
   (block $label$2
    (loop $label$3
     (br_if $label$2
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $4)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$4
      (br_if $label$4
       (i64.ne
        (i64.and
         (tee_local $4
          (i64.shr_u
           (get_local $4)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$5
       (br_if $label$2
        (i64.ne
         (i64.and
          (tee_local $4
           (i64.shr_u
            (get_local $4)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$5
        (i32.lt_s
         (tee_local $5
          (i32.add
           (get_local $5)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $6
      (i32.const 1)
     )
     (br_if $label$3
      (i32.lt_s
       (tee_local $5
        (i32.add
         (get_local $5)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$1)
    )
   )
   (set_local $6
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $6)
   (i32.const 608)
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $7)
    (i32.const 32)
   )
  )
 )
 (func $_ZNK5eosio11multi_indexILy13377137154988703744EN11eosiosystem14exchange_stateEJEE31load_object_by_primary_iteratorEl (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $9
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 48)
    )
   )
  )
  (i32.store offset=44
   (tee_local $8
    (get_local $9)
   )
   (get_local $1)
  )
  (block $label$0
   (br_if $label$0
    (i32.eq
     (tee_local $7
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 28)
       )
      )
     )
     (tee_local $2
      (i32.load offset=24
       (get_local $0)
      )
     )
    )
   )
   (set_local $3
    (i32.sub
     (i32.const 0)
     (get_local $2)
    )
   )
   (set_local $6
    (i32.add
     (get_local $7)
     (i32.const -24)
    )
   )
   (loop $label$1
    (br_if $label$0
     (i32.eq
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const 16)
       )
      )
      (get_local $1)
     )
    )
    (set_local $7
     (get_local $6)
    )
    (set_local $6
     (tee_local $4
      (i32.add
       (get_local $6)
       (i32.const -24)
      )
     )
    )
    (br_if $label$1
     (i32.ne
      (i32.add
       (get_local $4)
       (get_local $3)
      )
      (i32.const -24)
     )
    )
   )
  )
  (block $label$2
   (block $label$3
    (br_if $label$3
     (i32.eq
      (get_local $7)
      (get_local $2)
     )
    )
    (set_local $6
     (i32.load
      (i32.add
       (get_local $7)
       (i32.const -24)
      )
     )
    )
    (br $label$2)
   )
   (call $eosio_assert
    (i32.xor
     (i32.shr_u
      (tee_local $6
       (call $db_get_i64
        (get_local $1)
        (i32.const 0)
        (i32.const 0)
       )
      )
      (i32.const 31)
     )
     (i32.const 1)
    )
    (i32.const 656)
   )
   (block $label$4
    (block $label$5
     (br_if $label$5
      (i32.lt_u
       (get_local $6)
       (i32.const 513)
      )
     )
     (set_local $4
      (call $malloc
       (get_local $6)
      )
     )
     (br $label$4)
    )
    (i32.store offset=4
     (i32.const 0)
     (tee_local $4
      (i32.sub
       (get_local $9)
       (i32.and
        (i32.add
         (get_local $6)
         (i32.const 15)
        )
        (i32.const -16)
       )
      )
     )
    )
   )
   (drop
    (call $db_get_i64
     (get_local $1)
     (get_local $4)
     (get_local $6)
    )
   )
   (i32.store offset=36
    (get_local $8)
    (get_local $4)
   )
   (i32.store offset=32
    (get_local $8)
    (get_local $4)
   )
   (i32.store offset=40
    (get_local $8)
    (i32.add
     (get_local $4)
     (get_local $6)
    )
   )
   (block $label$6
    (br_if $label$6
     (i32.lt_u
      (get_local $6)
      (i32.const 513)
     )
    )
    (call $free
     (get_local $4)
    )
   )
   (i32.store offset=8
    (get_local $8)
    (get_local $0)
   )
   (i32.store offset=12
    (get_local $8)
    (i32.add
     (get_local $8)
     (i32.const 32)
    )
   )
   (i32.store offset=16
    (get_local $8)
    (i32.add
     (get_local $8)
     (i32.const 44)
    )
   )
   (drop
    (call $_ZN11eosiosystem14exchange_stateC2Ev
     (tee_local $6
      (call $_Znwj
       (i32.const 80)
      )
     )
    )
   )
   (i32.store offset=64
    (get_local $6)
    (get_local $0)
   )
   (call $_ZZNK5eosio11multi_indexILy13377137154988703744EN11eosiosystem14exchange_stateEJEE31load_object_by_primary_iteratorElENKUlRT_E_clINS3_4itemEEEDaS5_
    (i32.add
     (get_local $8)
     (i32.const 8)
    )
    (get_local $6)
   )
   (i32.store offset=24
    (get_local $8)
    (get_local $6)
   )
   (i64.store offset=8
    (get_local $8)
    (tee_local $5
     (i64.load offset=8
      (get_local $6)
     )
    )
   )
   (i32.store offset=4
    (get_local $8)
    (tee_local $7
     (i32.load offset=68
      (get_local $6)
     )
    )
   )
   (block $label$7
    (block $label$8
     (br_if $label$8
      (i32.ge_u
       (tee_local $4
        (i32.load
         (tee_local $1
          (i32.add
           (get_local $0)
           (i32.const 28)
          )
         )
        )
       )
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 32)
        )
       )
      )
     )
     (i64.store offset=8
      (get_local $4)
      (get_local $5)
     )
     (i32.store offset=16
      (get_local $4)
      (get_local $7)
     )
     (i32.store offset=24
      (get_local $8)
      (i32.const 0)
     )
     (i32.store
      (get_local $4)
      (get_local $6)
     )
     (i32.store
      (get_local $1)
      (i32.add
       (get_local $4)
       (i32.const 24)
      )
     )
     (br $label$7)
    )
    (call $_ZNSt3__16vectorIN5eosio11multi_indexILy13377137154988703744EN11eosiosystem14exchange_stateEJEE8item_ptrENS_9allocatorIS6_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS5_4itemENS_14default_deleteISC_EEEERyRlEEEvDpOT_
     (i32.add
      (get_local $0)
      (i32.const 24)
     )
     (i32.add
      (get_local $8)
      (i32.const 24)
     )
     (i32.add
      (get_local $8)
      (i32.const 8)
     )
     (i32.add
      (get_local $8)
      (i32.const 4)
     )
    )
   )
   (set_local $4
    (i32.load offset=24
     (get_local $8)
    )
   )
   (i32.store offset=24
    (get_local $8)
    (i32.const 0)
   )
   (br_if $label$2
    (i32.eqz
     (get_local $4)
    )
   )
   (call $_ZdlPv
    (get_local $4)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 48)
   )
  )
  (get_local $6)
 )
 (func $_ZN11eosiosystem14exchange_stateC2Ev (param $0 i32) (result i32)
  (local $1 i64)
  (local $2 i32)
  (local $3 i32)
  (i64.store offset=8
   (get_local $0)
   (i64.const 1398362884)
  )
  (i64.store
   (get_local $0)
   (i64.const 0)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 384)
  )
  (set_local $1
   (i64.shr_u
    (i64.load offset=8
     (get_local $0)
    )
    (i64.const 8)
   )
  )
  (set_local $2
   (i32.const 0)
  )
  (block $label$0
   (block $label$1
    (loop $label$2
     (br_if $label$1
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $1)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$3
      (br_if $label$3
       (i64.ne
        (i64.and
         (tee_local $1
          (i64.shr_u
           (get_local $1)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$4
       (br_if $label$1
        (i64.ne
         (i64.and
          (tee_local $1
           (i64.shr_u
            (get_local $1)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$4
        (i32.lt_s
         (tee_local $2
          (i32.add
           (get_local $2)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $3
      (i32.const 1)
     )
     (br_if $label$2
      (i32.lt_s
       (tee_local $2
        (i32.add
         (get_local $2)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$0)
    )
   )
   (set_local $3
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $3)
   (i32.const 112)
  )
  (i64.store
   (tee_local $2
    (i32.add
     (get_local $0)
     (i32.const 24)
    )
   )
   (i64.const 1398362884)
  )
  (i64.store offset=16
   (get_local $0)
   (i64.const 0)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 384)
  )
  (set_local $1
   (i64.shr_u
    (i64.load
     (get_local $2)
    )
    (i64.const 8)
   )
  )
  (set_local $2
   (i32.const 0)
  )
  (block $label$5
   (block $label$6
    (loop $label$7
     (br_if $label$6
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $1)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$8
      (br_if $label$8
       (i64.ne
        (i64.and
         (tee_local $1
          (i64.shr_u
           (get_local $1)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$9
       (br_if $label$6
        (i64.ne
         (i64.and
          (tee_local $1
           (i64.shr_u
            (get_local $1)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$9
        (i32.lt_s
         (tee_local $2
          (i32.add
           (get_local $2)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $3
      (i32.const 1)
     )
     (br_if $label$7
      (i32.lt_s
       (tee_local $2
        (i32.add
         (get_local $2)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$5)
    )
   )
   (set_local $3
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $3)
   (i32.const 112)
  )
  (i64.store offset=40
   (get_local $0)
   (i64.const 0)
  )
  (i64.store
   (i32.add
    (get_local $0)
    (i32.const 32)
   )
   (i64.const 4602678819172646912)
  )
  (i64.store
   (tee_local $2
    (i32.add
     (get_local $0)
     (i32.const 48)
    )
   )
   (i64.const 1398362884)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 384)
  )
  (set_local $1
   (i64.shr_u
    (i64.load
     (get_local $2)
    )
    (i64.const 8)
   )
  )
  (set_local $2
   (i32.const 0)
  )
  (block $label$10
   (block $label$11
    (loop $label$12
     (br_if $label$11
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $1)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$13
      (br_if $label$13
       (i64.ne
        (i64.and
         (tee_local $1
          (i64.shr_u
           (get_local $1)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$14
       (br_if $label$11
        (i64.ne
         (i64.and
          (tee_local $1
           (i64.shr_u
            (get_local $1)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$14
        (i32.lt_s
         (tee_local $2
          (i32.add
           (get_local $2)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $3
      (i32.const 1)
     )
     (br_if $label$12
      (i32.lt_s
       (tee_local $2
        (i32.add
         (get_local $2)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$10)
    )
   )
   (set_local $3
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $3)
   (i32.const 112)
  )
  (i64.store
   (i32.add
    (get_local $0)
    (i32.const 56)
   )
   (i64.const 4602678819172646912)
  )
  (get_local $0)
 )
 (func $_ZZNK5eosio11multi_indexILy13377137154988703744EN11eosiosystem14exchange_stateEJEE31load_object_by_primary_iteratorElENKUlRT_E_clINS3_4itemEEEDaS5_ (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (tee_local $2
       (i32.load offset=4
        (get_local $0)
       )
      )
     )
     (i32.load offset=4
      (get_local $2)
     )
    )
    (i32.const 7)
   )
   (i32.const 688)
  )
  (drop
   (call $memcpy
    (get_local $1)
    (i32.load offset=4
     (get_local $2)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $2)
   (tee_local $3
    (i32.add
     (i32.load offset=4
      (get_local $2)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $2)
     )
     (get_local $3)
    )
    (i32.const 7)
   )
   (i32.const 688)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 8)
    )
    (i32.load offset=4
     (get_local $2)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $2)
   (tee_local $3
    (i32.add
     (i32.load offset=4
      (get_local $2)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $2)
     )
     (get_local $3)
    )
    (i32.const 7)
   )
   (i32.const 688)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 16)
    )
    (i32.load offset=4
     (get_local $2)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $2)
   (tee_local $3
    (i32.add
     (i32.load offset=4
      (get_local $2)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $2)
     )
     (get_local $3)
    )
    (i32.const 7)
   )
   (i32.const 688)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 24)
    )
    (i32.load offset=4
     (get_local $2)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $2)
   (tee_local $3
    (i32.add
     (i32.load offset=4
      (get_local $2)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $2)
     )
     (get_local $3)
    )
    (i32.const 7)
   )
   (i32.const 688)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 32)
    )
    (i32.load offset=4
     (get_local $2)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $2)
   (tee_local $3
    (i32.add
     (i32.load offset=4
      (get_local $2)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $2)
     )
     (get_local $3)
    )
    (i32.const 7)
   )
   (i32.const 688)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 40)
    )
    (i32.load offset=4
     (get_local $2)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $2)
   (tee_local $3
    (i32.add
     (i32.load offset=4
      (get_local $2)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $2)
     )
     (get_local $3)
    )
    (i32.const 7)
   )
   (i32.const 688)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 48)
    )
    (i32.load offset=4
     (get_local $2)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $2)
   (tee_local $3
    (i32.add
     (i32.load offset=4
      (get_local $2)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $2)
     )
     (get_local $3)
    )
    (i32.const 7)
   )
   (i32.const 688)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $1)
     (i32.const 56)
    )
    (i32.load offset=4
     (get_local $2)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $2)
   (i32.add
    (i32.load offset=4
     (get_local $2)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=68
   (get_local $1)
   (i32.load
    (i32.load offset=8
     (get_local $0)
    )
   )
  )
 )
 (func $_ZNSt3__16vectorIN5eosio11multi_indexILy13377137154988703744EN11eosiosystem14exchange_stateEJEE8item_ptrENS_9allocatorIS6_EEE24__emplace_back_slow_pathIJNS_10unique_ptrINS5_4itemENS_14default_deleteISC_EEEERyRlEEEvDpOT_ (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.ge_u
      (tee_local $5
       (i32.add
        (tee_local $4
         (i32.div_s
          (i32.sub
           (i32.load offset=4
            (get_local $0)
           )
           (tee_local $6
            (i32.load
             (get_local $0)
            )
           )
          )
          (i32.const 24)
         )
        )
        (i32.const 1)
       )
      )
      (i32.const 178956971)
     )
    )
    (set_local $7
     (i32.const 178956970)
    )
    (block $label$2
     (block $label$3
      (br_if $label$3
       (i32.gt_u
        (tee_local $6
         (i32.div_s
          (i32.sub
           (i32.load offset=8
            (get_local $0)
           )
           (get_local $6)
          )
          (i32.const 24)
         )
        )
        (i32.const 89478484)
       )
      )
      (br_if $label$2
       (i32.eqz
        (tee_local $7
         (select
          (get_local $5)
          (tee_local $7
           (i32.shl
            (get_local $6)
            (i32.const 1)
           )
          )
          (i32.lt_u
           (get_local $7)
           (get_local $5)
          )
         )
        )
       )
      )
     )
     (set_local $6
      (call $_Znwj
       (i32.mul
        (get_local $7)
        (i32.const 24)
       )
      )
     )
     (br $label$0)
    )
    (set_local $7
     (i32.const 0)
    )
    (set_local $6
     (i32.const 0)
    )
    (br $label$0)
   )
   (call $_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv
    (get_local $0)
   )
   (unreachable)
  )
  (set_local $5
   (i32.load
    (get_local $1)
   )
  )
  (i32.store
   (get_local $1)
   (i32.const 0)
  )
  (i32.store
   (tee_local $1
    (i32.add
     (get_local $6)
     (i32.mul
      (get_local $4)
      (i32.const 24)
     )
    )
   )
   (get_local $5)
  )
  (i64.store offset=8
   (get_local $1)
   (i64.load
    (get_local $2)
   )
  )
  (i32.store offset=16
   (get_local $1)
   (i32.load
    (get_local $3)
   )
  )
  (set_local $4
   (i32.add
    (get_local $6)
    (i32.mul
     (get_local $7)
     (i32.const 24)
    )
   )
  )
  (set_local $5
   (i32.add
    (get_local $1)
    (i32.const 24)
   )
  )
  (block $label$4
   (block $label$5
    (br_if $label$5
     (i32.eq
      (tee_local $6
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 4)
        )
       )
      )
      (tee_local $7
       (i32.load
        (get_local $0)
       )
      )
     )
    )
    (loop $label$6
     (set_local $3
      (i32.load
       (tee_local $2
        (i32.add
         (get_local $6)
         (i32.const -24)
        )
       )
      )
     )
     (i32.store
      (get_local $2)
      (i32.const 0)
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -24)
      )
      (get_local $3)
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -8)
      )
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const -8)
       )
      )
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -12)
      )
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const -12)
       )
      )
     )
     (i32.store
      (i32.add
       (get_local $1)
       (i32.const -16)
      )
      (i32.load
       (i32.add
        (get_local $6)
        (i32.const -16)
       )
      )
     )
     (set_local $1
      (i32.add
       (get_local $1)
       (i32.const -24)
      )
     )
     (set_local $6
      (get_local $2)
     )
     (br_if $label$6
      (i32.ne
       (get_local $7)
       (get_local $2)
      )
     )
    )
    (set_local $7
     (i32.load
      (i32.add
       (get_local $0)
       (i32.const 4)
      )
     )
    )
    (set_local $6
     (i32.load
      (get_local $0)
     )
    )
    (br $label$4)
   )
   (set_local $6
    (get_local $7)
   )
  )
  (i32.store
   (get_local $0)
   (get_local $1)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 4)
   )
   (get_local $5)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
   (get_local $4)
  )
  (block $label$7
   (br_if $label$7
    (i32.eq
     (get_local $7)
     (get_local $6)
    )
   )
   (loop $label$8
    (set_local $1
     (i32.load
      (tee_local $7
       (i32.add
        (get_local $7)
        (i32.const -24)
       )
      )
     )
    )
    (i32.store
     (get_local $7)
     (i32.const 0)
    )
    (block $label$9
     (br_if $label$9
      (i32.eqz
       (get_local $1)
      )
     )
     (call $_ZdlPv
      (get_local $1)
     )
    )
    (br_if $label$8
     (i32.ne
      (get_local $6)
      (get_local $7)
     )
    )
   )
  )
  (block $label$10
   (br_if $label$10
    (i32.eqz
     (get_local $6)
    )
   )
   (call $_ZdlPv
    (get_local $6)
   )
  )
 )
 (func $_ZNSt3__16vectorIcNS_9allocatorIcEEE8__appendEj (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (block $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (br_if $label$4
        (i32.ge_u
         (i32.sub
          (tee_local $2
           (i32.load offset=8
            (get_local $0)
           )
          )
          (tee_local $6
           (i32.load offset=4
            (get_local $0)
           )
          )
         )
         (get_local $1)
        )
       )
       (br_if $label$2
        (i32.le_s
         (tee_local $4
          (i32.add
           (tee_local $3
            (i32.sub
             (get_local $6)
             (tee_local $5
              (i32.load
               (get_local $0)
              )
             )
            )
           )
           (get_local $1)
          )
         )
         (i32.const -1)
        )
       )
       (set_local $6
        (i32.const 2147483647)
       )
       (block $label$5
        (br_if $label$5
         (i32.gt_u
          (tee_local $2
           (i32.sub
            (get_local $2)
            (get_local $5)
           )
          )
          (i32.const 1073741822)
         )
        )
        (br_if $label$3
         (i32.eqz
          (tee_local $6
           (select
            (get_local $4)
            (tee_local $6
             (i32.shl
              (get_local $2)
              (i32.const 1)
             )
            )
            (i32.lt_u
             (get_local $6)
             (get_local $4)
            )
           )
          )
         )
        )
       )
       (set_local $2
        (call $_Znwj
         (get_local $6)
        )
       )
       (br $label$1)
      )
      (set_local $0
       (i32.add
        (get_local $0)
        (i32.const 4)
       )
      )
      (loop $label$6
       (i32.store8
        (get_local $6)
        (i32.const 0)
       )
       (i32.store
        (get_local $0)
        (tee_local $6
         (i32.add
          (i32.load
           (get_local $0)
          )
          (i32.const 1)
         )
        )
       )
       (br_if $label$6
        (tee_local $1
         (i32.add
          (get_local $1)
          (i32.const -1)
         )
        )
       )
       (br $label$0)
      )
     )
     (set_local $6
      (i32.const 0)
     )
     (set_local $2
      (i32.const 0)
     )
     (br $label$1)
    )
    (call $_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv
     (get_local $0)
    )
    (unreachable)
   )
   (set_local $4
    (i32.add
     (get_local $2)
     (get_local $6)
    )
   )
   (set_local $6
    (tee_local $5
     (i32.add
      (get_local $2)
      (get_local $3)
     )
    )
   )
   (loop $label$7
    (i32.store8
     (get_local $6)
     (i32.const 0)
    )
    (set_local $6
     (i32.add
      (get_local $6)
      (i32.const 1)
     )
    )
    (br_if $label$7
     (tee_local $1
      (i32.add
       (get_local $1)
       (i32.const -1)
      )
     )
    )
   )
   (set_local $5
    (i32.sub
     (get_local $5)
     (tee_local $2
      (i32.sub
       (i32.load
        (tee_local $3
         (i32.add
          (get_local $0)
          (i32.const 4)
         )
        )
       )
       (tee_local $1
        (i32.load
         (get_local $0)
        )
       )
      )
     )
    )
   )
   (block $label$8
    (br_if $label$8
     (i32.lt_s
      (get_local $2)
      (i32.const 1)
     )
    )
    (drop
     (call $memcpy
      (get_local $5)
      (get_local $1)
      (get_local $2)
     )
    )
    (set_local $1
     (i32.load
      (get_local $0)
     )
    )
   )
   (i32.store
    (get_local $0)
    (get_local $5)
   )
   (i32.store
    (get_local $3)
    (get_local $6)
   )
   (i32.store
    (i32.add
     (get_local $0)
     (i32.const 8)
    )
    (get_local $4)
   )
   (br_if $label$0
    (i32.eqz
     (get_local $1)
    )
   )
   (call $_ZdlPv
    (get_local $1)
   )
   (return)
  )
 )
 (func $_ZN5boost6fusion6detail17for_each_unrolledILi4EE4callINS0_18std_tuple_iteratorIKNSt3__15tupleIJyyN5eosio5assetENS6_12basic_stringIcNS6_11char_traitsIcEENS6_9allocatorIcEEEEEEELi0EEEZNS8_lsINS8_10datastreamIPcEEJyyS9_SF_EEERT_SO_RKNS7_IJDpT0_EEEEUlRKSN_E_EEvSV_RKT0_ (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (set_local $2
   (i32.load
    (get_local $0)
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (tee_local $3
       (i32.load
        (get_local $1)
       )
      )
     )
     (i32.load offset=4
      (get_local $3)
     )
    )
    (i32.const 7)
   )
   (i32.const 800)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $3)
    )
    (get_local $2)
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $3)
   (i32.add
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 8)
   )
  )
  (set_local $0
   (i32.load
    (get_local $0)
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (tee_local $3
       (i32.load
        (get_local $1)
       )
      )
     )
     (i32.load offset=4
      (get_local $3)
     )
    )
    (i32.const 7)
   )
   (i32.const 800)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $3)
    )
    (i32.add
     (get_local $0)
     (i32.const 8)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $3)
   (i32.add
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 8)
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (tee_local $3
       (i32.load
        (get_local $1)
       )
      )
     )
     (i32.load offset=4
      (get_local $3)
     )
    )
    (i32.const 7)
   )
   (i32.const 800)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $3)
    )
    (i32.add
     (get_local $0)
     (i32.const 16)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $3)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $3)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (i32.load offset=8
      (get_local $3)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 800)
  )
  (drop
   (call $memcpy
    (i32.load offset=4
     (get_local $3)
    )
    (i32.add
     (get_local $0)
     (i32.const 24)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $3)
   (i32.add
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 8)
   )
  )
  (drop
   (call $_ZN5eosiolsINS_10datastreamIPcEEEERT_S5_RKNSt3__112basic_stringIcNS6_11char_traitsIcEENS6_9allocatorIcEEEE
    (i32.load
     (get_local $1)
    )
    (i32.add
     (get_local $0)
     (i32.const 32)
    )
   )
  )
 )
 (func $_ZN5eosio4packINS_6actionEEENSt3__16vectorIcNS2_9allocatorIcEEEERKT_ (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $8
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
  (i32.store offset=8
   (get_local $0)
   (i32.const 0)
  )
  (i64.store align=4
   (get_local $0)
   (i64.const 0)
  )
  (set_local $5
   (i32.const 16)
  )
  (set_local $2
   (i32.add
    (get_local $1)
    (i32.const 16)
   )
  )
  (set_local $6
   (i64.extend_u/i32
    (i32.shr_s
     (tee_local $4
      (i32.sub
       (tee_local $7
        (i32.load
         (i32.add
          (get_local $1)
          (i32.const 20)
         )
        )
       )
       (tee_local $3
        (i32.load offset=16
         (get_local $1)
        )
       )
      )
     )
     (i32.const 4)
    )
   )
  )
  (loop $label$0
   (set_local $5
    (i32.add
     (get_local $5)
     (i32.const 1)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $6
      (i64.shr_u
       (get_local $6)
       (i64.const 7)
      )
     )
     (i64.const 0)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.eq
     (get_local $3)
     (get_local $7)
    )
   )
   (set_local $5
    (i32.add
     (i32.and
      (get_local $4)
      (i32.const -16)
     )
     (get_local $5)
    )
   )
  )
  (set_local $5
   (i32.sub
    (i32.sub
     (tee_local $7
      (i32.load offset=28
       (get_local $1)
      )
     )
     (get_local $5)
    )
    (tee_local $3
     (i32.load
      (i32.add
       (get_local $1)
       (i32.const 32)
      )
     )
    )
   )
  )
  (set_local $4
   (i32.add
    (get_local $1)
    (i32.const 28)
   )
  )
  (set_local $6
   (i64.extend_u/i32
    (i32.sub
     (get_local $3)
     (get_local $7)
    )
   )
  )
  (loop $label$2
   (set_local $5
    (i32.add
     (get_local $5)
     (i32.const -1)
    )
   )
   (br_if $label$2
    (i64.ne
     (tee_local $6
      (i64.shr_u
       (get_local $6)
       (i64.const 7)
      )
     )
     (i64.const 0)
    )
   )
  )
  (set_local $7
   (i32.const 0)
  )
  (block $label$3
   (block $label$4
    (br_if $label$4
     (i32.eqz
      (get_local $5)
     )
    )
    (call $_ZNSt3__16vectorIcNS_9allocatorIcEEE8__appendEj
     (get_local $0)
     (i32.sub
      (i32.const 0)
      (get_local $5)
     )
    )
    (set_local $7
     (i32.load
      (i32.add
       (get_local $0)
       (i32.const 4)
      )
     )
    )
    (set_local $5
     (i32.load
      (get_local $0)
     )
    )
    (br $label$3)
   )
   (set_local $5
    (i32.const 0)
   )
  )
  (i32.store
   (get_local $8)
   (get_local $5)
  )
  (i32.store offset=8
   (get_local $8)
   (get_local $7)
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (get_local $7)
     (get_local $5)
    )
    (i32.const 7)
   )
   (i32.const 800)
  )
  (drop
   (call $memcpy
    (get_local $5)
    (get_local $1)
    (i32.const 8)
   )
  )
  (call $eosio_assert
   (i32.gt_s
    (i32.sub
     (get_local $7)
     (tee_local $0
      (i32.add
       (get_local $5)
       (i32.const 8)
      )
     )
    )
    (i32.const 7)
   )
   (i32.const 800)
  )
  (drop
   (call $memcpy
    (get_local $0)
    (i32.add
     (get_local $1)
     (i32.const 8)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $8)
   (i32.add
    (get_local $5)
    (i32.const 16)
   )
  )
  (drop
   (call $_ZN5eosiolsINS_10datastreamIPcEEEERT_S5_RKNSt3__16vectorIcNS6_9allocatorIcEEEE
    (call $_ZN5eosiolsINS_10datastreamIPcEENS_16permission_levelEEERT_S6_RKNSt3__16vectorIT0_NS7_9allocatorIS9_EEEE
     (get_local $8)
     (get_local $2)
    )
    (get_local $4)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 16)
   )
  )
 )
 (func $_ZN5eosiolsINS_10datastreamIPcEENS_16permission_levelEEERT_S6_RKNSt3__16vectorIT0_NS7_9allocatorIS9_EEEE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $7
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
  (set_local $4
   (i64.extend_u/i32
    (i32.shr_s
     (i32.sub
      (i32.load offset=4
       (get_local $1)
      )
      (i32.load
       (get_local $1)
      )
     )
     (i32.const 4)
    )
   )
  )
  (set_local $5
   (i32.load offset=4
    (get_local $0)
   )
  )
  (set_local $2
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
  )
  (loop $label$0
   (set_local $3
    (i32.wrap/i64
     (get_local $4)
    )
   )
   (i32.store8 offset=15
    (get_local $7)
    (i32.or
     (i32.shl
      (tee_local $6
       (i64.ne
        (tee_local $4
         (i64.shr_u
          (get_local $4)
          (i64.const 7)
         )
        )
        (i64.const 0)
       )
      )
      (i32.const 7)
     )
     (i32.and
      (get_local $3)
      (i32.const 127)
     )
    )
   )
   (call $eosio_assert
    (i32.gt_s
     (i32.sub
      (i32.load
       (get_local $2)
      )
      (get_local $5)
     )
     (i32.const 0)
    )
    (i32.const 800)
   )
   (drop
    (call $memcpy
     (i32.load
      (tee_local $3
       (i32.add
        (get_local $0)
        (i32.const 4)
       )
      )
     )
     (i32.add
      (get_local $7)
      (i32.const 15)
     )
     (i32.const 1)
    )
   )
   (i32.store
    (get_local $3)
    (tee_local $5
     (i32.add
      (i32.load
       (get_local $3)
      )
      (i32.const 1)
     )
    )
   )
   (br_if $label$0
    (get_local $6)
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.eq
     (tee_local $6
      (i32.load
       (get_local $1)
      )
     )
     (tee_local $1
      (i32.load
       (i32.add
        (get_local $1)
        (i32.const 4)
       )
      )
     )
    )
   )
   (set_local $3
    (i32.add
     (get_local $0)
     (i32.const 4)
    )
   )
   (loop $label$2
    (call $eosio_assert
     (i32.gt_s
      (i32.sub
       (i32.load
        (tee_local $2
         (i32.add
          (get_local $0)
          (i32.const 8)
         )
        )
       )
       (get_local $5)
      )
      (i32.const 7)
     )
     (i32.const 800)
    )
    (drop
     (call $memcpy
      (i32.load
       (get_local $3)
      )
      (get_local $6)
      (i32.const 8)
     )
    )
    (i32.store
     (get_local $3)
     (tee_local $5
      (i32.add
       (i32.load
        (get_local $3)
       )
       (i32.const 8)
      )
     )
    )
    (call $eosio_assert
     (i32.gt_s
      (i32.sub
       (i32.load
        (get_local $2)
       )
       (get_local $5)
      )
      (i32.const 7)
     )
     (i32.const 800)
    )
    (drop
     (call $memcpy
      (i32.load
       (get_local $3)
      )
      (i32.add
       (get_local $6)
       (i32.const 8)
      )
      (i32.const 8)
     )
    )
    (i32.store
     (get_local $3)
     (tee_local $5
      (i32.add
       (i32.load
        (get_local $3)
       )
       (i32.const 8)
      )
     )
    )
    (br_if $label$2
     (i32.ne
      (tee_local $6
       (i32.add
        (get_local $6)
        (i32.const 16)
       )
      )
      (get_local $1)
     )
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $7)
    (i32.const 16)
   )
  )
  (get_local $0)
 )
 (func $_ZN5eosiolsINS_10datastreamIPcEEEERT_S5_RKNSt3__16vectorIcNS6_9allocatorIcEEEE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $8
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
  (set_local $7
   (i64.extend_u/i32
    (i32.sub
     (i32.load offset=4
      (get_local $1)
     )
     (i32.load
      (get_local $1)
     )
    )
   )
  )
  (set_local $6
   (i32.load offset=4
    (get_local $0)
   )
  )
  (set_local $4
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
  )
  (set_local $5
   (i32.add
    (get_local $0)
    (i32.const 4)
   )
  )
  (loop $label$0
   (set_local $2
    (i32.wrap/i64
     (get_local $7)
    )
   )
   (i32.store8 offset=15
    (get_local $8)
    (i32.or
     (i32.shl
      (tee_local $3
       (i64.ne
        (tee_local $7
         (i64.shr_u
          (get_local $7)
          (i64.const 7)
         )
        )
        (i64.const 0)
       )
      )
      (i32.const 7)
     )
     (i32.and
      (get_local $2)
      (i32.const 127)
     )
    )
   )
   (call $eosio_assert
    (i32.gt_s
     (i32.sub
      (i32.load
       (get_local $4)
      )
      (get_local $6)
     )
     (i32.const 0)
    )
    (i32.const 800)
   )
   (drop
    (call $memcpy
     (i32.load
      (get_local $5)
     )
     (i32.add
      (get_local $8)
      (i32.const 15)
     )
     (i32.const 1)
    )
   )
   (i32.store
    (get_local $5)
    (tee_local $6
     (i32.add
      (i32.load
       (get_local $5)
      )
      (i32.const 1)
     )
    )
   )
   (br_if $label$0
    (get_local $3)
   )
  )
  (call $eosio_assert
   (i32.ge_s
    (i32.sub
     (i32.load
      (i32.add
       (get_local $0)
       (i32.const 8)
      )
     )
     (get_local $6)
    )
    (tee_local $5
     (i32.sub
      (i32.load
       (i32.add
        (get_local $1)
        (i32.const 4)
       )
      )
      (tee_local $2
       (i32.load
        (get_local $1)
       )
      )
     )
    )
   )
   (i32.const 800)
  )
  (drop
   (call $memcpy
    (i32.load
     (tee_local $6
      (i32.add
       (get_local $0)
       (i32.const 4)
      )
     )
    )
    (get_local $2)
    (get_local $5)
   )
  )
  (i32.store
   (get_local $6)
   (i32.add
    (i32.load
     (get_local $6)
    )
    (get_local $5)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 16)
   )
  )
  (get_local $0)
 )
 (func $_ZN5eosiolsINS_10datastreamIPcEEEERT_S5_RKNSt3__112basic_stringIcNS6_11char_traitsIcEENS6_9allocatorIcEEEE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $8
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
  (set_local $7
   (i64.extend_u/i32
    (select
     (i32.load offset=4
      (get_local $1)
     )
     (i32.shr_u
      (tee_local $5
       (i32.load8_u
        (get_local $1)
       )
      )
      (i32.const 1)
     )
     (i32.and
      (get_local $5)
      (i32.const 1)
     )
    )
   )
  )
  (set_local $6
   (i32.load offset=4
    (get_local $0)
   )
  )
  (set_local $4
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
  )
  (set_local $5
   (i32.add
    (get_local $0)
    (i32.const 4)
   )
  )
  (loop $label$0
   (set_local $2
    (i32.wrap/i64
     (get_local $7)
    )
   )
   (i32.store8 offset=15
    (get_local $8)
    (i32.or
     (i32.shl
      (tee_local $3
       (i64.ne
        (tee_local $7
         (i64.shr_u
          (get_local $7)
          (i64.const 7)
         )
        )
        (i64.const 0)
       )
      )
      (i32.const 7)
     )
     (i32.and
      (get_local $2)
      (i32.const 127)
     )
    )
   )
   (call $eosio_assert
    (i32.gt_s
     (i32.sub
      (i32.load
       (get_local $4)
      )
      (get_local $6)
     )
     (i32.const 0)
    )
    (i32.const 800)
   )
   (drop
    (call $memcpy
     (i32.load
      (get_local $5)
     )
     (i32.add
      (get_local $8)
      (i32.const 15)
     )
     (i32.const 1)
    )
   )
   (i32.store
    (get_local $5)
    (tee_local $6
     (i32.add
      (i32.load
       (get_local $5)
      )
      (i32.const 1)
     )
    )
   )
   (br_if $label$0
    (get_local $3)
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (tee_local $5
      (select
       (i32.load
        (i32.add
         (get_local $1)
         (i32.const 4)
        )
       )
       (i32.shr_u
        (tee_local $5
         (i32.load8_u
          (get_local $1)
         )
        )
        (i32.const 1)
       )
       (tee_local $2
        (i32.and
         (get_local $5)
         (i32.const 1)
        )
       )
      )
     )
    )
   )
   (set_local $3
    (i32.load offset=8
     (get_local $1)
    )
   )
   (call $eosio_assert
    (i32.ge_s
     (i32.sub
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 8)
       )
      )
      (get_local $6)
     )
     (get_local $5)
    )
    (i32.const 800)
   )
   (drop
    (call $memcpy
     (i32.load
      (tee_local $6
       (i32.add
        (get_local $0)
        (i32.const 4)
       )
      )
     )
     (select
      (get_local $3)
      (i32.add
       (get_local $1)
       (i32.const 1)
      )
      (get_local $2)
     )
     (get_local $5)
    )
   )
   (i32.store
    (get_local $6)
    (i32.add
     (i32.load
      (get_local $6)
     )
     (get_local $5)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 16)
   )
  )
  (get_local $0)
 )
 (func $_ZNK5eosio5asset5printEv (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i32)
  (set_local $10
   (tee_local $2
    (i32.load offset=4
     (i32.const 0)
    )
   )
  )
  (set_local $7
   (i64.const 1)
  )
  (block $label$0
   (br_if $label$0
    (tee_local $5
     (i64.eqz
      (tee_local $8
       (i64.load8_u offset=8
        (get_local $0)
       )
      )
     )
    )
   )
   (set_local $9
    (i64.add
     (get_local $8)
     (i64.const 1)
    )
   )
   (set_local $7
    (i64.const 1)
   )
   (loop $label$1
    (set_local $7
     (i64.mul
      (get_local $7)
      (i64.const 10)
     )
    )
    (br_if $label$1
     (i64.gt_s
      (tee_local $9
       (i64.add
        (get_local $9)
        (i64.const -1)
       )
      )
      (i64.const 1)
     )
    )
   )
  )
  (set_local $1
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (tee_local $2
    (i32.sub
     (get_local $2)
     (i32.and
      (i32.add
       (i32.wrap/i64
        (i64.add
         (get_local $8)
         (i64.const 1)
        )
       )
       (i32.const 15)
      )
      (i32.const 1008)
     )
    )
   )
  )
  (i32.store8
   (tee_local $6
    (i32.add
     (get_local $2)
     (tee_local $3
      (i32.wrap/i64
       (get_local $8)
      )
     )
    )
   )
   (i32.const 0)
  )
  (set_local $4
   (i64.load
    (get_local $0)
   )
  )
  (block $label$2
   (br_if $label$2
    (get_local $5)
   )
   (set_local $8
    (i64.add
     (get_local $8)
     (i64.const 1)
    )
   )
   (set_local $9
    (i64.rem_s
     (get_local $4)
     (get_local $7)
    )
   )
   (set_local $0
    (i32.add
     (get_local $6)
     (i32.const -1)
    )
   )
   (loop $label$3
    (i64.store8
     (get_local $0)
     (i64.add
      (i64.rem_s
       (get_local $9)
       (i64.const 10)
      )
      (i64.const 48)
     )
    )
    (set_local $0
     (i32.add
      (get_local $0)
      (i32.const -1)
     )
    )
    (set_local $9
     (i64.div_s
      (get_local $9)
      (i64.const 10)
     )
    )
    (br_if $label$3
     (i64.gt_s
      (tee_local $8
       (i64.add
        (get_local $8)
        (i64.const -1)
       )
      )
      (i64.const 1)
     )
    )
   )
  )
  (call $printi
   (i64.div_s
    (get_local $4)
    (get_local $7)
   )
  )
  (call $prints
   (i32.const 976)
  )
  (call $prints_l
   (get_local $2)
   (get_local $3)
  )
  (call $prints
   (i32.const 992)
  )
  (call $_ZNK5eosio11symbol_type5printEb
   (get_local $1)
   (i32.const 0)
  )
  (i32.store offset=4
   (i32.const 0)
   (get_local $10)
  )
 )
 (func $_ZNK5eosio11symbol_type5printEb (param $0 i32) (param $1 i32)
  (local $2 i64)
  (local $3 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $3
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (get_local $1)
    )
   )
   (call $printui
    (i64.load8_u
     (get_local $0)
    )
   )
   (call $prints
    (i32.const 1008)
   )
  )
  (i32.store8 offset=15
   (get_local $3)
   (tee_local $0
    (i32.wrap/i64
     (i64.shr_u
      (tee_local $2
       (i64.load
        (get_local $0)
       )
      )
      (i64.const 8)
     )
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (i32.and
      (get_local $0)
      (i32.const 255)
     )
    )
   )
   (call $prints_l
    (i32.add
     (get_local $3)
     (i32.const 15)
    )
    (i32.const 1)
   )
   (i32.store8 offset=15
    (get_local $3)
    (tee_local $0
     (i32.wrap/i64
      (i64.shr_u
       (get_local $2)
       (i64.const 16)
      )
     )
    )
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (get_local $0)
      (i32.const 255)
     )
    )
   )
   (call $prints_l
    (i32.add
     (get_local $3)
     (i32.const 15)
    )
    (i32.const 1)
   )
   (i32.store8 offset=15
    (get_local $3)
    (tee_local $0
     (i32.wrap/i64
      (i64.shr_u
       (get_local $2)
       (i64.const 24)
      )
     )
    )
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (get_local $0)
      (i32.const 255)
     )
    )
   )
   (call $prints_l
    (i32.add
     (get_local $3)
     (i32.const 15)
    )
    (i32.const 1)
   )
   (i32.store8 offset=15
    (get_local $3)
    (tee_local $0
     (i32.wrap/i64
      (i64.shr_u
       (get_local $2)
       (i64.const 32)
      )
     )
    )
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (get_local $0)
      (i32.const 255)
     )
    )
   )
   (call $prints_l
    (i32.add
     (get_local $3)
     (i32.const 15)
    )
    (i32.const 1)
   )
   (i32.store8 offset=15
    (get_local $3)
    (tee_local $0
     (i32.wrap/i64
      (i64.shr_u
       (get_local $2)
       (i64.const 40)
      )
     )
    )
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (get_local $0)
      (i32.const 255)
     )
    )
   )
   (call $prints_l
    (i32.add
     (get_local $3)
     (i32.const 15)
    )
    (i32.const 1)
   )
   (i32.store8 offset=15
    (get_local $3)
    (tee_local $0
     (i32.wrap/i64
      (i64.shr_u
       (get_local $2)
       (i64.const 48)
      )
     )
    )
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (get_local $0)
      (i32.const 255)
     )
    )
   )
   (call $prints_l
    (i32.add
     (get_local $3)
     (i32.const 15)
    )
    (i32.const 1)
   )
   (i32.store8 offset=15
    (get_local $3)
    (tee_local $0
     (i32.wrap/i64
      (i64.shr_u
       (get_local $2)
       (i64.const 56)
      )
     )
    )
   )
   (br_if $label$1
    (i32.eqz
     (get_local $0)
    )
   )
   (call $prints_l
    (i32.add
     (get_local $3)
     (i32.const 15)
    )
    (i32.const 1)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $3)
    (i32.const 16)
   )
  )
 )
 (func $_ZNSt3__15dequeIN8exchange11ramexchange5OfferENS_9allocatorIS3_EEE8__appendINS_16__deque_iteratorIS3_PKS3_RS9_PKSA_iLi102EEEEEvT_SF_PNS_9enable_ifIXsr21__is_forward_iteratorISF_EE5valueEvE4typeE (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (set_local $9
   (i32.wrap/i64
    (tee_local $7
     (i64.load align=4
      (get_local $1)
     )
    )
   )
  )
  (set_local $11
   (i32.const 0)
  )
  (block $label$0
   (br_if $label$0
    (i32.eq
     (tee_local $10
      (i32.wrap/i64
       (i64.shr_u
        (tee_local $8
         (i64.load align=4
          (get_local $2)
         )
        )
        (i64.const 32)
       )
      )
     )
     (tee_local $12
      (i32.wrap/i64
       (i64.shr_u
        (get_local $7)
        (i64.const 32)
       )
      )
     )
    )
   )
   (set_local $11
    (i32.add
     (i32.add
      (i32.div_s
       (i32.sub
        (get_local $10)
        (i32.load
         (tee_local $11
          (i32.wrap/i64
           (get_local $8)
          )
         )
        )
       )
       (i32.const 40)
      )
      (i32.mul
       (i32.shr_s
        (i32.sub
         (get_local $11)
         (get_local $9)
        )
        (i32.const 2)
       )
       (i32.const 102)
      )
     )
     (i32.div_s
      (i32.sub
       (get_local $12)
       (i32.load
        (get_local $9)
       )
      )
      (i32.const -40)
     )
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.le_u
     (get_local $11)
     (tee_local $4
      (i32.sub
       (select
        (i32.add
         (i32.mul
          (tee_local $5
           (i32.shr_s
            (i32.sub
             (tee_local $12
              (i32.load offset=8
               (get_local $0)
              )
             )
             (tee_local $10
              (i32.load offset=4
               (get_local $0)
              )
             )
            )
            (i32.const 2)
           )
          )
          (i32.const 102)
         )
         (i32.const -1)
        )
        (i32.const 0)
        (get_local $5)
       )
       (i32.add
        (tee_local $5
         (i32.load offset=20
          (get_local $0)
         )
        )
        (tee_local $6
         (i32.load offset=16
          (get_local $0)
         )
        )
       )
      )
     )
    )
   )
   (call $_ZNSt3__15dequeIN8exchange11ramexchange5OfferENS_9allocatorIS3_EEE19__add_back_capacityEj
    (get_local $0)
    (i32.sub
     (get_local $11)
     (get_local $4)
    )
   )
   (set_local $12
    (i32.load
     (i32.add
      (get_local $0)
      (i32.const 8)
     )
    )
   )
   (set_local $10
    (i32.load
     (i32.add
      (get_local $0)
      (i32.const 4)
     )
    )
   )
   (set_local $6
    (i32.load
     (i32.add
      (get_local $0)
      (i32.const 16)
     )
    )
   )
   (set_local $5
    (i32.load
     (i32.add
      (get_local $0)
      (i32.const 20)
     )
    )
   )
  )
  (set_local $11
   (i32.add
    (get_local $10)
    (i32.shl
     (i32.div_u
      (tee_local $5
       (i32.add
        (get_local $6)
        (get_local $5)
       )
      )
      (i32.const 102)
     )
     (i32.const 2)
    )
   )
  )
  (block $label$2
   (block $label$3
    (br_if $label$3
     (i32.eq
      (get_local $12)
      (get_local $10)
     )
    )
    (set_local $12
     (i32.add
      (i32.load
       (get_local $11)
      )
      (i32.mul
       (i32.rem_u
        (get_local $5)
        (i32.const 102)
       )
       (i32.const 40)
      )
     )
    )
    (br $label$2)
   )
   (set_local $12
    (i32.const 0)
   )
  )
  (block $label$4
   (br_if $label$4
    (i32.eq
     (tee_local $10
      (i32.load offset=4
       (get_local $1)
      )
     )
     (tee_local $5
      (i32.load offset=4
       (get_local $2)
      )
     )
    )
   )
   (set_local $0
    (i32.add
     (get_local $0)
     (i32.const 20)
    )
   )
   (loop $label$5
    (block $label$6
     (br_if $label$6
      (i32.ne
       (i32.sub
        (tee_local $12
         (i32.add
          (call $memcpy
           (get_local $12)
           (get_local $10)
           (i32.const 40)
          )
          (i32.const 40)
         )
        )
        (i32.load
         (get_local $11)
        )
       )
       (i32.const 4080)
      )
     )
     (set_local $12
      (i32.load offset=4
       (get_local $11)
      )
     )
     (set_local $11
      (i32.add
       (get_local $11)
       (i32.const 4)
      )
     )
    )
    (i32.store
     (tee_local $2
      (i32.add
       (get_local $1)
       (i32.const 4)
      )
     )
     (tee_local $10
      (i32.add
       (get_local $10)
       (i32.const 40)
      )
     )
    )
    (block $label$7
     (br_if $label$7
      (i32.ne
       (i32.sub
        (get_local $10)
        (i32.load
         (get_local $9)
        )
       )
       (i32.const 4080)
      )
     )
     (i32.store
      (get_local $1)
      (tee_local $6
       (i32.add
        (get_local $9)
        (i32.const 4)
       )
      )
     )
     (i32.store
      (get_local $2)
      (tee_local $10
       (i32.load offset=4
        (get_local $9)
       )
      )
     )
     (set_local $9
      (get_local $6)
     )
    )
    (i32.store
     (get_local $0)
     (i32.add
      (i32.load
       (get_local $0)
      )
      (i32.const 1)
     )
    )
    (br_if $label$5
     (i32.ne
      (get_local $10)
      (get_local $5)
     )
    )
   )
  )
 )
 (func $_ZNSt3__15dequeIN8exchange11ramexchange5OfferENS_9allocatorIS3_EEE19__add_back_capacityEj (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $13
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 32)
    )
   )
  )
  (block $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (block $label$6
         (block $label$7
          (br_if $label$7
           (i32.eqz
            (tee_local $3
             (i32.sub
              (tee_local $9
               (i32.add
                (tee_local $12
                 (i32.ne
                  (i32.rem_u
                   (tee_local $1
                    (i32.add
                     (i32.eq
                      (tee_local $11
                       (i32.load offset=8
                        (get_local $0)
                       )
                      )
                      (tee_local $10
                       (i32.load offset=4
                        (get_local $0)
                       )
                      )
                     )
                     (get_local $1)
                    )
                   )
                   (i32.const 102)
                  )
                  (i32.const 0)
                 )
                )
                (tee_local $7
                 (i32.div_u
                  (get_local $1)
                  (i32.const 102)
                 )
                )
               )
              )
              (tee_local $1
               (select
                (get_local $9)
                (tee_local $8
                 (i32.div_u
                  (tee_local $2
                   (i32.load offset=16
                    (get_local $0)
                   )
                  )
                  (i32.const 102)
                 )
                )
                (i32.lt_u
                 (get_local $9)
                 (get_local $8)
                )
               )
              )
             )
            )
           )
          )
          (br_if $label$6
           (i32.le_u
            (get_local $3)
            (i32.sub
             (i32.shr_s
              (tee_local $4
               (i32.sub
                (tee_local $2
                 (i32.load offset=12
                  (get_local $0)
                 )
                )
                (i32.load
                 (get_local $0)
                )
               )
              )
              (i32.const 2)
             )
             (tee_local $10
              (i32.shr_s
               (i32.sub
                (get_local $11)
                (get_local $10)
               )
               (i32.const 2)
              )
             )
            )
           )
          )
          (i32.store
           (i32.add
            (get_local $13)
            (i32.const 24)
           )
           (i32.add
            (get_local $0)
            (i32.const 12)
           )
          )
          (set_local $11
           (i32.const 0)
          )
          (i32.store offset=20
           (get_local $13)
           (i32.const 0)
          )
          (block $label$8
           (br_if $label$8
            (i32.eqz
             (tee_local $3
              (select
               (tee_local $3
                (i32.add
                 (get_local $10)
                 (get_local $3)
                )
               )
               (tee_local $2
                (i32.shr_s
                 (get_local $4)
                 (i32.const 1)
                )
               )
               (i32.lt_u
                (get_local $2)
                (get_local $3)
               )
              )
             )
            )
           )
           (br_if $label$0
            (i32.ge_u
             (get_local $3)
             (i32.const 1073741824)
            )
           )
           (set_local $11
            (call $_Znwj
             (i32.shl
              (get_local $3)
              (i32.const 2)
             )
            )
           )
          )
          (i32.store offset=8
           (get_local $13)
           (get_local $11)
          )
          (i32.store
           (i32.add
            (i32.add
             (get_local $13)
             (i32.const 8)
            )
            (i32.const 12)
           )
           (i32.add
            (get_local $11)
            (i32.shl
             (get_local $3)
             (i32.const 2)
            )
           )
          )
          (i32.store offset=16
           (get_local $13)
           (tee_local $11
            (i32.add
             (get_local $11)
             (i32.shl
              (i32.sub
               (get_local $10)
               (get_local $1)
              )
              (i32.const 2)
             )
            )
           )
          )
          (i32.store offset=12
           (get_local $13)
           (get_local $11)
          )
          (set_local $11
           (i32.sub
            (i32.sub
             (i32.xor
              (select
               (tee_local $11
                (i32.xor
                 (get_local $8)
                 (i32.const -1)
                )
               )
               (tee_local $10
                (i32.xor
                 (get_local $9)
                 (i32.const -1)
                )
               )
               (i32.gt_u
                (get_local $11)
                (get_local $10)
               )
              )
              (i32.const -1)
             )
             (get_local $7)
            )
            (get_local $12)
           )
          )
          (loop $label$9
           (i32.store offset=4
            (get_local $13)
            (call $_Znwj
             (i32.const 4080)
            )
           )
           (call $_ZNSt3__114__split_bufferIPN8exchange11ramexchange5OfferERNS_9allocatorIS4_EEE9push_backEOS4_
            (i32.add
             (get_local $13)
             (i32.const 8)
            )
            (i32.add
             (get_local $13)
             (i32.const 4)
            )
           )
           (br_if $label$9
            (tee_local $11
             (i32.add
              (get_local $11)
              (i32.const 1)
             )
            )
           )
          )
          (br_if $label$5
           (i32.eqz
            (get_local $1)
           )
          )
          (set_local $9
           (i32.load
            (tee_local $2
             (i32.add
              (get_local $0)
              (i32.const 4)
             )
            )
           )
          )
          (set_local $11
           (i32.load
            (tee_local $8
             (i32.add
              (get_local $13)
              (i32.const 16)
             )
            )
           )
          )
          (set_local $7
           (i32.add
            (get_local $13)
            (i32.const 20)
           )
          )
          (set_local $12
           (get_local $1)
          )
          (loop $label$10
           (block $label$11
            (br_if $label$11
             (i32.ne
              (get_local $11)
              (tee_local $3
               (i32.load
                (get_local $7)
               )
              )
             )
            )
            (block $label$12
             (br_if $label$12
              (i32.le_u
               (tee_local $10
                (i32.load offset=12
                 (get_local $13)
                )
               )
               (tee_local $4
                (i32.load offset=8
                 (get_local $13)
                )
               )
              )
             )
             (set_local $3
              (i32.add
               (get_local $10)
               (tee_local $4
                (i32.shl
                 (i32.div_s
                  (i32.add
                   (i32.shr_s
                    (i32.sub
                     (get_local $10)
                     (get_local $4)
                    )
                    (i32.const 2)
                   )
                   (i32.const 1)
                  )
                  (i32.const -2)
                 )
                 (i32.const 2)
                )
               )
              )
             )
             (block $label$13
              (br_if $label$13
               (i32.eqz
                (tee_local $11
                 (i32.shr_s
                  (tee_local $6
                   (i32.sub
                    (get_local $11)
                    (get_local $10)
                   )
                  )
                  (i32.const 2)
                 )
                )
               )
              )
              (drop
               (call $memmove
                (get_local $3)
                (get_local $10)
                (get_local $6)
               )
              )
              (set_local $10
               (i32.load offset=12
                (get_local $13)
               )
              )
             )
             (i32.store
              (get_local $8)
              (tee_local $11
               (i32.add
                (get_local $3)
                (i32.shl
                 (get_local $11)
                 (i32.const 2)
                )
               )
              )
             )
             (i32.store offset=12
              (get_local $13)
              (i32.add
               (get_local $10)
               (get_local $4)
              )
             )
             (br $label$11)
            )
            (br_if $label$0
             (i32.ge_u
              (tee_local $11
               (select
                (tee_local $11
                 (i32.shr_s
                  (i32.sub
                   (get_local $3)
                   (get_local $4)
                  )
                  (i32.const 1)
                 )
                )
                (i32.const 1)
                (get_local $11)
               )
              )
              (i32.const 1073741824)
             )
            )
            (set_local $5
             (i32.add
              (tee_local $4
               (call $_Znwj
                (tee_local $10
                 (i32.shl
                  (get_local $11)
                  (i32.const 2)
                 )
                )
               )
              )
              (get_local $10)
             )
            )
            (set_local $11
             (tee_local $6
              (i32.add
               (get_local $4)
               (i32.and
                (get_local $11)
                (i32.const -4)
               )
              )
             )
            )
            (block $label$14
             (br_if $label$14
              (i32.eq
               (tee_local $10
                (i32.load offset=12
                 (get_local $13)
                )
               )
               (tee_local $3
                (i32.load
                 (get_local $8)
                )
               )
              )
             )
             (set_local $11
              (get_local $6)
             )
             (loop $label$15
              (i32.store
               (get_local $11)
               (i32.load
                (get_local $10)
               )
              )
              (set_local $11
               (i32.add
                (get_local $11)
                (i32.const 4)
               )
              )
              (br_if $label$15
               (i32.ne
                (get_local $3)
                (tee_local $10
                 (i32.add
                  (get_local $10)
                  (i32.const 4)
                 )
                )
               )
              )
             )
            )
            (i32.store
             (get_local $8)
             (get_local $11)
            )
            (i32.store
             (get_local $7)
             (get_local $5)
            )
            (i32.store offset=12
             (get_local $13)
             (get_local $6)
            )
            (set_local $10
             (i32.load offset=8
              (get_local $13)
             )
            )
            (i32.store offset=8
             (get_local $13)
             (get_local $4)
            )
            (br_if $label$11
             (i32.eqz
              (get_local $10)
             )
            )
            (call $_ZdlPv
             (get_local $10)
            )
            (set_local $11
             (i32.load
              (get_local $8)
             )
            )
           )
           (i32.store
            (get_local $11)
            (i32.load
             (get_local $9)
            )
           )
           (i32.store
            (get_local $8)
            (tee_local $11
             (i32.add
              (i32.load
               (get_local $8)
              )
              (i32.const 4)
             )
            )
           )
           (i32.store
            (get_local $2)
            (tee_local $9
             (i32.add
              (i32.load
               (get_local $2)
              )
              (i32.const 4)
             )
            )
           )
           (br_if $label$10
            (tee_local $12
             (i32.add
              (get_local $12)
              (i32.const -1)
             )
            )
           )
           (br $label$4)
          )
         )
         (i32.store
          (i32.add
           (get_local $0)
           (i32.const 16)
          )
          (i32.add
           (i32.mul
            (get_local $1)
            (i32.const -102)
           )
           (get_local $2)
          )
         )
         (br_if $label$1
          (i32.eqz
           (get_local $1)
          )
         )
         (set_local $12
          (i32.add
           (get_local $0)
           (i32.const 12)
          )
         )
         (set_local $9
          (i32.add
           (get_local $0)
           (i32.const 8)
          )
         )
         (loop $label$16
          (set_local $2
           (i32.load
            (get_local $10)
           )
          )
          (i32.store
           (tee_local $8
            (i32.add
             (get_local $0)
             (i32.const 4)
            )
           )
           (tee_local $10
            (i32.add
             (get_local $10)
             (i32.const 4)
            )
           )
          )
          (block $label$17
           (br_if $label$17
            (i32.ne
             (get_local $11)
             (tee_local $3
              (i32.load
               (get_local $12)
              )
             )
            )
           )
           (block $label$18
            (br_if $label$18
             (i32.le_u
              (get_local $10)
              (tee_local $7
               (i32.load
                (get_local $0)
               )
              )
             )
            )
            (set_local $3
             (i32.add
              (get_local $10)
              (tee_local $7
               (i32.shl
                (i32.div_s
                 (i32.add
                  (i32.shr_s
                   (i32.sub
                    (get_local $10)
                    (get_local $7)
                   )
                   (i32.const 2)
                  )
                  (i32.const 1)
                 )
                 (i32.const -2)
                )
                (i32.const 2)
               )
              )
             )
            )
            (block $label$19
             (br_if $label$19
              (i32.eqz
               (tee_local $11
                (i32.shr_s
                 (tee_local $4
                  (i32.sub
                   (get_local $11)
                   (get_local $10)
                  )
                 )
                 (i32.const 2)
                )
               )
              )
             )
             (drop
              (call $memmove
               (get_local $3)
               (get_local $10)
               (get_local $4)
              )
             )
             (set_local $10
              (i32.load
               (get_local $8)
              )
             )
            )
            (i32.store
             (get_local $8)
             (i32.add
              (get_local $10)
              (get_local $7)
             )
            )
            (i32.store
             (get_local $9)
             (tee_local $11
              (i32.add
               (get_local $3)
               (i32.shl
                (get_local $11)
                (i32.const 2)
               )
              )
             )
            )
            (br $label$17)
           )
           (br_if $label$0
            (i32.ge_u
             (tee_local $11
              (select
               (tee_local $11
                (i32.shr_s
                 (i32.sub
                  (get_local $3)
                  (get_local $7)
                 )
                 (i32.const 1)
                )
               )
               (i32.const 1)
               (get_local $11)
              )
             )
             (i32.const 1073741824)
            )
           )
           (set_local $6
            (i32.add
             (tee_local $7
              (call $_Znwj
               (tee_local $10
                (i32.shl
                 (get_local $11)
                 (i32.const 2)
                )
               )
              )
             )
             (get_local $10)
            )
           )
           (set_local $11
            (tee_local $4
             (i32.add
              (get_local $7)
              (i32.and
               (get_local $11)
               (i32.const -4)
              )
             )
            )
           )
           (block $label$20
            (br_if $label$20
             (i32.eq
              (tee_local $10
               (i32.load
                (get_local $8)
               )
              )
              (tee_local $3
               (i32.load
                (get_local $9)
               )
              )
             )
            )
            (set_local $11
             (get_local $4)
            )
            (loop $label$21
             (i32.store
              (get_local $11)
              (i32.load
               (get_local $10)
              )
             )
             (set_local $11
              (i32.add
               (get_local $11)
               (i32.const 4)
              )
             )
             (br_if $label$21
              (i32.ne
               (get_local $3)
               (tee_local $10
                (i32.add
                 (get_local $10)
                 (i32.const 4)
                )
               )
              )
             )
            )
           )
           (i32.store
            (get_local $8)
            (get_local $4)
           )
           (set_local $10
            (i32.load
             (get_local $0)
            )
           )
           (i32.store
            (get_local $0)
            (get_local $7)
           )
           (i32.store
            (get_local $9)
            (get_local $11)
           )
           (i32.store
            (get_local $12)
            (get_local $6)
           )
           (br_if $label$17
            (i32.eqz
             (get_local $10)
            )
           )
           (call $_ZdlPv
            (get_local $10)
           )
           (set_local $11
            (i32.load
             (get_local $9)
            )
           )
          )
          (i32.store
           (get_local $11)
           (get_local $2)
          )
          (i32.store
           (get_local $9)
           (tee_local $11
            (i32.add
             (i32.load
              (get_local $9)
             )
             (i32.const 4)
            )
           )
          )
          (br_if $label$1
           (i32.eqz
            (tee_local $1
             (i32.add
              (get_local $1)
              (i32.const -1)
             )
            )
           )
          )
          (set_local $10
           (i32.load
            (get_local $8)
           )
          )
          (br $label$16)
         )
        )
        (block $label$22
         (br_if $label$22
          (i32.eq
           (get_local $2)
           (get_local $11)
          )
         )
         (set_local $11
          (i32.add
           (get_local $0)
           (i32.const 8)
          )
         )
         (set_local $10
          (i32.add
           (get_local $0)
           (i32.const 12)
          )
         )
         (loop $label$23
          (i32.store offset=8
           (get_local $13)
           (call $_Znwj
            (i32.const 4080)
           )
          )
          (call $_ZNSt3__114__split_bufferIPN8exchange11ramexchange5OfferENS_9allocatorIS4_EEE9push_backEOS4_
           (get_local $0)
           (i32.add
            (get_local $13)
            (i32.const 8)
           )
          )
          (br_if $label$3
           (i32.eq
            (get_local $3)
            (i32.const 1)
           )
          )
          (set_local $3
           (i32.add
            (get_local $3)
            (i32.const -1)
           )
          )
          (br_if $label$23
           (i32.ne
            (i32.load
             (get_local $10)
            )
            (i32.load
             (get_local $11)
            )
           )
          )
         )
        )
        (set_local $8
         (i32.xor
          (select
           (get_local $8)
           (get_local $9)
           (i32.gt_u
            (get_local $9)
            (get_local $8)
           )
          )
          (i32.const -1)
         )
        )
        (set_local $1
         (i32.add
          (get_local $0)
          (i32.const 8)
         )
        )
        (set_local $11
         (i32.add
          (get_local $0)
          (i32.const 16)
         )
        )
        (set_local $10
         (get_local $3)
        )
        (loop $label$24
         (i32.store offset=8
          (get_local $13)
          (call $_Znwj
           (i32.const 4080)
          )
         )
         (call $_ZNSt3__114__split_bufferIPN8exchange11ramexchange5OfferENS_9allocatorIS4_EEE10push_frontEOS4_
          (get_local $0)
          (i32.add
           (get_local $13)
           (i32.const 8)
          )
         )
         (i32.store
          (get_local $11)
          (tee_local $9
           (i32.add
            (i32.add
             (i32.load
              (get_local $11)
             )
             (select
              (i32.const -1)
              (i32.const 0)
              (i32.eq
               (i32.sub
                (i32.load
                 (get_local $1)
                )
                (i32.load
                 (i32.add
                  (get_local $0)
                  (i32.const 4)
                 )
                )
               )
               (i32.const 4)
              )
             )
            )
            (i32.const 102)
           )
          )
         )
         (br_if $label$24
          (tee_local $10
           (i32.add
            (get_local $10)
            (i32.const -1)
           )
          )
         )
        )
        (set_local $1
         (i32.sub
          (i32.add
           (get_local $3)
           (i32.const -1)
          )
          (get_local $8)
         )
        )
        (br $label$2)
       )
       (set_local $9
        (i32.load
         (i32.add
          (get_local $0)
          (i32.const 4)
         )
        )
       )
      )
      (block $label$25
       (br_if $label$25
        (i32.eq
         (tee_local $11
          (i32.load
           (tee_local $3
            (i32.add
             (get_local $0)
             (i32.const 8)
            )
           )
          )
         )
         (get_local $9)
        )
       )
       (set_local $10
        (i32.add
         (get_local $0)
         (i32.const 4)
        )
       )
       (loop $label$26
        (call $_ZNSt3__114__split_bufferIPN8exchange11ramexchange5OfferERNS_9allocatorIS4_EEE10push_frontERKS4_
         (i32.add
          (get_local $13)
          (i32.const 8)
         )
         (tee_local $11
          (i32.add
           (get_local $11)
           (i32.const -4)
          )
         )
        )
        (br_if $label$26
         (i32.ne
          (get_local $11)
          (tee_local $9
           (i32.load
            (get_local $10)
           )
          )
         )
        )
       )
       (set_local $11
        (i32.load
         (i32.add
          (get_local $0)
          (i32.const 8)
         )
        )
       )
      )
      (set_local $10
       (i32.load
        (get_local $0)
       )
      )
      (i32.store
       (get_local $0)
       (i32.load offset=8
        (get_local $13)
       )
      )
      (i32.store
       (i32.add
        (get_local $0)
        (i32.const 4)
       )
       (i32.load offset=12
        (get_local $13)
       )
      )
      (i32.store offset=8
       (get_local $13)
       (get_local $10)
      )
      (i32.store offset=12
       (get_local $13)
       (get_local $9)
      )
      (set_local $2
       (i32.load
        (tee_local $8
         (i32.add
          (i32.add
           (get_local $13)
           (i32.const 8)
          )
          (i32.const 8)
         )
        )
       )
      )
      (i32.store
       (get_local $8)
       (get_local $11)
      )
      (i32.store
       (get_local $3)
       (get_local $2)
      )
      (set_local $8
       (i32.load
        (tee_local $3
         (i32.add
          (get_local $0)
          (i32.const 12)
         )
        )
       )
      )
      (i32.store
       (get_local $3)
       (i32.load
        (tee_local $2
         (i32.add
          (i32.add
           (get_local $13)
           (i32.const 8)
          )
          (i32.const 12)
         )
        )
       )
      )
      (i32.store
       (get_local $2)
       (get_local $8)
      )
      (i32.store
       (tee_local $0
        (i32.add
         (get_local $0)
         (i32.const 16)
        )
       )
       (i32.add
        (i32.load
         (get_local $0)
        )
        (i32.mul
         (get_local $1)
         (i32.const -102)
        )
       )
      )
      (block $label$27
       (br_if $label$27
        (i32.eq
         (get_local $11)
         (get_local $9)
        )
       )
       (i32.store
        (i32.add
         (get_local $13)
         (i32.const 16)
        )
        (i32.add
         (get_local $11)
         (i32.and
          (i32.xor
           (i32.sub
            (i32.add
             (get_local $11)
             (i32.const -4)
            )
            (get_local $9)
           )
           (i32.const -1)
          )
          (i32.const -4)
         )
        )
       )
      )
      (br_if $label$1
       (i32.eqz
        (get_local $10)
       )
      )
      (call $_ZdlPv
       (get_local $10)
      )
      (br $label$1)
     )
     (set_local $9
      (i32.load
       (i32.add
        (get_local $0)
        (i32.const 16)
       )
      )
     )
    )
    (i32.store
     (i32.add
      (get_local $0)
      (i32.const 16)
     )
     (i32.add
      (get_local $9)
      (i32.mul
       (get_local $1)
       (i32.const -102)
      )
     )
    )
    (br_if $label$1
     (i32.eqz
      (get_local $1)
     )
    )
    (set_local $11
     (i32.load
      (tee_local $9
       (i32.add
        (get_local $0)
        (i32.const 8)
       )
      )
     )
    )
    (set_local $12
     (i32.add
      (get_local $0)
      (i32.const 12)
     )
    )
    (loop $label$28
     (set_local $2
      (i32.load
       (tee_local $10
        (i32.load
         (tee_local $8
          (i32.add
           (get_local $0)
           (i32.const 4)
          )
         )
        )
       )
      )
     )
     (i32.store
      (get_local $8)
      (tee_local $10
       (i32.add
        (get_local $10)
        (i32.const 4)
       )
      )
     )
     (block $label$29
      (br_if $label$29
       (i32.ne
        (get_local $11)
        (tee_local $3
         (i32.load
          (get_local $12)
         )
        )
       )
      )
      (block $label$30
       (br_if $label$30
        (i32.le_u
         (get_local $10)
         (tee_local $7
          (i32.load
           (get_local $0)
          )
         )
        )
       )
       (set_local $3
        (i32.add
         (get_local $10)
         (tee_local $7
          (i32.shl
           (i32.div_s
            (i32.add
             (i32.shr_s
              (i32.sub
               (get_local $10)
               (get_local $7)
              )
              (i32.const 2)
             )
             (i32.const 1)
            )
            (i32.const -2)
           )
           (i32.const 2)
          )
         )
        )
       )
       (block $label$31
        (br_if $label$31
         (i32.eqz
          (tee_local $11
           (i32.shr_s
            (tee_local $4
             (i32.sub
              (get_local $11)
              (get_local $10)
             )
            )
            (i32.const 2)
           )
          )
         )
        )
        (drop
         (call $memmove
          (get_local $3)
          (get_local $10)
          (get_local $4)
         )
        )
        (set_local $10
         (i32.load
          (get_local $8)
         )
        )
       )
       (i32.store
        (get_local $8)
        (i32.add
         (get_local $10)
         (get_local $7)
        )
       )
       (i32.store
        (get_local $9)
        (tee_local $11
         (i32.add
          (get_local $3)
          (i32.shl
           (get_local $11)
           (i32.const 2)
          )
         )
        )
       )
       (br $label$29)
      )
      (br_if $label$0
       (i32.ge_u
        (tee_local $11
         (select
          (tee_local $11
           (i32.shr_s
            (i32.sub
             (get_local $3)
             (get_local $7)
            )
            (i32.const 1)
           )
          )
          (i32.const 1)
          (get_local $11)
         )
        )
        (i32.const 1073741824)
       )
      )
      (set_local $6
       (i32.add
        (tee_local $7
         (call $_Znwj
          (tee_local $10
           (i32.shl
            (get_local $11)
            (i32.const 2)
           )
          )
         )
        )
        (get_local $10)
       )
      )
      (set_local $11
       (tee_local $4
        (i32.add
         (get_local $7)
         (i32.and
          (get_local $11)
          (i32.const -4)
         )
        )
       )
      )
      (block $label$32
       (br_if $label$32
        (i32.eq
         (tee_local $10
          (i32.load
           (get_local $8)
          )
         )
         (tee_local $3
          (i32.load
           (get_local $9)
          )
         )
        )
       )
       (set_local $11
        (get_local $4)
       )
       (loop $label$33
        (i32.store
         (get_local $11)
         (i32.load
          (get_local $10)
         )
        )
        (set_local $11
         (i32.add
          (get_local $11)
          (i32.const 4)
         )
        )
        (br_if $label$33
         (i32.ne
          (get_local $3)
          (tee_local $10
           (i32.add
            (get_local $10)
            (i32.const 4)
           )
          )
         )
        )
       )
      )
      (i32.store
       (get_local $8)
       (get_local $4)
      )
      (set_local $10
       (i32.load
        (get_local $0)
       )
      )
      (i32.store
       (get_local $0)
       (get_local $7)
      )
      (i32.store
       (get_local $9)
       (get_local $11)
      )
      (i32.store
       (get_local $12)
       (get_local $6)
      )
      (br_if $label$29
       (i32.eqz
        (get_local $10)
       )
      )
      (call $_ZdlPv
       (get_local $10)
      )
      (set_local $11
       (i32.load
        (get_local $9)
       )
      )
     )
     (i32.store
      (get_local $11)
      (get_local $2)
     )
     (i32.store
      (get_local $9)
      (tee_local $11
       (i32.add
        (i32.load
         (get_local $9)
        )
        (i32.const 4)
       )
      )
     )
     (br_if $label$28
      (tee_local $1
       (i32.add
        (get_local $1)
        (i32.const -1)
       )
      )
     )
    )
   )
   (i32.store offset=4
    (i32.const 0)
    (i32.add
     (get_local $13)
     (i32.const 32)
    )
   )
   (return)
  )
  (call $abort)
  (unreachable)
 )
 (func $_ZNSt3__114__split_bufferIPN8exchange11ramexchange5OfferENS_9allocatorIS4_EEE9push_backEOS4_ (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.ne
      (tee_local $9
       (i32.load offset=8
        (get_local $0)
       )
      )
      (tee_local $4
       (i32.load offset=12
        (get_local $0)
       )
      )
     )
    )
    (block $label$2
     (br_if $label$2
      (i32.le_u
       (tee_local $8
        (i32.load offset=4
         (get_local $0)
        )
       )
       (tee_local $2
        (i32.load
         (get_local $0)
        )
       )
      )
     )
     (set_local $4
      (i32.add
       (get_local $8)
       (tee_local $2
        (i32.shl
         (i32.div_s
          (i32.add
           (i32.shr_s
            (i32.sub
             (get_local $8)
             (get_local $2)
            )
            (i32.const 2)
           )
           (i32.const 1)
          )
          (i32.const -2)
         )
         (i32.const 2)
        )
       )
      )
     )
     (block $label$3
      (br_if $label$3
       (i32.eqz
        (tee_local $9
         (i32.shr_s
          (tee_local $5
           (i32.sub
            (get_local $9)
            (get_local $8)
           )
          )
          (i32.const 2)
         )
        )
       )
      )
      (drop
       (call $memmove
        (get_local $4)
        (get_local $8)
        (get_local $5)
       )
      )
      (set_local $8
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 4)
        )
       )
      )
     )
     (i32.store
      (i32.add
       (get_local $0)
       (i32.const 4)
      )
      (i32.add
       (get_local $8)
       (get_local $2)
      )
     )
     (i32.store
      (i32.add
       (get_local $0)
       (i32.const 8)
      )
      (tee_local $9
       (i32.add
        (get_local $4)
        (i32.shl
         (get_local $9)
         (i32.const 2)
        )
       )
      )
     )
     (br $label$1)
    )
    (br_if $label$0
     (i32.ge_u
      (tee_local $9
       (select
        (tee_local $9
         (i32.shr_s
          (i32.sub
           (get_local $4)
           (get_local $2)
          )
          (i32.const 1)
         )
        )
        (i32.const 1)
        (get_local $9)
       )
      )
      (i32.const 1073741824)
     )
    )
    (set_local $3
     (i32.add
      (tee_local $2
       (call $_Znwj
        (tee_local $8
         (i32.shl
          (get_local $9)
          (i32.const 2)
         )
        )
       )
      )
      (get_local $8)
     )
    )
    (set_local $9
     (tee_local $5
      (i32.add
       (get_local $2)
       (i32.and
        (get_local $9)
        (i32.const -4)
       )
      )
     )
    )
    (block $label$4
     (br_if $label$4
      (i32.eq
       (tee_local $8
        (i32.load
         (tee_local $7
          (i32.add
           (get_local $0)
           (i32.const 4)
          )
         )
        )
       )
       (tee_local $4
        (i32.load
         (tee_local $6
          (i32.add
           (get_local $0)
           (i32.const 8)
          )
         )
        )
       )
      )
     )
     (set_local $9
      (get_local $5)
     )
     (loop $label$5
      (i32.store
       (get_local $9)
       (i32.load
        (get_local $8)
       )
      )
      (set_local $9
       (i32.add
        (get_local $9)
        (i32.const 4)
       )
      )
      (br_if $label$5
       (i32.ne
        (get_local $4)
        (tee_local $8
         (i32.add
          (get_local $8)
          (i32.const 4)
         )
        )
       )
      )
     )
    )
    (i32.store
     (get_local $7)
     (get_local $5)
    )
    (set_local $8
     (i32.load
      (get_local $0)
     )
    )
    (i32.store
     (get_local $0)
     (get_local $2)
    )
    (i32.store
     (get_local $6)
     (get_local $9)
    )
    (i32.store
     (i32.add
      (get_local $0)
      (i32.const 12)
     )
     (get_local $3)
    )
    (br_if $label$1
     (i32.eqz
      (get_local $8)
     )
    )
    (call $_ZdlPv
     (get_local $8)
    )
    (set_local $9
     (i32.load
      (i32.add
       (get_local $0)
       (i32.const 8)
      )
     )
    )
   )
   (i32.store
    (get_local $9)
    (i32.load
     (get_local $1)
    )
   )
   (i32.store
    (tee_local $9
     (i32.add
      (get_local $0)
      (i32.const 8)
     )
    )
    (i32.add
     (i32.load
      (get_local $9)
     )
     (i32.const 4)
    )
   )
   (return)
  )
  (call $abort)
  (unreachable)
 )
 (func $_ZNSt3__114__split_bufferIPN8exchange11ramexchange5OfferENS_9allocatorIS4_EEE10push_frontEOS4_ (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (block $label$0
   (block $label$1
    (block $label$2
     (br_if $label$2
      (i32.eq
       (tee_local $8
        (i32.load offset=4
         (get_local $0)
        )
       )
       (tee_local $4
        (i32.load
         (get_local $0)
        )
       )
      )
     )
     (set_local $9
      (get_local $8)
     )
     (br $label$1)
    )
    (block $label$3
     (br_if $label$3
      (i32.ge_u
       (tee_local $7
        (i32.load offset=8
         (get_local $0)
        )
       )
       (tee_local $9
        (i32.load offset=12
         (get_local $0)
        )
       )
      )
     )
     (set_local $9
      (i32.add
       (get_local $7)
       (tee_local $4
        (i32.shl
         (i32.div_s
          (i32.add
           (i32.shr_s
            (i32.sub
             (get_local $9)
             (get_local $7)
            )
            (i32.const 2)
           )
           (i32.const 1)
          )
          (i32.const 2)
         )
         (i32.const 2)
        )
       )
      )
     )
     (block $label$4
      (br_if $label$4
       (i32.eqz
        (tee_local $3
         (i32.shr_s
          (tee_local $2
           (i32.sub
            (get_local $7)
            (get_local $8)
           )
          )
          (i32.const 2)
         )
        )
       )
      )
      (drop
       (call $memmove
        (tee_local $9
         (i32.sub
          (get_local $9)
          (i32.shl
           (get_local $3)
           (i32.const 2)
          )
         )
        )
        (get_local $8)
        (get_local $2)
       )
      )
      (set_local $7
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 8)
        )
       )
      )
     )
     (i32.store
      (i32.add
       (get_local $0)
       (i32.const 4)
      )
      (get_local $9)
     )
     (i32.store
      (i32.add
       (get_local $0)
       (i32.const 8)
      )
      (i32.add
       (get_local $7)
       (get_local $4)
      )
     )
     (br $label$1)
    )
    (br_if $label$0
     (i32.ge_u
      (tee_local $8
       (select
        (tee_local $8
         (i32.shr_s
          (i32.sub
           (get_local $9)
           (get_local $4)
          )
          (i32.const 1)
         )
        )
        (i32.const 1)
        (get_local $8)
       )
      )
      (i32.const 1073741824)
     )
    )
    (set_local $3
     (i32.add
      (tee_local $2
       (call $_Znwj
        (tee_local $7
         (i32.shl
          (get_local $8)
          (i32.const 2)
         )
        )
       )
      )
      (get_local $7)
     )
    )
    (set_local $8
     (tee_local $9
      (i32.add
       (get_local $2)
       (i32.and
        (i32.add
         (get_local $8)
         (i32.const 3)
        )
        (i32.const -4)
       )
      )
     )
    )
    (block $label$5
     (br_if $label$5
      (i32.eq
       (tee_local $7
        (i32.load
         (tee_local $6
          (i32.add
           (get_local $0)
           (i32.const 4)
          )
         )
        )
       )
       (tee_local $4
        (i32.load
         (tee_local $5
          (i32.add
           (get_local $0)
           (i32.const 8)
          )
         )
        )
       )
      )
     )
     (set_local $8
      (get_local $9)
     )
     (loop $label$6
      (i32.store
       (get_local $8)
       (i32.load
        (get_local $7)
       )
      )
      (set_local $8
       (i32.add
        (get_local $8)
        (i32.const 4)
       )
      )
      (br_if $label$6
       (i32.ne
        (get_local $4)
        (tee_local $7
         (i32.add
          (get_local $7)
          (i32.const 4)
         )
        )
       )
      )
     )
    )
    (i32.store
     (get_local $6)
     (get_local $9)
    )
    (set_local $7
     (i32.load
      (get_local $0)
     )
    )
    (i32.store
     (get_local $0)
     (get_local $2)
    )
    (i32.store
     (get_local $5)
     (get_local $8)
    )
    (i32.store
     (i32.add
      (get_local $0)
      (i32.const 12)
     )
     (get_local $3)
    )
    (br_if $label$1
     (i32.eqz
      (get_local $7)
     )
    )
    (call $_ZdlPv
     (get_local $7)
    )
    (set_local $9
     (i32.load
      (i32.add
       (get_local $0)
       (i32.const 4)
      )
     )
    )
   )
   (i32.store
    (i32.add
     (get_local $9)
     (i32.const -4)
    )
    (i32.load
     (get_local $1)
    )
   )
   (i32.store
    (tee_local $8
     (i32.add
      (get_local $0)
      (i32.const 4)
     )
    )
    (i32.add
     (i32.load
      (get_local $8)
     )
     (i32.const -4)
    )
   )
   (return)
  )
  (call $abort)
  (unreachable)
 )
 (func $_ZNSt3__114__split_bufferIPN8exchange11ramexchange5OfferERNS_9allocatorIS4_EEE9push_backEOS4_ (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.ne
      (tee_local $9
       (i32.load offset=8
        (get_local $0)
       )
      )
      (tee_local $4
       (i32.load offset=12
        (get_local $0)
       )
      )
     )
    )
    (block $label$2
     (br_if $label$2
      (i32.le_u
       (tee_local $8
        (i32.load offset=4
         (get_local $0)
        )
       )
       (tee_local $2
        (i32.load
         (get_local $0)
        )
       )
      )
     )
     (set_local $4
      (i32.add
       (get_local $8)
       (tee_local $2
        (i32.shl
         (i32.div_s
          (i32.add
           (i32.shr_s
            (i32.sub
             (get_local $8)
             (get_local $2)
            )
            (i32.const 2)
           )
           (i32.const 1)
          )
          (i32.const -2)
         )
         (i32.const 2)
        )
       )
      )
     )
     (block $label$3
      (br_if $label$3
       (i32.eqz
        (tee_local $9
         (i32.shr_s
          (tee_local $5
           (i32.sub
            (get_local $9)
            (get_local $8)
           )
          )
          (i32.const 2)
         )
        )
       )
      )
      (drop
       (call $memmove
        (get_local $4)
        (get_local $8)
        (get_local $5)
       )
      )
      (set_local $8
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 4)
        )
       )
      )
     )
     (i32.store
      (i32.add
       (get_local $0)
       (i32.const 4)
      )
      (i32.add
       (get_local $8)
       (get_local $2)
      )
     )
     (i32.store
      (i32.add
       (get_local $0)
       (i32.const 8)
      )
      (tee_local $9
       (i32.add
        (get_local $4)
        (i32.shl
         (get_local $9)
         (i32.const 2)
        )
       )
      )
     )
     (br $label$1)
    )
    (br_if $label$0
     (i32.ge_u
      (tee_local $9
       (select
        (tee_local $9
         (i32.shr_s
          (i32.sub
           (get_local $4)
           (get_local $2)
          )
          (i32.const 1)
         )
        )
        (i32.const 1)
        (get_local $9)
       )
      )
      (i32.const 1073741824)
     )
    )
    (set_local $3
     (i32.add
      (tee_local $2
       (call $_Znwj
        (tee_local $8
         (i32.shl
          (get_local $9)
          (i32.const 2)
         )
        )
       )
      )
      (get_local $8)
     )
    )
    (set_local $9
     (tee_local $5
      (i32.add
       (get_local $2)
       (i32.and
        (get_local $9)
        (i32.const -4)
       )
      )
     )
    )
    (block $label$4
     (br_if $label$4
      (i32.eq
       (tee_local $8
        (i32.load
         (tee_local $7
          (i32.add
           (get_local $0)
           (i32.const 4)
          )
         )
        )
       )
       (tee_local $4
        (i32.load
         (tee_local $6
          (i32.add
           (get_local $0)
           (i32.const 8)
          )
         )
        )
       )
      )
     )
     (set_local $9
      (get_local $5)
     )
     (loop $label$5
      (i32.store
       (get_local $9)
       (i32.load
        (get_local $8)
       )
      )
      (set_local $9
       (i32.add
        (get_local $9)
        (i32.const 4)
       )
      )
      (br_if $label$5
       (i32.ne
        (get_local $4)
        (tee_local $8
         (i32.add
          (get_local $8)
          (i32.const 4)
         )
        )
       )
      )
     )
    )
    (i32.store
     (get_local $7)
     (get_local $5)
    )
    (set_local $8
     (i32.load
      (get_local $0)
     )
    )
    (i32.store
     (get_local $0)
     (get_local $2)
    )
    (i32.store
     (get_local $6)
     (get_local $9)
    )
    (i32.store
     (i32.add
      (get_local $0)
      (i32.const 12)
     )
     (get_local $3)
    )
    (br_if $label$1
     (i32.eqz
      (get_local $8)
     )
    )
    (call $_ZdlPv
     (get_local $8)
    )
    (set_local $9
     (i32.load
      (i32.add
       (get_local $0)
       (i32.const 8)
      )
     )
    )
   )
   (i32.store
    (get_local $9)
    (i32.load
     (get_local $1)
    )
   )
   (i32.store
    (tee_local $9
     (i32.add
      (get_local $0)
      (i32.const 8)
     )
    )
    (i32.add
     (i32.load
      (get_local $9)
     )
     (i32.const 4)
    )
   )
   (return)
  )
  (call $abort)
  (unreachable)
 )
 (func $_ZNSt3__114__split_bufferIPN8exchange11ramexchange5OfferERNS_9allocatorIS4_EEE10push_frontERKS4_ (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (block $label$0
   (block $label$1
    (block $label$2
     (br_if $label$2
      (i32.eq
       (tee_local $8
        (i32.load offset=4
         (get_local $0)
        )
       )
       (tee_local $4
        (i32.load
         (get_local $0)
        )
       )
      )
     )
     (set_local $9
      (get_local $8)
     )
     (br $label$1)
    )
    (block $label$3
     (br_if $label$3
      (i32.ge_u
       (tee_local $7
        (i32.load offset=8
         (get_local $0)
        )
       )
       (tee_local $9
        (i32.load offset=12
         (get_local $0)
        )
       )
      )
     )
     (set_local $9
      (i32.add
       (get_local $7)
       (tee_local $4
        (i32.shl
         (i32.div_s
          (i32.add
           (i32.shr_s
            (i32.sub
             (get_local $9)
             (get_local $7)
            )
            (i32.const 2)
           )
           (i32.const 1)
          )
          (i32.const 2)
         )
         (i32.const 2)
        )
       )
      )
     )
     (block $label$4
      (br_if $label$4
       (i32.eqz
        (tee_local $3
         (i32.shr_s
          (tee_local $2
           (i32.sub
            (get_local $7)
            (get_local $8)
           )
          )
          (i32.const 2)
         )
        )
       )
      )
      (drop
       (call $memmove
        (tee_local $9
         (i32.sub
          (get_local $9)
          (i32.shl
           (get_local $3)
           (i32.const 2)
          )
         )
        )
        (get_local $8)
        (get_local $2)
       )
      )
      (set_local $7
       (i32.load
        (i32.add
         (get_local $0)
         (i32.const 8)
        )
       )
      )
     )
     (i32.store
      (i32.add
       (get_local $0)
       (i32.const 4)
      )
      (get_local $9)
     )
     (i32.store
      (i32.add
       (get_local $0)
       (i32.const 8)
      )
      (i32.add
       (get_local $7)
       (get_local $4)
      )
     )
     (br $label$1)
    )
    (br_if $label$0
     (i32.ge_u
      (tee_local $8
       (select
        (tee_local $8
         (i32.shr_s
          (i32.sub
           (get_local $9)
           (get_local $4)
          )
          (i32.const 1)
         )
        )
        (i32.const 1)
        (get_local $8)
       )
      )
      (i32.const 1073741824)
     )
    )
    (set_local $3
     (i32.add
      (tee_local $2
       (call $_Znwj
        (tee_local $7
         (i32.shl
          (get_local $8)
          (i32.const 2)
         )
        )
       )
      )
      (get_local $7)
     )
    )
    (set_local $8
     (tee_local $9
      (i32.add
       (get_local $2)
       (i32.and
        (i32.add
         (get_local $8)
         (i32.const 3)
        )
        (i32.const -4)
       )
      )
     )
    )
    (block $label$5
     (br_if $label$5
      (i32.eq
       (tee_local $7
        (i32.load
         (tee_local $6
          (i32.add
           (get_local $0)
           (i32.const 4)
          )
         )
        )
       )
       (tee_local $4
        (i32.load
         (tee_local $5
          (i32.add
           (get_local $0)
           (i32.const 8)
          )
         )
        )
       )
      )
     )
     (set_local $8
      (get_local $9)
     )
     (loop $label$6
      (i32.store
       (get_local $8)
       (i32.load
        (get_local $7)
       )
      )
      (set_local $8
       (i32.add
        (get_local $8)
        (i32.const 4)
       )
      )
      (br_if $label$6
       (i32.ne
        (get_local $4)
        (tee_local $7
         (i32.add
          (get_local $7)
          (i32.const 4)
         )
        )
       )
      )
     )
    )
    (i32.store
     (get_local $6)
     (get_local $9)
    )
    (set_local $7
     (i32.load
      (get_local $0)
     )
    )
    (i32.store
     (get_local $0)
     (get_local $2)
    )
    (i32.store
     (get_local $5)
     (get_local $8)
    )
    (i32.store
     (i32.add
      (get_local $0)
      (i32.const 12)
     )
     (get_local $3)
    )
    (br_if $label$1
     (i32.eqz
      (get_local $7)
     )
    )
    (call $_ZdlPv
     (get_local $7)
    )
    (set_local $9
     (i32.load
      (i32.add
       (get_local $0)
       (i32.const 4)
      )
     )
    )
   )
   (i32.store
    (i32.add
     (get_local $9)
     (i32.const -4)
    )
    (i32.load
     (get_local $1)
    )
   )
   (i32.store
    (tee_local $8
     (i32.add
      (get_local $0)
      (i32.const 4)
     )
    )
    (i32.add
     (i32.load
      (get_local $8)
     )
     (i32.const -4)
    )
   )
   (return)
  )
  (call $abort)
  (unreachable)
 )
 (func $_ZN5boost6fusion6detail17for_each_unrolledILi4EE4callINS0_18std_tuple_iteratorINSt3__15tupleIJyN5eosio5assetEmbEEELi0EEEZNS8_rsINS8_10datastreamIPKcEEJyS9_mbEEERT_SI_RNS7_IJDpT0_EEEEUlSI_E_EEvRKSH_RKT0_ (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $4
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
  (set_local $2
   (i32.load
    (get_local $0)
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (tee_local $3
       (i32.load
        (get_local $1)
       )
      )
     )
     (i32.load offset=4
      (get_local $3)
     )
    )
    (i32.const 7)
   )
   (i32.const 688)
  )
  (drop
   (call $memcpy
    (get_local $2)
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $3)
   (i32.add
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 8)
   )
  )
  (set_local $0
   (i32.load
    (get_local $0)
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (tee_local $3
       (i32.load
        (get_local $1)
       )
      )
     )
     (i32.load offset=4
      (get_local $3)
     )
    )
    (i32.const 7)
   )
   (i32.const 688)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $0)
     (i32.const 8)
    )
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $3)
   (tee_local $2
    (i32.add
     (i32.load offset=4
      (get_local $3)
     )
     (i32.const 8)
    )
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (get_local $3)
     )
     (get_local $2)
    )
    (i32.const 7)
   )
   (i32.const 688)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $0)
     (i32.const 16)
    )
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (get_local $3)
   (i32.add
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 8)
   )
  )
  (call $eosio_assert
   (i32.gt_u
    (i32.sub
     (i32.load offset=8
      (tee_local $3
       (i32.load
        (get_local $1)
       )
      )
     )
     (i32.load offset=4
      (get_local $3)
     )
    )
    (i32.const 3)
   )
   (i32.const 688)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $0)
     (i32.const 24)
    )
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 4)
   )
  )
  (i32.store offset=4
   (get_local $3)
   (i32.add
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 4)
   )
  )
  (call $eosio_assert
   (i32.ne
    (i32.load offset=8
     (tee_local $3
      (i32.load
       (get_local $1)
      )
     )
    )
    (i32.load offset=4
     (get_local $3)
    )
   )
   (i32.const 688)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $4)
     (i32.const 15)
    )
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 1)
   )
  )
  (i32.store offset=4
   (get_local $3)
   (i32.add
    (i32.load offset=4
     (get_local $3)
    )
    (i32.const 1)
   )
  )
  (i32.store8 offset=28
   (get_local $0)
   (i32.ne
    (i32.load8_u offset=15
     (get_local $4)
    )
    (i32.const 0)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $4)
    (i32.const 16)
   )
  )
 )
 (func $_ZN8exchange11ramexchangeC2Ey (param $0 i32) (param $1 i64) (result i32)
  (i64.store
   (get_local $0)
   (get_local $1)
  )
  (drop
   (call $_ZN5eosio10ram_marketC2Ev
    (i32.add
     (get_local $0)
     (i32.const 8)
    )
   )
  )
  (i64.store offset=48 align=4
   (get_local $0)
   (i64.const 0)
  )
  (i64.store align=4
   (i32.add
    (get_local $0)
    (i32.const 56)
   )
   (i64.const 0)
  )
  (i64.store align=4
   (i32.add
    (get_local $0)
    (i32.const 64)
   )
   (i64.const 0)
  )
  (i64.store offset=72 align=4
   (get_local $0)
   (i64.const 0)
  )
  (i64.store align=4
   (i32.add
    (get_local $0)
    (i32.const 80)
   )
   (i64.const 0)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 88)
   )
   (i32.const 0)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 92)
   )
   (i32.const 0)
  )
  (get_local $0)
 )
 (func $_ZN5eosio10ram_marketC2Ev (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (set_local $4
   (i64.const 0)
  )
  (set_local $3
   (i64.const 59)
  )
  (set_local $2
   (i32.const 32)
  )
  (set_local $5
   (i64.const 0)
  )
  (loop $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_if $label$5
         (i64.gt_u
          (get_local $4)
          (i64.const 4)
         )
        )
        (br_if $label$4
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $1
             (i32.load8_s
              (get_local $2)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $1
         (i32.add
          (get_local $1)
          (i32.const 165)
         )
        )
        (br $label$3)
       )
       (set_local $6
        (i64.const 0)
       )
       (br_if $label$2
        (i64.le_u
         (get_local $4)
         (i64.const 11)
        )
       )
       (br $label$1)
      )
      (set_local $1
       (select
        (i32.add
         (get_local $1)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $1)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $6
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $1)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $6
     (i64.shl
      (i64.and
       (get_local $6)
       (i64.const 31)
      )
      (i64.and
       (get_local $3)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $2
    (i32.add
     (get_local $2)
     (i32.const 1)
    )
   )
   (set_local $4
    (i64.add
     (get_local $4)
     (i64.const 1)
    )
   )
   (set_local $5
    (i64.or
     (get_local $6)
     (get_local $5)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $3
      (i64.add
       (get_local $3)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (set_local $4
   (i64.const 0)
  )
  (set_local $3
   (i64.const 59)
  )
  (set_local $2
   (i32.const 32)
  )
  (set_local $7
   (i64.const 0)
  )
  (loop $label$6
   (block $label$7
    (block $label$8
     (block $label$9
      (block $label$10
       (block $label$11
        (br_if $label$11
         (i64.gt_u
          (get_local $4)
          (i64.const 4)
         )
        )
        (br_if $label$10
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $1
             (i32.load8_s
              (get_local $2)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $1
         (i32.add
          (get_local $1)
          (i32.const 165)
         )
        )
        (br $label$9)
       )
       (set_local $6
        (i64.const 0)
       )
       (br_if $label$8
        (i64.le_u
         (get_local $4)
         (i64.const 11)
        )
       )
       (br $label$7)
      )
      (set_local $1
       (select
        (i32.add
         (get_local $1)
         (i32.const 208)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $1)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $6
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $1)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $6
     (i64.shl
      (i64.and
       (get_local $6)
       (i64.const 31)
      )
      (i64.and
       (get_local $3)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $2
    (i32.add
     (get_local $2)
     (i32.const 1)
    )
   )
   (set_local $4
    (i64.add
     (get_local $4)
     (i64.const 1)
    )
   )
   (set_local $7
    (i64.or
     (get_local $6)
     (get_local $7)
    )
   )
   (br_if $label$6
    (i64.ne
     (tee_local $3
      (i64.add
       (get_local $3)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (i64.store offset=8
   (get_local $0)
   (get_local $7)
  )
  (i64.store
   (get_local $0)
   (get_local $5)
  )
  (i64.store offset=16
   (get_local $0)
   (i64.const -1)
  )
  (i64.store offset=24 align=4
   (get_local $0)
   (i64.const 0)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 32)
   )
   (i32.const 0)
  )
  (get_local $0)
 )
 (func $_ZN8exchange11ramexchange12getLiveValueEv (param $0 i32) (param $1 i32)
  (call $_ZNK5eosio10ram_market12get_rampriceEv
   (get_local $0)
   (i32.add
    (get_local $1)
    (i32.const 8)
   )
  )
 )
 (func $_ZN8exchange11ramexchange10addToQueueENS0_5OfferENSt3__15queueIS1_NS2_5dequeIS1_NS2_9allocatorIS1_EEEEEE (param $0 i32) (param $1 i32) (param $2 i32)
 )
 (func $_ZN8exchange11ramexchange20getAmonutOfRamTokensEN5eosio5assetES2_ (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i64)
  (call $eosio_assert
   (i64.eq
    (i64.load offset=8
     (get_local $2)
    )
    (i64.load offset=8
     (get_local $3)
    )
   )
   (i32.const 176)
  )
  (i64.store offset=8
   (get_local $0)
   (i64.const 1296126467)
  )
  (i64.store
   (get_local $0)
   (tee_local $4
    (i64.mul
     (i64.div_s
      (i64.load
       (get_local $2)
      )
      (i64.load
       (get_local $3)
      )
     )
     (i64.const 1024000)
    )
   )
  )
  (call $eosio_assert
   (i64.lt_u
    (i64.add
     (get_local $4)
     (i64.const 4611686018427387903)
    )
    (i64.const 9223372036854775807)
   )
   (i32.const 384)
  )
  (set_local $0
   (i32.const 0)
  )
  (set_local $4
   (i64.const 5062994)
  )
  (block $label$0
   (block $label$1
    (loop $label$2
     (br_if $label$1
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $4)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$3
      (br_if $label$3
       (i64.ne
        (i64.and
         (tee_local $4
          (i64.shr_u
           (get_local $4)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$4
       (br_if $label$1
        (i64.ne
         (i64.and
          (tee_local $4
           (i64.shr_u
            (get_local $4)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$4
        (i32.lt_s
         (tee_local $0
          (i32.add
           (get_local $0)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $2
      (i32.const 1)
     )
     (br_if $label$2
      (i32.lt_s
       (tee_local $0
        (i32.add
         (get_local $0)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$0)
    )
   )
   (set_local $2
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $2)
   (i32.const 112)
  )
 )
 (func $_ZN8exchange11ramexchange10getMinimumEN5eosio5assetES2_ (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (call $eosio_assert
   (i64.eq
    (i64.load offset=8
     (get_local $2)
    )
    (i64.load offset=8
     (get_local $3)
    )
   )
   (i32.const 176)
  )
  (i32.store
   (get_local $0)
   (i32.load
    (tee_local $2
     (select
      (get_local $2)
      (get_local $3)
      (i64.lt_s
       (i64.load
        (get_local $2)
       )
       (i64.load
        (get_local $3)
       )
      )
     )
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 12)
   )
   (i32.load
    (i32.add
     (get_local $2)
     (i32.const 12)
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
   (i32.load
    (i32.add
     (get_local $2)
     (i32.const 8)
    )
   )
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 4)
   )
   (i32.load
    (i32.add
     (get_local $2)
     (i32.const 4)
    )
   )
  )
 )
 (func $_ZN8exchange11ramexchange16popFromSellQueueEv (param $0 i32) (result i32)
  (i32.const 0)
 )
 (func $_ZN8exchange11ramexchange15popFromBuyQueueEv (param $0 i32) (result i32)
  (i32.const 0)
 )
 (func $_ZN8exchange11ramexchange10doCleaningEv (param $0 i32)
 )
 (func $_ZN8exchange11ramexchange11findInQueueENSt3__15queueINS0_5OfferENS1_5dequeIS3_NS1_9allocatorIS3_EEEEEEy (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i64)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (set_local $4
   (call $current_time)
  )
  (i64.store offset=8
   (get_local $0)
   (get_local $3)
  )
  (i64.store
   (get_local $0)
   (get_local $4)
  )
  (i64.store offset=16
   (get_local $0)
   (i64.const 1)
  )
  (i64.store
   (i32.add
    (get_local $0)
    (i32.const 24)
   )
   (i64.const 1398362884)
  )
  (call $eosio_assert
   (i32.const 1)
   (i32.const 384)
  )
  (set_local $5
   (i32.const 0)
  )
  (set_local $3
   (i64.const 5462355)
  )
  (block $label$0
   (block $label$1
    (loop $label$2
     (br_if $label$1
      (i32.gt_u
       (i32.add
        (i32.shl
         (i32.wrap/i64
          (get_local $3)
         )
         (i32.const 24)
        )
        (i32.const -1073741825)
       )
       (i32.const 452984830)
      )
     )
     (block $label$3
      (br_if $label$3
       (i64.ne
        (i64.and
         (tee_local $3
          (i64.shr_u
           (get_local $3)
           (i64.const 8)
          )
         )
         (i64.const 255)
        )
        (i64.const 0)
       )
      )
      (loop $label$4
       (br_if $label$1
        (i64.ne
         (i64.and
          (tee_local $3
           (i64.shr_u
            (get_local $3)
            (i64.const 8)
           )
          )
          (i64.const 255)
         )
         (i64.const 0)
        )
       )
       (br_if $label$4
        (i32.lt_s
         (tee_local $5
          (i32.add
           (get_local $5)
           (i32.const 1)
          )
         )
         (i32.const 7)
        )
       )
      )
     )
     (set_local $6
      (i32.const 1)
     )
     (br_if $label$2
      (i32.lt_s
       (tee_local $5
        (i32.add
         (get_local $5)
         (i32.const 1)
        )
       )
       (i32.const 7)
      )
     )
     (br $label$0)
    )
   )
   (set_local $6
    (i32.const 0)
   )
  )
  (call $eosio_assert
   (get_local $6)
   (i32.const 112)
  )
  (i32.store8 offset=36
   (get_local $0)
   (i32.const 0)
  )
  (i32.store offset=32
   (get_local $0)
   (i32.const 0)
  )
 )
 (func $_ZN8exchange11ramexchange15removeFromQueueEy (param $0 i32) (param $1 i64) (result i32)
  (i32.const 0)
 )
 (func $malloc (param $0 i32) (result i32)
  (call $_ZN5eosio14memory_manager6mallocEm
   (i32.const 1296)
   (get_local $0)
  )
 )
 (func $_ZN5eosio14memory_manager6mallocEm (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (get_local $1)
    )
   )
   (block $label$1
    (br_if $label$1
     (tee_local $13
      (i32.load offset=8384
       (get_local $0)
      )
     )
    )
    (set_local $13
     (i32.const 16)
    )
    (i32.store
     (i32.add
      (get_local $0)
      (i32.const 8384)
     )
     (i32.const 16)
    )
   )
   (set_local $2
    (select
     (i32.sub
      (i32.add
       (get_local $1)
       (i32.const 8)
      )
      (tee_local $2
       (i32.and
        (i32.add
         (get_local $1)
         (i32.const 4)
        )
        (i32.const 7)
       )
      )
     )
     (get_local $1)
     (get_local $2)
    )
   )
   (block $label$2
    (block $label$3
     (block $label$4
      (br_if $label$4
       (i32.ge_u
        (tee_local $10
         (i32.load offset=8388
          (get_local $0)
         )
        )
        (get_local $13)
       )
      )
      (set_local $1
       (i32.add
        (i32.add
         (get_local $0)
         (i32.mul
          (get_local $10)
          (i32.const 12)
         )
        )
        (i32.const 8192)
       )
      )
      (block $label$5
       (br_if $label$5
        (get_local $10)
       )
       (br_if $label$5
        (i32.load
         (tee_local $13
          (i32.add
           (get_local $0)
           (i32.const 8196)
          )
         )
        )
       )
       (i32.store
        (get_local $1)
        (i32.const 8192)
       )
       (i32.store
        (get_local $13)
        (get_local $0)
       )
      )
      (set_local $10
       (i32.add
        (get_local $2)
        (i32.const 4)
       )
      )
      (loop $label$6
       (block $label$7
        (br_if $label$7
         (i32.gt_u
          (i32.add
           (tee_local $13
            (i32.load offset=8
             (get_local $1)
            )
           )
           (get_local $10)
          )
          (i32.load
           (get_local $1)
          )
         )
        )
        (i32.store
         (tee_local $13
          (i32.add
           (i32.load offset=4
            (get_local $1)
           )
           (get_local $13)
          )
         )
         (i32.or
          (i32.and
           (i32.load
            (get_local $13)
           )
           (i32.const -2147483648)
          )
          (get_local $2)
         )
        )
        (i32.store
         (tee_local $1
          (i32.add
           (get_local $1)
           (i32.const 8)
          )
         )
         (i32.add
          (i32.load
           (get_local $1)
          )
          (get_local $10)
         )
        )
        (i32.store
         (get_local $13)
         (i32.or
          (i32.load
           (get_local $13)
          )
          (i32.const -2147483648)
         )
        )
        (br_if $label$3
         (tee_local $1
          (i32.add
           (get_local $13)
           (i32.const 4)
          )
         )
        )
       )
       (br_if $label$6
        (tee_local $1
         (call $_ZN5eosio14memory_manager16next_active_heapEv
          (get_local $0)
         )
        )
       )
      )
     )
     (set_local $4
      (i32.sub
       (i32.const 2147483644)
       (get_local $2)
      )
     )
     (set_local $11
      (i32.add
       (get_local $0)
       (i32.const 8392)
      )
     )
     (set_local $12
      (i32.add
       (get_local $0)
       (i32.const 8384)
      )
     )
     (set_local $13
      (tee_local $3
       (i32.load offset=8392
        (get_local $0)
       )
      )
     )
     (loop $label$8
      (call $eosio_assert
       (i32.eq
        (i32.load
         (i32.add
          (tee_local $1
           (i32.add
            (get_local $0)
            (i32.mul
             (get_local $13)
             (i32.const 12)
            )
           )
          )
          (i32.const 8200)
         )
        )
        (i32.load
         (tee_local $5
          (i32.add
           (get_local $1)
           (i32.const 8192)
          )
         )
        )
       )
       (i32.const 9696)
      )
      (set_local $13
       (i32.add
        (tee_local $6
         (i32.load
          (i32.add
           (get_local $1)
           (i32.const 8196)
          )
         )
        )
        (i32.const 4)
       )
      )
      (loop $label$9
       (set_local $7
        (i32.add
         (get_local $6)
         (i32.load
          (get_local $5)
         )
        )
       )
       (set_local $1
        (i32.and
         (tee_local $9
          (i32.load
           (tee_local $8
            (i32.add
             (get_local $13)
             (i32.const -4)
            )
           )
          )
         )
         (i32.const 2147483647)
        )
       )
       (block $label$10
        (br_if $label$10
         (i32.lt_s
          (get_local $9)
          (i32.const 0)
         )
        )
        (block $label$11
         (br_if $label$11
          (i32.ge_u
           (get_local $1)
           (get_local $2)
          )
         )
         (loop $label$12
          (br_if $label$11
           (i32.ge_u
            (tee_local $10
             (i32.add
              (get_local $13)
              (get_local $1)
             )
            )
            (get_local $7)
           )
          )
          (br_if $label$11
           (i32.lt_s
            (tee_local $10
             (i32.load
              (get_local $10)
             )
            )
            (i32.const 0)
           )
          )
          (br_if $label$12
           (i32.lt_u
            (tee_local $1
             (i32.add
              (i32.add
               (get_local $1)
               (i32.and
                (get_local $10)
                (i32.const 2147483647)
               )
              )
              (i32.const 4)
             )
            )
            (get_local $2)
           )
          )
         )
        )
        (i32.store
         (get_local $8)
         (i32.or
          (select
           (get_local $1)
           (get_local $2)
           (i32.lt_u
            (get_local $1)
            (get_local $2)
           )
          )
          (i32.and
           (get_local $9)
           (i32.const -2147483648)
          )
         )
        )
        (block $label$13
         (br_if $label$13
          (i32.le_u
           (get_local $1)
           (get_local $2)
          )
         )
         (i32.store
          (i32.add
           (get_local $13)
           (get_local $2)
          )
          (i32.and
           (i32.add
            (get_local $4)
            (get_local $1)
           )
           (i32.const 2147483647)
          )
         )
        )
        (br_if $label$2
         (i32.ge_u
          (get_local $1)
          (get_local $2)
         )
        )
       )
       (br_if $label$9
        (i32.lt_u
         (tee_local $13
          (i32.add
           (i32.add
            (get_local $13)
            (get_local $1)
           )
           (i32.const 4)
          )
         )
         (get_local $7)
        )
       )
      )
      (set_local $1
       (i32.const 0)
      )
      (i32.store
       (get_local $11)
       (tee_local $13
        (select
         (i32.const 0)
         (tee_local $13
          (i32.add
           (i32.load
            (get_local $11)
           )
           (i32.const 1)
          )
         )
         (i32.eq
          (get_local $13)
          (i32.load
           (get_local $12)
          )
         )
        )
       )
      )
      (br_if $label$8
       (i32.ne
        (get_local $13)
        (get_local $3)
       )
      )
     )
    )
    (return
     (get_local $1)
    )
   )
   (i32.store
    (get_local $8)
    (i32.or
     (i32.load
      (get_local $8)
     )
     (i32.const -2147483648)
    )
   )
   (return
    (get_local $13)
   )
  )
  (i32.const 0)
 )
 (func $_ZN5eosio14memory_manager16next_active_heapEv (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (set_local $1
   (i32.load offset=8388
    (get_local $0)
   )
  )
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.eqz
      (i32.load8_u offset=9782
       (i32.const 0)
      )
     )
    )
    (set_local $7
     (i32.load offset=9784
      (i32.const 0)
     )
    )
    (br $label$0)
   )
   (set_local $7
    (current_memory)
   )
   (i32.store8 offset=9782
    (i32.const 0)
    (i32.const 1)
   )
   (i32.store offset=9784
    (i32.const 0)
    (tee_local $7
     (i32.shl
      (get_local $7)
      (i32.const 16)
     )
    )
   )
  )
  (set_local $3
   (get_local $7)
  )
  (block $label$2
   (block $label$3
    (block $label$4
     (block $label$5
      (br_if $label$5
       (i32.le_u
        (tee_local $2
         (i32.shr_u
          (i32.add
           (get_local $7)
           (i32.const 65535)
          )
          (i32.const 16)
         )
        )
        (tee_local $8
         (current_memory)
        )
       )
      )
      (drop
       (grow_memory
        (i32.sub
         (get_local $2)
         (get_local $8)
        )
       )
      )
      (set_local $8
       (i32.const 0)
      )
      (br_if $label$4
       (i32.ne
        (get_local $2)
        (current_memory)
       )
      )
      (set_local $3
       (i32.load offset=9784
        (i32.const 0)
       )
      )
     )
     (set_local $8
      (i32.const 0)
     )
     (i32.store offset=9784
      (i32.const 0)
      (get_local $3)
     )
     (br_if $label$4
      (i32.lt_s
       (get_local $7)
       (i32.const 0)
      )
     )
     (set_local $2
      (i32.add
       (get_local $0)
       (i32.mul
        (get_local $1)
        (i32.const 12)
       )
      )
     )
     (set_local $7
      (i32.sub
       (i32.sub
        (i32.add
         (get_local $7)
         (select
          (i32.const 65536)
          (i32.const 131072)
          (tee_local $6
           (i32.lt_u
            (tee_local $8
             (i32.and
              (get_local $7)
              (i32.const 65535)
             )
            )
            (i32.const 64513)
           )
          )
         )
        )
        (select
         (get_local $8)
         (i32.and
          (get_local $7)
          (i32.const 131071)
         )
         (get_local $6)
        )
       )
       (get_local $7)
      )
     )
     (block $label$6
      (br_if $label$6
       (i32.load8_u offset=9782
        (i32.const 0)
       )
      )
      (set_local $3
       (current_memory)
      )
      (i32.store8 offset=9782
       (i32.const 0)
       (i32.const 1)
      )
      (i32.store offset=9784
       (i32.const 0)
       (tee_local $3
        (i32.shl
         (get_local $3)
         (i32.const 16)
        )
       )
      )
     )
     (set_local $2
      (i32.add
       (get_local $2)
       (i32.const 8192)
      )
     )
     (br_if $label$3
      (i32.lt_s
       (get_local $7)
       (i32.const 0)
      )
     )
     (set_local $6
      (get_local $3)
     )
     (block $label$7
      (br_if $label$7
       (i32.le_u
        (tee_local $8
         (i32.shr_u
          (i32.add
           (i32.add
            (tee_local $5
             (i32.and
              (i32.add
               (get_local $7)
               (i32.const 7)
              )
              (i32.const -8)
             )
            )
            (get_local $3)
           )
           (i32.const 65535)
          )
          (i32.const 16)
         )
        )
        (tee_local $4
         (current_memory)
        )
       )
      )
      (drop
       (grow_memory
        (i32.sub
         (get_local $8)
         (get_local $4)
        )
       )
      )
      (br_if $label$3
       (i32.ne
        (get_local $8)
        (current_memory)
       )
      )
      (set_local $6
       (i32.load offset=9784
        (i32.const 0)
       )
      )
     )
     (i32.store offset=9784
      (i32.const 0)
      (i32.add
       (get_local $6)
       (get_local $5)
      )
     )
     (br_if $label$3
      (i32.eq
       (get_local $3)
       (i32.const -1)
      )
     )
     (br_if $label$2
      (i32.eq
       (i32.add
        (tee_local $6
         (i32.load
          (i32.add
           (tee_local $1
            (i32.add
             (get_local $0)
             (i32.mul
              (get_local $1)
              (i32.const 12)
             )
            )
           )
           (i32.const 8196)
          )
         )
        )
        (tee_local $8
         (i32.load
          (get_local $2)
         )
        )
       )
       (get_local $3)
      )
     )
     (block $label$8
      (br_if $label$8
       (i32.eq
        (get_local $8)
        (tee_local $1
         (i32.load
          (tee_local $5
           (i32.add
            (get_local $1)
            (i32.const 8200)
           )
          )
         )
        )
       )
      )
      (i32.store
       (tee_local $6
        (i32.add
         (get_local $6)
         (get_local $1)
        )
       )
       (i32.or
        (i32.and
         (i32.load
          (get_local $6)
         )
         (i32.const -2147483648)
        )
        (i32.add
         (i32.sub
          (i32.const -4)
          (get_local $1)
         )
         (get_local $8)
        )
       )
      )
      (i32.store
       (get_local $5)
       (i32.load
        (get_local $2)
       )
      )
      (i32.store
       (get_local $6)
       (i32.and
        (i32.load
         (get_local $6)
        )
        (i32.const 2147483647)
       )
      )
     )
     (i32.store
      (tee_local $2
       (i32.add
        (get_local $0)
        (i32.const 8388)
       )
      )
      (tee_local $2
       (i32.add
        (i32.load
         (get_local $2)
        )
        (i32.const 1)
       )
      )
     )
     (i32.store
      (i32.add
       (tee_local $0
        (i32.add
         (get_local $0)
         (i32.mul
          (get_local $2)
          (i32.const 12)
         )
        )
       )
       (i32.const 8196)
      )
      (get_local $3)
     )
     (i32.store
      (tee_local $8
       (i32.add
        (get_local $0)
        (i32.const 8192)
       )
      )
      (get_local $7)
     )
    )
    (return
     (get_local $8)
    )
   )
   (block $label$9
    (br_if $label$9
     (i32.eq
      (tee_local $8
       (i32.load
        (get_local $2)
       )
      )
      (tee_local $7
       (i32.load
        (tee_local $1
         (i32.add
          (tee_local $3
           (i32.add
            (get_local $0)
            (i32.mul
             (get_local $1)
             (i32.const 12)
            )
           )
          )
          (i32.const 8200)
         )
        )
       )
      )
     )
    )
    (i32.store
     (tee_local $3
      (i32.add
       (i32.load
        (i32.add
         (get_local $3)
         (i32.const 8196)
        )
       )
       (get_local $7)
      )
     )
     (i32.or
      (i32.and
       (i32.load
        (get_local $3)
       )
       (i32.const -2147483648)
      )
      (i32.add
       (i32.sub
        (i32.const -4)
        (get_local $7)
       )
       (get_local $8)
      )
     )
    )
    (i32.store
     (get_local $1)
     (i32.load
      (get_local $2)
     )
    )
    (i32.store
     (get_local $3)
     (i32.and
      (i32.load
       (get_local $3)
      )
      (i32.const 2147483647)
     )
    )
   )
   (i32.store offset=8384
    (get_local $0)
    (tee_local $3
     (i32.add
      (i32.load
       (tee_local $7
        (i32.add
         (get_local $0)
         (i32.const 8388)
        )
       )
      )
      (i32.const 1)
     )
    )
   )
   (i32.store
    (get_local $7)
    (get_local $3)
   )
   (return
    (i32.const 0)
   )
  )
  (i32.store
   (get_local $2)
   (i32.add
    (get_local $8)
    (get_local $7)
   )
  )
  (get_local $2)
 )
 (func $free (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.eqz
      (get_local $0)
     )
    )
    (br_if $label$1
     (i32.lt_s
      (tee_local $2
       (i32.load offset=9680
        (i32.const 0)
       )
      )
      (i32.const 1)
     )
    )
    (set_local $3
     (i32.const 9488)
    )
    (set_local $1
     (i32.add
      (i32.mul
       (get_local $2)
       (i32.const 12)
      )
      (i32.const 9488)
     )
    )
    (loop $label$2
     (br_if $label$1
      (i32.eqz
       (tee_local $2
        (i32.load
         (i32.add
          (get_local $3)
          (i32.const 4)
         )
        )
       )
      )
     )
     (block $label$3
      (br_if $label$3
       (i32.gt_u
        (i32.add
         (get_local $2)
         (i32.const 4)
        )
        (get_local $0)
       )
      )
      (br_if $label$0
       (i32.gt_u
        (i32.add
         (get_local $2)
         (i32.load
          (get_local $3)
         )
        )
        (get_local $0)
       )
      )
     )
     (br_if $label$2
      (i32.lt_u
       (tee_local $3
        (i32.add
         (get_local $3)
         (i32.const 12)
        )
       )
       (get_local $1)
      )
     )
    )
   )
   (return)
  )
  (i32.store
   (tee_local $3
    (i32.add
     (get_local $0)
     (i32.const -4)
    )
   )
   (i32.and
    (i32.load
     (get_local $3)
    )
    (i32.const 2147483647)
   )
  )
 )
 (func $_Znwj (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (block $label$0
   (br_if $label$0
    (tee_local $0
     (call $malloc
      (tee_local $1
       (select
        (get_local $0)
        (i32.const 1)
        (get_local $0)
       )
      )
     )
    )
   )
   (loop $label$1
    (set_local $0
     (i32.const 0)
    )
    (br_if $label$0
     (i32.eqz
      (tee_local $2
       (i32.load offset=9788
        (i32.const 0)
       )
      )
     )
    )
    (call_indirect (type $FUNCSIG$v)
     (get_local $2)
    )
    (br_if $label$1
     (i32.eqz
      (tee_local $0
       (call $malloc
        (get_local $1)
       )
      )
     )
    )
   )
  )
  (get_local $0)
 )
 (func $_ZdlPv (param $0 i32)
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (get_local $0)
    )
   )
   (call $free
    (get_local $0)
   )
  )
 )
 (func $_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv (param $0 i32)
  (call $abort)
  (unreachable)
 )
 (func $_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv (param $0 i32)
  (call $abort)
  (unreachable)
 )
 (func $_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2ERKS5_ (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i64.store align=4
   (get_local $0)
   (i64.const 0)
  )
  (i32.store
   (tee_local $3
    (i32.add
     (get_local $0)
     (i32.const 8)
    )
   )
   (i32.const 0)
  )
  (block $label$0
   (br_if $label$0
    (i32.and
     (i32.load8_u
      (get_local $1)
     )
     (i32.const 1)
    )
   )
   (i64.store align=4
    (get_local $0)
    (i64.load align=4
     (get_local $1)
    )
   )
   (i32.store
    (get_local $3)
    (i32.load
     (i32.add
      (get_local $1)
      (i32.const 8)
     )
    )
   )
   (return
    (get_local $0)
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.ge_u
     (tee_local $3
      (i32.load offset=4
       (get_local $1)
      )
     )
     (i32.const -16)
    )
   )
   (set_local $2
    (i32.load offset=8
     (get_local $1)
    )
   )
   (block $label$2
    (block $label$3
     (block $label$4
      (br_if $label$4
       (i32.ge_u
        (get_local $3)
        (i32.const 11)
       )
      )
      (i32.store8
       (get_local $0)
       (i32.shl
        (get_local $3)
        (i32.const 1)
       )
      )
      (set_local $1
       (i32.add
        (get_local $0)
        (i32.const 1)
       )
      )
      (br_if $label$3
       (get_local $3)
      )
      (br $label$2)
     )
     (set_local $1
      (call $_Znwj
       (tee_local $4
        (i32.and
         (i32.add
          (get_local $3)
          (i32.const 16)
         )
         (i32.const -16)
        )
       )
      )
     )
     (i32.store
      (get_local $0)
      (i32.or
       (get_local $4)
       (i32.const 1)
      )
     )
     (i32.store offset=8
      (get_local $0)
      (get_local $1)
     )
     (i32.store offset=4
      (get_local $0)
      (get_local $3)
     )
    )
    (drop
     (call $memcpy
      (get_local $1)
      (get_local $2)
      (get_local $3)
     )
    )
   )
   (i32.store8
    (i32.add
     (get_local $1)
     (get_local $3)
    )
    (i32.const 0)
   )
   (return
    (get_local $0)
   )
  )
  (call $abort)
  (unreachable)
 )
 (func $memcmp (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (set_local $5
   (i32.const 0)
  )
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (get_local $2)
    )
   )
   (block $label$1
    (loop $label$2
     (br_if $label$1
      (i32.ne
       (tee_local $3
        (i32.load8_u
         (get_local $0)
        )
       )
       (tee_local $4
        (i32.load8_u
         (get_local $1)
        )
       )
      )
     )
     (set_local $1
      (i32.add
       (get_local $1)
       (i32.const 1)
      )
     )
     (set_local $0
      (i32.add
       (get_local $0)
       (i32.const 1)
      )
     )
     (br_if $label$2
      (tee_local $2
       (i32.add
        (get_local $2)
        (i32.const -1)
       )
      )
     )
     (br $label$0)
    )
   )
   (set_local $5
    (i32.sub
     (get_local $3)
     (get_local $4)
    )
   )
  )
  (get_local $5)
 )
 (func $strlen (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (set_local $2
   (get_local $0)
  )
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.eqz
      (i32.and
       (get_local $0)
       (i32.const 3)
      )
     )
    )
    (set_local $2
     (get_local $0)
    )
    (loop $label$2
     (br_if $label$0
      (i32.eqz
       (i32.load8_u
        (get_local $2)
       )
      )
     )
     (br_if $label$2
      (i32.and
       (tee_local $2
        (i32.add
         (get_local $2)
         (i32.const 1)
        )
       )
       (i32.const 3)
      )
     )
    )
   )
   (set_local $2
    (i32.add
     (get_local $2)
     (i32.const -4)
    )
   )
   (loop $label$3
    (br_if $label$3
     (i32.eqz
      (i32.and
       (i32.and
        (i32.xor
         (tee_local $1
          (i32.load
           (tee_local $2
            (i32.add
             (get_local $2)
             (i32.const 4)
            )
           )
          )
         )
         (i32.const -1)
        )
        (i32.add
         (get_local $1)
         (i32.const -16843009)
        )
       )
       (i32.const -2139062144)
      )
     )
    )
   )
   (br_if $label$0
    (i32.eqz
     (i32.and
      (get_local $1)
      (i32.const 255)
     )
    )
   )
   (loop $label$4
    (br_if $label$4
     (i32.load8_u
      (tee_local $2
       (i32.add
        (get_local $2)
        (i32.const 1)
       )
      )
     )
    )
   )
  )
  (i32.sub
   (get_local $2)
   (get_local $0)
  )
 )
 (func $__wasm_nullptr (type $FUNCSIG$v)
  (unreachable)
 )
)
