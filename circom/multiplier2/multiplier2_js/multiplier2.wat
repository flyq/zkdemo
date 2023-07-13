(module(import "runtime" "exceptionHandler" (func $exceptionHandler (type $_t_i32)))
(import "runtime" "printErrorMessage" (func $printErrorMessage (type $_t_void)))
(import "runtime" "writeBufferMessage" (func $writeBufferMessage (type $_t_void)))
(import "runtime" "showSharedRWMemory" (func $showSharedRWMemory (type $_t_void)))
(memory 11)
(type $_sig_i32i32 (func  (param i32 i32)))
(type $_sig_i32 (func  (param i32)))
(type $_sig_i32ri32 (func  (param i32) (result i32)))
(type $_sig_i32i32ri32 (func  (param i32 i32) (result i32)))
(type $_sig_i32i32i32ri32 (func  (param i32 i32 i32) (result i32)))
(type $_sig_i32i32i32 (func  (param i32 i32 i32)))
(type $_sig_i32i64i32 (func  (param i32 i64 i32)))
(type $_sig_i32i64 (func  (param i32 i64)))
(type $_sig_i32i32i32i32 (func  (param i32 i32 i32 i32)))
(type $_sig_i64i64ri64 (func  (param i64 i64) (result i64)))
(type $_sig_i32i32ri64 (func  (param i32 i32) (result i64)))
(type $_t_void (func ))
(type $_t_ri32 (func  (result i32)))
(type $_t_i32 (func  (param i32)))
(type $_t_i32ri32 (func  (param i32) (result i32)))
(type $_t_i64ri32 (func  (param i64) (result i32)))
(type $_t_i32i32 (func  (param i32 i32)))
(type $_t_i32i32ri32 (func  (param i32 i32) (result i32)))
(type $_t_i32i32i32  (func  (param i32 i32 i32)))
(export "memory" (memory 0))
(export "getVersion" (func $getVersion))
(export "getMinorVersion" (func $getMinorVersion))
(export "getPatchVersion" (func $getPatchVersion))
(export "getSharedRWMemoryStart" (func $getSharedRWMemoryStart))
(export "readSharedRWMemory" (func $readSharedRWMemory))
(export "writeSharedRWMemory" (func $writeSharedRWMemory))
(export "init" (func $init))
(export "setInputSignal" (func $setInputSignal))
(export "getInputSignalSize" (func $getInputSignalSize))
(export "getRawPrime" (func $getRawPrime))
(export "getFieldNumLen32" (func $getFieldNumLen32))
(export "getWitnessSize" (func $getWitnessSize))
(export "getInputSize" (func $getInputSize))
(export "getWitness" (func $getWitness))
(export "getMessageChar" (func $getMessageChar))
(func $Fr_int_copy (type $_sig_i32i32)
 (param $px i32)
 (param $pr i32)
get_local $pr
get_local $px
i64.load
i64.store
get_local $pr
get_local $px
i64.load offset=8
i64.store offset=8
get_local $pr
get_local $px
i64.load offset=16
i64.store offset=16
get_local $pr
get_local $px
i64.load offset=24
i64.store offset=24
)
(func $Fr_int_zero (type $_sig_i32)
 (param $pr i32)
get_local $pr
i64.const 0
i64.store
get_local $pr
i64.const 0
i64.store offset=8
get_local $pr
i64.const 0
i64.store offset=16
get_local $pr
i64.const 0
i64.store offset=24
)
(func $Fr_int_isZero (type $_sig_i32ri32)
 (param $px i32)
(result i32)
get_local $px
i64.load offset=24
i64.eqz
if
get_local $px
i64.load offset=16
i64.eqz
if
get_local $px
i64.load offset=8
i64.eqz
if
get_local $px
i64.load
i64.eqz
return
else
i32.const 0
return
end
else
i32.const 0
return
end
else
i32.const 0
return
end
i32.const 0
return
)
(func $Fr_int_one (type $_sig_i32)
 (param $pr i32)
get_local $pr
i64.const 1
i64.store
get_local $pr
i64.const 0
i64.store offset=8
get_local $pr
i64.const 0
i64.store offset=16
get_local $pr
i64.const 0
i64.store offset=24
)
(func $Fr_int_eq (type $_sig_i32i32ri32)
 (param $px i32)
 (param $py i32)
(result i32)
get_local $px
i64.load offset=24
get_local $py
i64.load offset=24
i64.eq
if
get_local $px
i64.load offset=16
get_local $py
i64.load offset=16
i64.eq
if
get_local $px
i64.load offset=8
get_local $py
i64.load offset=8
i64.eq
if
get_local $px
i64.load
get_local $py
i64.load
i64.eq
return
else
i32.const 0
return
end
else
i32.const 0
return
end
else
i32.const 0
return
end
i32.const 0
return
)
(func $Fr_int_gt (type $_sig_i32i32ri32)
 (param $px i32)
 (param $py i32)
(result i32)
get_local $px
i64.load offset=24
get_local $py
i64.load offset=24
i64.lt_u
if
i32.const 0
return
else
get_local $px
i64.load offset=24
get_local $py
i64.load offset=24
i64.gt_u
if
i32.const 1
return
else
get_local $px
i64.load offset=16
get_local $py
i64.load offset=16
i64.lt_u
if
i32.const 0
return
else
get_local $px
i64.load offset=16
get_local $py
i64.load offset=16
i64.gt_u
if
i32.const 1
return
else
get_local $px
i64.load offset=8
get_local $py
i64.load offset=8
i64.lt_u
if
i32.const 0
return
else
get_local $px
i64.load offset=8
get_local $py
i64.load offset=8
i64.gt_u
if
i32.const 1
return
else
get_local $px
i64.load
get_local $py
i64.load
i64.gt_u
return
end
end
end
end
end
end
i32.const 0
return
)
(func $Fr_int_gte (type $_sig_i32i32ri32)
 (param $px i32)
 (param $py i32)
(result i32)
get_local $px
i64.load offset=24
get_local $py
i64.load offset=24
i64.lt_u
if
i32.const 0
return
else
get_local $px
i64.load offset=24
get_local $py
i64.load offset=24
i64.gt_u
if
i32.const 1
return
else
get_local $px
i64.load offset=16
get_local $py
i64.load offset=16
i64.lt_u
if
i32.const 0
return
else
get_local $px
i64.load offset=16
get_local $py
i64.load offset=16
i64.gt_u
if
i32.const 1
return
else
get_local $px
i64.load offset=8
get_local $py
i64.load offset=8
i64.lt_u
if
i32.const 0
return
else
get_local $px
i64.load offset=8
get_local $py
i64.load offset=8
i64.gt_u
if
i32.const 1
return
else
get_local $px
i64.load
get_local $py
i64.load
i64.ge_u
return
end
end
end
end
end
end
i32.const 0
return
)
(func $Fr_int_add (type $_sig_i32i32i32ri32)
 (param $x i32)
 (param $y i32)
 (param $r i32)
(result i32)
 (local $c i64)
get_local $x
i64.load32_u
get_local $y
i64.load32_u
i64.add
set_local $c
get_local $r
get_local $c
i64.store32
get_local $x
i64.load32_u offset=4
get_local $y
i64.load32_u offset=4
i64.add
get_local $c
i64.const 32
i64.shr_u
i64.add
set_local $c
get_local $r
get_local $c
i64.store32 offset=4
get_local $x
i64.load32_u offset=8
get_local $y
i64.load32_u offset=8
i64.add
get_local $c
i64.const 32
i64.shr_u
i64.add
set_local $c
get_local $r
get_local $c
i64.store32 offset=8
get_local $x
i64.load32_u offset=12
get_local $y
i64.load32_u offset=12
i64.add
get_local $c
i64.const 32
i64.shr_u
i64.add
set_local $c
get_local $r
get_local $c
i64.store32 offset=12
get_local $x
i64.load32_u offset=16
get_local $y
i64.load32_u offset=16
i64.add
get_local $c
i64.const 32
i64.shr_u
i64.add
set_local $c
get_local $r
get_local $c
i64.store32 offset=16
get_local $x
i64.load32_u offset=20
get_local $y
i64.load32_u offset=20
i64.add
get_local $c
i64.const 32
i64.shr_u
i64.add
set_local $c
get_local $r
get_local $c
i64.store32 offset=20
get_local $x
i64.load32_u offset=24
get_local $y
i64.load32_u offset=24
i64.add
get_local $c
i64.const 32
i64.shr_u
i64.add
set_local $c
get_local $r
get_local $c
i64.store32 offset=24
get_local $x
i64.load32_u offset=28
get_local $y
i64.load32_u offset=28
i64.add
get_local $c
i64.const 32
i64.shr_u
i64.add
set_local $c
get_local $r
get_local $c
i64.store32 offset=28
get_local $c
i64.const 32
i64.shr_u
i32.wrap/i64
)
(func $Fr_int_sub (type $_sig_i32i32i32ri32)
 (param $x i32)
 (param $y i32)
 (param $r i32)
(result i32)
 (local $c i64)
get_local $x
i64.load32_u
get_local $y
i64.load32_u
i64.sub
set_local $c
get_local $r
get_local $c
i64.const 0xFFFFFFFF
i64.and
i64.store32
get_local $x
i64.load32_u offset=4
get_local $y
i64.load32_u offset=4
i64.sub
get_local $c
i64.const 32
i64.shr_s
i64.add
set_local $c
get_local $r
get_local $c
i64.const 0xFFFFFFFF
i64.and
i64.store32 offset=4
get_local $x
i64.load32_u offset=8
get_local $y
i64.load32_u offset=8
i64.sub
get_local $c
i64.const 32
i64.shr_s
i64.add
set_local $c
get_local $r
get_local $c
i64.const 0xFFFFFFFF
i64.and
i64.store32 offset=8
get_local $x
i64.load32_u offset=12
get_local $y
i64.load32_u offset=12
i64.sub
get_local $c
i64.const 32
i64.shr_s
i64.add
set_local $c
get_local $r
get_local $c
i64.const 0xFFFFFFFF
i64.and
i64.store32 offset=12
get_local $x
i64.load32_u offset=16
get_local $y
i64.load32_u offset=16
i64.sub
get_local $c
i64.const 32
i64.shr_s
i64.add
set_local $c
get_local $r
get_local $c
i64.const 0xFFFFFFFF
i64.and
i64.store32 offset=16
get_local $x
i64.load32_u offset=20
get_local $y
i64.load32_u offset=20
i64.sub
get_local $c
i64.const 32
i64.shr_s
i64.add
set_local $c
get_local $r
get_local $c
i64.const 0xFFFFFFFF
i64.and
i64.store32 offset=20
get_local $x
i64.load32_u offset=24
get_local $y
i64.load32_u offset=24
i64.sub
get_local $c
i64.const 32
i64.shr_s
i64.add
set_local $c
get_local $r
get_local $c
i64.const 0xFFFFFFFF
i64.and
i64.store32 offset=24
get_local $x
i64.load32_u offset=28
get_local $y
i64.load32_u offset=28
i64.sub
get_local $c
i64.const 32
i64.shr_s
i64.add
set_local $c
get_local $r
get_local $c
i64.const 0xFFFFFFFF
i64.and
i64.store32 offset=28
get_local $c
i64.const 32
i64.shr_s
i32.wrap/i64
)
(func $Fr_int_mul (type $_sig_i32i32i32)
 (param $x i32)
 (param $y i32)
 (param $r i32)
 (local $c0 i64)
 (local $c1 i64)
 (local $x0 i64)
 (local $y0 i64)
 (local $x1 i64)
 (local $y1 i64)
 (local $x2 i64)
 (local $y2 i64)
 (local $x3 i64)
 (local $y3 i64)
 (local $x4 i64)
 (local $y4 i64)
 (local $x5 i64)
 (local $y5 i64)
 (local $x6 i64)
 (local $y6 i64)
 (local $x7 i64)
 (local $y7 i64)
get_local $c0
i64.const 4294967295
i64.and
get_local $x
i64.load32_u
tee_local $x0
get_local $y
i64.load32_u
tee_local $y0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32
get_local $c1
i64.const 32
i64.shr_u
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x0
get_local $y
i64.load32_u offset=4
tee_local $y1
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x
i64.load32_u offset=4
tee_local $x1
get_local $y0
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $r
get_local $c1
i64.store32 offset=4
get_local $c0
i64.const 32
i64.shr_u
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $y
i64.load32_u offset=8
tee_local $y2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $y1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x
i64.load32_u offset=8
tee_local $x2
get_local $y0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=8
get_local $c1
i64.const 32
i64.shr_u
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x0
get_local $y
i64.load32_u offset=12
tee_local $y3
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x1
get_local $y2
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x2
get_local $y1
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x
i64.load32_u offset=12
tee_local $x3
get_local $y0
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $r
get_local $c1
i64.store32 offset=12
get_local $c0
i64.const 32
i64.shr_u
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $y
i64.load32_u offset=16
tee_local $y4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $y3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x2
get_local $y2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x3
get_local $y1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x
i64.load32_u offset=16
tee_local $x4
get_local $y0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=16
get_local $c1
i64.const 32
i64.shr_u
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x0
get_local $y
i64.load32_u offset=20
tee_local $y5
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x1
get_local $y4
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x2
get_local $y3
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x3
get_local $y2
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x4
get_local $y1
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x
i64.load32_u offset=20
tee_local $x5
get_local $y0
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $r
get_local $c1
i64.store32 offset=20
get_local $c0
i64.const 32
i64.shr_u
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $y
i64.load32_u offset=24
tee_local $y6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $y5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x2
get_local $y4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x3
get_local $y3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x4
get_local $y2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x5
get_local $y1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x
i64.load32_u offset=24
tee_local $x6
get_local $y0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=24
get_local $c1
i64.const 32
i64.shr_u
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x0
get_local $y
i64.load32_u offset=28
tee_local $y7
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x1
get_local $y6
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x2
get_local $y5
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x3
get_local $y4
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x4
get_local $y3
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x5
get_local $y2
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x6
get_local $y1
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x
i64.load32_u offset=28
tee_local $x7
get_local $y0
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $r
get_local $c1
i64.store32 offset=28
get_local $c0
i64.const 32
i64.shr_u
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $y7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x2
get_local $y6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x3
get_local $y5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x4
get_local $y4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x5
get_local $y3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x6
get_local $y2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x7
get_local $y1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=32
get_local $c1
i64.const 32
i64.shr_u
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x2
get_local $y7
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x3
get_local $y6
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x4
get_local $y5
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x5
get_local $y4
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x6
get_local $y3
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x7
get_local $y2
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $r
get_local $c1
i64.store32 offset=36
get_local $c0
i64.const 32
i64.shr_u
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x3
get_local $y7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x4
get_local $y6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x5
get_local $y5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x6
get_local $y4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x7
get_local $y3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=40
get_local $c1
i64.const 32
i64.shr_u
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x4
get_local $y7
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x5
get_local $y6
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x6
get_local $y5
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x7
get_local $y4
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $r
get_local $c1
i64.store32 offset=44
get_local $c0
i64.const 32
i64.shr_u
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x5
get_local $y7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x6
get_local $y6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x7
get_local $y5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=48
get_local $c1
i64.const 32
i64.shr_u
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x6
get_local $y7
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x7
get_local $y6
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $r
get_local $c1
i64.store32 offset=52
get_local $c0
i64.const 32
i64.shr_u
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x7
get_local $y7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=56
get_local $c1
i64.const 32
i64.shr_u
set_local $c0
get_local $r
get_local $c1
i64.store32 offset=60
)
(func $Fr_int_square (type $_sig_i32i32)
 (param $x i32)
 (param $r i32)
 (local $c0 i64)
 (local $c1 i64)
 (local $c0_old i64)
 (local $c1_old i64)
 (local $x0 i64)
 (local $x1 i64)
 (local $x2 i64)
 (local $x3 i64)
 (local $x4 i64)
 (local $x5 i64)
 (local $x6 i64)
 (local $x7 i64)
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x
i64.load32_u
tee_local $x0
get_local $x0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $x
i64.load32_u offset=4
tee_local $x1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=4
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $x
i64.load32_u offset=8
tee_local $x2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $x1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=8
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $x
i64.load32_u offset=12
tee_local $x3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $x2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=12
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $x
i64.load32_u offset=16
tee_local $x4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $x3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x2
get_local $x2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=16
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $x
i64.load32_u offset=20
tee_local $x5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $x4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x2
get_local $x3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=20
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $x
i64.load32_u offset=24
tee_local $x6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $x5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x2
get_local $x4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x3
get_local $x3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=24
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $x
i64.load32_u offset=28
tee_local $x7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $x6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x2
get_local $x5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x3
get_local $x4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=28
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $x7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x2
get_local $x6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x3
get_local $x5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x4
get_local $x4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=32
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x2
get_local $x7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x3
get_local $x6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x4
get_local $x5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=36
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x3
get_local $x7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x4
get_local $x6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x5
get_local $x5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=40
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x4
get_local $x7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x5
get_local $x6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=44
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x5
get_local $x7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x6
get_local $x6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=48
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x6
get_local $x7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=52
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x7
get_local $x7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=56
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
get_local $r
get_local $c0_old
i64.store32 offset=60
)
(func $Fr_int_squareOld (type $_sig_i32i32)
 (param $x i32)
 (param $r i32)
get_local $x
get_local $x
get_local $r
call $Fr_int_mul
)
(func $Fr_int__mul1 (type $_sig_i32i64i32)
 (param $px i32)
 (param $y i64)
 (param $pr i32)
 (local $c i64)
get_local $px
i64.load32_u align=1
get_local $y
i64.mul
set_local $c
get_local $pr
get_local $c
i64.store32 align=1
get_local $px
i64.load32_u offset=4 align=1
get_local $y
i64.mul
get_local $c
i64.const 32
i64.shr_u
i64.add
set_local $c
get_local $pr
get_local $c
i64.store32 offset=4 align=1
get_local $px
i64.load32_u offset=8 align=1
get_local $y
i64.mul
get_local $c
i64.const 32
i64.shr_u
i64.add
set_local $c
get_local $pr
get_local $c
i64.store32 offset=8 align=1
get_local $px
i64.load32_u offset=12 align=1
get_local $y
i64.mul
get_local $c
i64.const 32
i64.shr_u
i64.add
set_local $c
get_local $pr
get_local $c
i64.store32 offset=12 align=1
get_local $px
i64.load32_u offset=16 align=1
get_local $y
i64.mul
get_local $c
i64.const 32
i64.shr_u
i64.add
set_local $c
get_local $pr
get_local $c
i64.store32 offset=16 align=1
get_local $px
i64.load32_u offset=20 align=1
get_local $y
i64.mul
get_local $c
i64.const 32
i64.shr_u
i64.add
set_local $c
get_local $pr
get_local $c
i64.store32 offset=20 align=1
get_local $px
i64.load32_u offset=24 align=1
get_local $y
i64.mul
get_local $c
i64.const 32
i64.shr_u
i64.add
set_local $c
get_local $pr
get_local $c
i64.store32 offset=24 align=1
get_local $px
i64.load32_u offset=28 align=1
get_local $y
i64.mul
get_local $c
i64.const 32
i64.shr_u
i64.add
set_local $c
get_local $pr
get_local $c
i64.store32 offset=28 align=1
)
(func $Fr_int__add1 (type $_sig_i32i64)
 (param $x i32)
 (param $y i64)
 (local $c i64)
 (local $px i32)
get_local $x
set_local $px
get_local $px
i64.load32_u align=1
get_local $y
i64.add
set_local $c
get_local $px
get_local $c
i64.store32 align=1
get_local $c
i64.const 32
i64.shr_u
set_local $c
block
loop
get_local $c
i64.eqz
br_if 1
get_local $px
i32.const 4
i32.add
set_local $px
get_local $px
i64.load32_u align=1
get_local $c
i64.add
set_local $c
get_local $px
get_local $c
i64.store32 align=1
get_local $c
i64.const 32
i64.shr_u
set_local $c
br 0
end
end
)
(func $Fr_int_div (type $_sig_i32i32i32i32)
 (param $x i32)
 (param $y i32)
 (param $c i32)
 (param $r i32)
 (local $rr i32)
 (local $cc i32)
 (local $eX i32)
 (local $eY i32)
 (local $sy i64)
 (local $sx i64)
 (local $ec i32)
get_local $c
if
get_local $c
set_local $cc
else
i32.const 192
set_local $cc
end
get_local $r
if
get_local $r
set_local $rr
else
i32.const 224
set_local $rr
end
get_local $x
get_local $rr
call $Fr_int_copy
get_local $y
i32.const 160
call $Fr_int_copy
get_local $cc
call $Fr_int_zero
i32.const 256
call $Fr_int_zero
i32.const 31
set_local $eX
i32.const 31
set_local $eY
block
loop
i32.const 160
get_local $eY
i32.add
i32.load8_u
get_local $eY
i32.const 3
i32.eq
i32.or
br_if 1
get_local $eY
i32.const 1
i32.sub
set_local $eY
br 0
end
end
i32.const 160
get_local $eY
i32.add
i32.const 3
i32.sub
i64.load32_u align=1
i64.const 1
i64.add
set_local $sy
get_local $sy
i64.const 1
i64.eq
if
i64.const 0
i64.const 0
i64.div_u
drop
end
block
loop
block
loop
get_local $rr
get_local $eX
i32.add
i32.load8_u
get_local $eX
i32.const 7
i32.eq
i32.or
br_if 1
get_local $eX
i32.const 1
i32.sub
set_local $eX
br 0
end
end
get_local $rr
get_local $eX
i32.add
i32.const 7
i32.sub
i64.load align=1
set_local $sx
get_local $sx
get_local $sy
i64.div_u
set_local $sx
get_local $eX
get_local $eY
i32.sub
i32.const 4
i32.sub
set_local $ec
block
loop
get_local $sx
i64.const 0xFFFFFFFF00000000
i64.and
i64.eqz
get_local $ec
i32.const 0
i32.ge_s
i32.and
br_if 1
get_local $sx
i64.const 8
i64.shr_u
set_local $sx
get_local $ec
i32.const 1
i32.add
set_local $ec
br 0
end
end
get_local $sx
i64.eqz
if
get_local $rr
i32.const 160
call $Fr_int_gte
i32.eqz
br_if 2
i64.const 1
set_local $sx
i32.const 0
set_local $ec
end
i32.const 160
get_local $sx
i32.const 288
call $Fr_int__mul1
get_local $rr
i32.const 288
get_local $ec
i32.sub
get_local $rr
call $Fr_int_sub
drop
get_local $cc
get_local $ec
i32.add
get_local $sx
call $Fr_int__add1
br 0
end
end
)
(func $Fr_int_inverseMod (type $_sig_i32i32i32)
 (param $px i32)
 (param $pm i32)
 (param $pr i32)
 (local $t i32)
 (local $newt i32)
 (local $r i32)
 (local $qq i32)
 (local $qr i32)
 (local $newr i32)
 (local $swp i32)
 (local $x i32)
 (local $signt i32)
 (local $signnewt i32)
 (local $signx i32)
i32.const 320
set_local $t
i32.const 320
call $Fr_int_zero
i32.const 0
set_local $signt
i32.const 352
set_local $r
get_local $pm
i32.const 352
call $Fr_int_copy
i32.const 384
set_local $newt
i32.const 384
call $Fr_int_one
i32.const 0
set_local $signnewt
i32.const 416
set_local $newr
get_local $px
i32.const 416
call $Fr_int_copy
i32.const 448
set_local $qq
i32.const 480
set_local $qr
i32.const 576
set_local $x
block
loop
get_local $newr
call $Fr_int_isZero
br_if 1
get_local $r
get_local $newr
get_local $qq
get_local $qr
call $Fr_int_div
get_local $qq
get_local $newt
i32.const 512
call $Fr_int_mul
get_local $signt
if
get_local $signnewt
if
i32.const 512
get_local $t
call $Fr_int_gte
if
i32.const 512
get_local $t
get_local $x
call $Fr_int_sub
drop
i32.const 0
set_local $signx
else
get_local $t
i32.const 512
get_local $x
call $Fr_int_sub
drop
i32.const 1
set_local $signx
end
else
i32.const 512
get_local $t
get_local $x
call $Fr_int_add
drop
i32.const 1
set_local $signx
end
else
get_local $signnewt
if
i32.const 512
get_local $t
get_local $x
call $Fr_int_add
drop
i32.const 0
set_local $signx
else
get_local $t
i32.const 512
call $Fr_int_gte
if
get_local $t
i32.const 512
get_local $x
call $Fr_int_sub
drop
i32.const 0
set_local $signx
else
i32.const 512
get_local $t
get_local $x
call $Fr_int_sub
drop
i32.const 1
set_local $signx
end
end
end
get_local $t
set_local $swp
get_local $newt
set_local $t
get_local $x
set_local $newt
get_local $swp
set_local $x
get_local $signnewt
set_local $signt
get_local $signx
set_local $signnewt
get_local $r
set_local $swp
get_local $newr
set_local $r
get_local $qr
set_local $newr
get_local $swp
set_local $qr
br 0
end
end
get_local $signt
if
get_local $pm
get_local $t
get_local $pr
call $Fr_int_sub
drop
else
get_local $t
get_local $pr
call $Fr_int_copy
end
)
(func $Fr_F1m_add (type $_sig_i32i32i32)
 (param $x i32)
 (param $y i32)
 (param $r i32)
get_local $x
get_local $y
get_local $r
call $Fr_int_add
if
get_local $r
i32.const 608
get_local $r
call $Fr_int_sub
drop
else
get_local $r
i32.const 608
call $Fr_int_gte
if
get_local $r
i32.const 608
get_local $r
call $Fr_int_sub
drop
end
end
)
(func $Fr_F1m_sub (type $_sig_i32i32i32)
 (param $x i32)
 (param $y i32)
 (param $r i32)
get_local $x
get_local $y
get_local $r
call $Fr_int_sub
if
get_local $r
i32.const 608
get_local $r
call $Fr_int_add
drop
end
)
(func $Fr_F1m_neg (type $_sig_i32i32)
 (param $x i32)
 (param $r i32)
i32.const 768
get_local $x
get_local $r
call $Fr_F1m_sub
)
(func $Fr_F1m_mReduct (type $_sig_i32i32)
 (param $t i32)
 (param $r i32)
 (local $np32 i64)
 (local $c i64)
 (local $m i64)
i64.const 4026531839
set_local $np32
i64.const 0
set_local $c
get_local $t
i64.load32_u
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m
get_local $t
i64.load32_u
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32
get_local $t
i64.load32_u offset=4
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=4
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=4
get_local $t
i64.load32_u offset=8
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=8
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=8
get_local $t
i64.load32_u offset=12
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=12
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=12
get_local $t
i64.load32_u offset=16
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=16
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=16
get_local $t
i64.load32_u offset=20
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=20
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=20
get_local $t
i64.load32_u offset=24
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=24
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=24
get_local $t
i64.load32_u offset=28
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=28
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=28
i32.const 992
get_local $c
i64.const 32
i64.shr_u
i64.store32
i64.const 0
set_local $c
get_local $t
i64.load32_u offset=4
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m
get_local $t
i64.load32_u offset=4
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=4
get_local $t
i64.load32_u offset=8
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=4
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=8
get_local $t
i64.load32_u offset=12
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=8
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=12
get_local $t
i64.load32_u offset=16
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=12
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=16
get_local $t
i64.load32_u offset=20
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=16
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=20
get_local $t
i64.load32_u offset=24
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=20
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=24
get_local $t
i64.load32_u offset=28
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=24
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=28
get_local $t
i64.load32_u offset=32
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=28
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=32
i32.const 992
get_local $c
i64.const 32
i64.shr_u
i64.store32 offset=4
i64.const 0
set_local $c
get_local $t
i64.load32_u offset=8
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m
get_local $t
i64.load32_u offset=8
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=8
get_local $t
i64.load32_u offset=12
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=4
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=12
get_local $t
i64.load32_u offset=16
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=8
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=16
get_local $t
i64.load32_u offset=20
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=12
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=20
get_local $t
i64.load32_u offset=24
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=16
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=24
get_local $t
i64.load32_u offset=28
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=20
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=28
get_local $t
i64.load32_u offset=32
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=24
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=32
get_local $t
i64.load32_u offset=36
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=28
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=36
i32.const 992
get_local $c
i64.const 32
i64.shr_u
i64.store32 offset=8
i64.const 0
set_local $c
get_local $t
i64.load32_u offset=12
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m
get_local $t
i64.load32_u offset=12
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=12
get_local $t
i64.load32_u offset=16
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=4
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=16
get_local $t
i64.load32_u offset=20
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=8
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=20
get_local $t
i64.load32_u offset=24
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=12
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=24
get_local $t
i64.load32_u offset=28
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=16
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=28
get_local $t
i64.load32_u offset=32
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=20
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=32
get_local $t
i64.load32_u offset=36
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=24
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=36
get_local $t
i64.load32_u offset=40
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=28
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=40
i32.const 992
get_local $c
i64.const 32
i64.shr_u
i64.store32 offset=12
i64.const 0
set_local $c
get_local $t
i64.load32_u offset=16
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m
get_local $t
i64.load32_u offset=16
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=16
get_local $t
i64.load32_u offset=20
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=4
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=20
get_local $t
i64.load32_u offset=24
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=8
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=24
get_local $t
i64.load32_u offset=28
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=12
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=28
get_local $t
i64.load32_u offset=32
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=16
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=32
get_local $t
i64.load32_u offset=36
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=20
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=36
get_local $t
i64.load32_u offset=40
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=24
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=40
get_local $t
i64.load32_u offset=44
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=28
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=44
i32.const 992
get_local $c
i64.const 32
i64.shr_u
i64.store32 offset=16
i64.const 0
set_local $c
get_local $t
i64.load32_u offset=20
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m
get_local $t
i64.load32_u offset=20
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=20
get_local $t
i64.load32_u offset=24
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=4
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=24
get_local $t
i64.load32_u offset=28
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=8
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=28
get_local $t
i64.load32_u offset=32
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=12
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=32
get_local $t
i64.load32_u offset=36
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=16
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=36
get_local $t
i64.load32_u offset=40
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=20
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=40
get_local $t
i64.load32_u offset=44
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=24
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=44
get_local $t
i64.load32_u offset=48
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=28
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=48
i32.const 992
get_local $c
i64.const 32
i64.shr_u
i64.store32 offset=20
i64.const 0
set_local $c
get_local $t
i64.load32_u offset=24
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m
get_local $t
i64.load32_u offset=24
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=24
get_local $t
i64.load32_u offset=28
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=4
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=28
get_local $t
i64.load32_u offset=32
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=8
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=32
get_local $t
i64.load32_u offset=36
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=12
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=36
get_local $t
i64.load32_u offset=40
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=16
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=40
get_local $t
i64.load32_u offset=44
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=20
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=44
get_local $t
i64.load32_u offset=48
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=24
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=48
get_local $t
i64.load32_u offset=52
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=28
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=52
i32.const 992
get_local $c
i64.const 32
i64.shr_u
i64.store32 offset=24
i64.const 0
set_local $c
get_local $t
i64.load32_u offset=28
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m
get_local $t
i64.load32_u offset=28
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=28
get_local $t
i64.load32_u offset=32
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=4
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=32
get_local $t
i64.load32_u offset=36
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=8
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=36
get_local $t
i64.load32_u offset=40
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=12
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=40
get_local $t
i64.load32_u offset=44
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=16
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=44
get_local $t
i64.load32_u offset=48
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=20
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=48
get_local $t
i64.load32_u offset=52
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=24
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=52
get_local $t
i64.load32_u offset=56
get_local $c
i64.const 32
i64.shr_u
i64.add
i32.const 608
i64.load32_u offset=28
get_local $m
i64.mul
i64.add
set_local $c
get_local $t
get_local $c
i64.store32 offset=56
i32.const 992
get_local $c
i64.const 32
i64.shr_u
i64.store32 offset=28
i32.const 992
get_local $t
i32.const 32
i32.add
get_local $r
call $Fr_F1m_add
)
(func $Fr_F1m_mul (type $_sig_i32i32i32)
 (param $x i32)
 (param $y i32)
 (param $r i32)
 (local $c0 i64)
 (local $c1 i64)
 (local $np32 i64)
 (local $x0 i64)
 (local $y0 i64)
 (local $m0 i64)
 (local $q0 i64)
 (local $x1 i64)
 (local $y1 i64)
 (local $m1 i64)
 (local $q1 i64)
 (local $x2 i64)
 (local $y2 i64)
 (local $m2 i64)
 (local $q2 i64)
 (local $x3 i64)
 (local $y3 i64)
 (local $m3 i64)
 (local $q3 i64)
 (local $x4 i64)
 (local $y4 i64)
 (local $m4 i64)
 (local $q4 i64)
 (local $x5 i64)
 (local $y5 i64)
 (local $m5 i64)
 (local $q5 i64)
 (local $x6 i64)
 (local $y6 i64)
 (local $m6 i64)
 (local $q6 i64)
 (local $x7 i64)
 (local $y7 i64)
 (local $m7 i64)
 (local $q7 i64)
i64.const 4026531839
set_local $np32
get_local $c0
i64.const 4294967295
i64.and
get_local $x
i64.load32_u
tee_local $x0
get_local $y
i64.load32_u
tee_local $y0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m0
get_local $c0
i64.const 4294967295
i64.and
i32.const 0
i64.load32_u offset=608
tee_local $q0
get_local $m0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c1
i64.const 32
i64.shr_u
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x0
get_local $y
i64.load32_u offset=4
tee_local $y1
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x
i64.load32_u offset=4
tee_local $x1
get_local $y0
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
i32.const 0
i64.load32_u offset=612
tee_local $q1
get_local $m0
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m1
get_local $c1
i64.const 4294967295
i64.and
get_local $q0
get_local $m1
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c0
i64.const 32
i64.shr_u
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $y
i64.load32_u offset=8
tee_local $y2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $y1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x
i64.load32_u offset=8
tee_local $x2
get_local $y0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q1
get_local $m1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i32.const 0
i64.load32_u offset=616
tee_local $q2
get_local $m0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m2
get_local $c0
i64.const 4294967295
i64.and
get_local $q0
get_local $m2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c1
i64.const 32
i64.shr_u
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x0
get_local $y
i64.load32_u offset=12
tee_local $y3
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x1
get_local $y2
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x2
get_local $y1
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x
i64.load32_u offset=12
tee_local $x3
get_local $y0
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q1
get_local $m2
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q2
get_local $m1
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
i32.const 0
i64.load32_u offset=620
tee_local $q3
get_local $m0
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m3
get_local $c1
i64.const 4294967295
i64.and
get_local $q0
get_local $m3
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c0
i64.const 32
i64.shr_u
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $y
i64.load32_u offset=16
tee_local $y4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $y3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x2
get_local $y2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x3
get_local $y1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x
i64.load32_u offset=16
tee_local $x4
get_local $y0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q1
get_local $m3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q2
get_local $m2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q3
get_local $m1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i32.const 0
i64.load32_u offset=624
tee_local $q4
get_local $m0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m4
get_local $c0
i64.const 4294967295
i64.and
get_local $q0
get_local $m4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c1
i64.const 32
i64.shr_u
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x0
get_local $y
i64.load32_u offset=20
tee_local $y5
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x1
get_local $y4
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x2
get_local $y3
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x3
get_local $y2
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x4
get_local $y1
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x
i64.load32_u offset=20
tee_local $x5
get_local $y0
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q1
get_local $m4
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q2
get_local $m3
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q3
get_local $m2
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q4
get_local $m1
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
i32.const 0
i64.load32_u offset=628
tee_local $q5
get_local $m0
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m5
get_local $c1
i64.const 4294967295
i64.and
get_local $q0
get_local $m5
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c0
i64.const 32
i64.shr_u
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $y
i64.load32_u offset=24
tee_local $y6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $y5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x2
get_local $y4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x3
get_local $y3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x4
get_local $y2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x5
get_local $y1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x
i64.load32_u offset=24
tee_local $x6
get_local $y0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q1
get_local $m5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q2
get_local $m4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q3
get_local $m3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q4
get_local $m2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q5
get_local $m1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i32.const 0
i64.load32_u offset=632
tee_local $q6
get_local $m0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m6
get_local $c0
i64.const 4294967295
i64.and
get_local $q0
get_local $m6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c1
i64.const 32
i64.shr_u
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x0
get_local $y
i64.load32_u offset=28
tee_local $y7
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x1
get_local $y6
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x2
get_local $y5
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x3
get_local $y4
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x4
get_local $y3
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x5
get_local $y2
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x6
get_local $y1
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x
i64.load32_u offset=28
tee_local $x7
get_local $y0
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q1
get_local $m6
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q2
get_local $m5
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q3
get_local $m4
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q4
get_local $m3
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q5
get_local $m2
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q6
get_local $m1
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
i32.const 0
i64.load32_u offset=636
tee_local $q7
get_local $m0
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m7
get_local $c1
i64.const 4294967295
i64.and
get_local $q0
get_local $m7
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c0
i64.const 32
i64.shr_u
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $y7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x2
get_local $y6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x3
get_local $y5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x4
get_local $y4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x5
get_local $y3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x6
get_local $y2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x7
get_local $y1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q1
get_local $m7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q2
get_local $m6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q3
get_local $m5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q4
get_local $m4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q5
get_local $m3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q6
get_local $m2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q7
get_local $m1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32
get_local $c1
i64.const 32
i64.shr_u
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x2
get_local $y7
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x3
get_local $y6
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x4
get_local $y5
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x5
get_local $y4
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x6
get_local $y3
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x7
get_local $y2
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q2
get_local $m7
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q3
get_local $m6
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q4
get_local $m5
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q5
get_local $m4
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q6
get_local $m3
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q7
get_local $m2
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $r
get_local $c1
i64.store32 offset=4
get_local $c0
i64.const 32
i64.shr_u
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x3
get_local $y7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x4
get_local $y6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x5
get_local $y5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x6
get_local $y4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x7
get_local $y3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q3
get_local $m7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q4
get_local $m6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q5
get_local $m5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q6
get_local $m4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q7
get_local $m3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=8
get_local $c1
i64.const 32
i64.shr_u
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x4
get_local $y7
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x5
get_local $y6
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x6
get_local $y5
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x7
get_local $y4
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q4
get_local $m7
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q5
get_local $m6
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q6
get_local $m5
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q7
get_local $m4
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $r
get_local $c1
i64.store32 offset=12
get_local $c0
i64.const 32
i64.shr_u
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x5
get_local $y7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x6
get_local $y6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x7
get_local $y5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q5
get_local $m7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q6
get_local $m6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q7
get_local $m5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=16
get_local $c1
i64.const 32
i64.shr_u
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x6
get_local $y7
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $x7
get_local $y6
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q6
get_local $m7
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $c1
i64.const 4294967295
i64.and
get_local $q7
get_local $m6
i64.mul
i64.add
set_local $c1
get_local $c0
get_local $c1
i64.const 32
i64.shr_u
i64.add
set_local $c0
get_local $r
get_local $c1
i64.store32 offset=20
get_local $c0
i64.const 32
i64.shr_u
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x7
get_local $y7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q7
get_local $m7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=24
get_local $c1
i64.const 32
i64.shr_u
set_local $c0
get_local $r
get_local $c1
i64.store32 offset=28
get_local $c0
i32.wrap/i64
if
get_local $r
i32.const 608
get_local $r
call $Fr_int_sub
drop
else
get_local $r
i32.const 608
call $Fr_int_gte
if
get_local $r
i32.const 608
get_local $r
call $Fr_int_sub
drop
end
end
)
(func $Fr_F1m_square (type $_sig_i32i32)
 (param $x i32)
 (param $r i32)
 (local $c0 i64)
 (local $c1 i64)
 (local $c0_old i64)
 (local $c1_old i64)
 (local $np32 i64)
 (local $x0 i64)
 (local $m0 i64)
 (local $q0 i64)
 (local $x1 i64)
 (local $m1 i64)
 (local $q1 i64)
 (local $x2 i64)
 (local $m2 i64)
 (local $q2 i64)
 (local $x3 i64)
 (local $m3 i64)
 (local $q3 i64)
 (local $x4 i64)
 (local $m4 i64)
 (local $q4 i64)
 (local $x5 i64)
 (local $m5 i64)
 (local $q5 i64)
 (local $x6 i64)
 (local $m6 i64)
 (local $q6 i64)
 (local $x7 i64)
 (local $m7 i64)
 (local $q7 i64)
i64.const 4026531839
set_local $np32
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x
i64.load32_u
tee_local $x0
get_local $x0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m0
get_local $c0
i64.const 4294967295
i64.and
i32.const 0
i64.load32_u offset=608
tee_local $q0
get_local $m0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $x
i64.load32_u offset=4
tee_local $x1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i32.const 0
i64.load32_u offset=612
tee_local $q1
get_local $m0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m1
get_local $c0
i64.const 4294967295
i64.and
get_local $q0
get_local $m1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $x
i64.load32_u offset=8
tee_local $x2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $x1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q1
get_local $m1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i32.const 0
i64.load32_u offset=616
tee_local $q2
get_local $m0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m2
get_local $c0
i64.const 4294967295
i64.and
get_local $q0
get_local $m2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $x
i64.load32_u offset=12
tee_local $x3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $x2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q1
get_local $m2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q2
get_local $m1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i32.const 0
i64.load32_u offset=620
tee_local $q3
get_local $m0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m3
get_local $c0
i64.const 4294967295
i64.and
get_local $q0
get_local $m3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $x
i64.load32_u offset=16
tee_local $x4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $x3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x2
get_local $x2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q1
get_local $m3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q2
get_local $m2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q3
get_local $m1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i32.const 0
i64.load32_u offset=624
tee_local $q4
get_local $m0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m4
get_local $c0
i64.const 4294967295
i64.and
get_local $q0
get_local $m4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $x
i64.load32_u offset=20
tee_local $x5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $x4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x2
get_local $x3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q1
get_local $m4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q2
get_local $m3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q3
get_local $m2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q4
get_local $m1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i32.const 0
i64.load32_u offset=628
tee_local $q5
get_local $m0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m5
get_local $c0
i64.const 4294967295
i64.and
get_local $q0
get_local $m5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $x
i64.load32_u offset=24
tee_local $x6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $x5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x2
get_local $x4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x3
get_local $x3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q1
get_local $m5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q2
get_local $m4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q3
get_local $m3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q4
get_local $m2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q5
get_local $m1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i32.const 0
i64.load32_u offset=632
tee_local $q6
get_local $m0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m6
get_local $c0
i64.const 4294967295
i64.and
get_local $q0
get_local $m6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x0
get_local $x
i64.load32_u offset=28
tee_local $x7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $x6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x2
get_local $x5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x3
get_local $x4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q1
get_local $m6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q2
get_local $m5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q3
get_local $m4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q4
get_local $m3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q5
get_local $m2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q6
get_local $m1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i32.const 0
i64.load32_u offset=636
tee_local $q7
get_local $m0
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $np32
i64.mul
i64.const 0xFFFFFFFF
i64.and
set_local $m7
get_local $c0
i64.const 4294967295
i64.and
get_local $q0
get_local $m7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x1
get_local $x7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x2
get_local $x6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x3
get_local $x5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x4
get_local $x4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q1
get_local $m7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q2
get_local $m6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q3
get_local $m5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q4
get_local $m4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q5
get_local $m3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q6
get_local $m2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q7
get_local $m1
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x2
get_local $x7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x3
get_local $x6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x4
get_local $x5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q2
get_local $m7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q3
get_local $m6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q4
get_local $m5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q5
get_local $m4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q6
get_local $m3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q7
get_local $m2
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=4
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x3
get_local $x7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x4
get_local $x6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x5
get_local $x5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q3
get_local $m7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q4
get_local $m6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q5
get_local $m5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q6
get_local $m4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q7
get_local $m3
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=8
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x4
get_local $x7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x5
get_local $x6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q4
get_local $m7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q5
get_local $m6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q6
get_local $m5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q7
get_local $m4
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=12
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x5
get_local $x7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x6
get_local $x6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q5
get_local $m7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q6
get_local $m6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q7
get_local $m5
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=16
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x6
get_local $x7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q6
get_local $m7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q7
get_local $m6
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=20
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
i64.const 0
set_local $c0
i64.const 0
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
i64.const 1
i64.shl
set_local $c0
get_local $c1
i64.const 1
i64.shl
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $x7
get_local $x7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $c0_old
i64.const 4294967295
i64.and
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
get_local $c1_old
i64.add
set_local $c1
get_local $c0
i64.const 4294967295
i64.and
get_local $q7
get_local $m7
i64.mul
i64.add
set_local $c0
get_local $c1
get_local $c0
i64.const 32
i64.shr_u
i64.add
set_local $c1
get_local $r
get_local $c0
i64.store32 offset=24
get_local $c1
set_local $c0_old
get_local $c0_old
i64.const 32
i64.shr_u
set_local $c1_old
get_local $r
get_local $c0_old
i64.store32 offset=28
get_local $c1_old
i32.wrap/i64
if
get_local $r
i32.const 608
get_local $r
call $Fr_int_sub
drop
else
get_local $r
i32.const 608
call $Fr_int_gte
if
get_local $r
i32.const 608
get_local $r
call $Fr_int_sub
drop
end
end
)
(func $Fr_F1m_squareOld (type $_sig_i32i32)
 (param $x i32)
 (param $r i32)
get_local $x
get_local $x
get_local $r
call $Fr_F1m_mul
)
(func $Fr_F1m_toMontgomery (type $_sig_i32i32)
 (param $x i32)
 (param $r i32)
get_local $x
i32.const 672
get_local $r
call $Fr_F1m_mul
)
(func $Fr_F1m_fromMontgomery (type $_sig_i32i32)
 (param $x i32)
 (param $r i32)
get_local $x
i32.const 1504
call $Fr_int_copy
i32.const 1536
call $Fr_int_zero
i32.const 1504
get_local $r
call $Fr_F1m_mReduct
)
(func $Fr_F1m_isNegative (type $_sig_i32ri32)
 (param $x i32)
(result i32)
get_local $x
i32.const 1568
call $Fr_F1m_fromMontgomery
i32.const 1568
i32.load
i32.const 1
i32.and
)
(func $Fr_F1m_inverse (type $_sig_i32i32)
 (param $x i32)
 (param $r i32)
get_local $x
get_local $r
call $Fr_F1m_fromMontgomery
get_local $r
i32.const 608
get_local $r
call $Fr_int_inverseMod
get_local $r
get_local $r
call $Fr_F1m_toMontgomery
)
(func $Fr_F1m_one (type $_sig_i32)
 (param $pr i32)
i32.const 736
get_local $pr
call $Fr_int_copy
)
(func $Fr_F1m_load (type $_sig_i32i32i32)
 (param $scalar i32)
 (param $scalarLen i32)
 (param $r i32)
 (local $p i32)
 (local $l i32)
 (local $i i32)
 (local $j i32)
get_local $r
call $Fr_int_zero
i32.const 32
set_local $i
get_local $scalar
set_local $p
block
loop
get_local $i
get_local $scalarLen
i32.gt_u
br_if 1
get_local $i
i32.const 32
i32.eq
if
i32.const 1600
call $Fr_F1m_one
else
i32.const 1600
i32.const 672
i32.const 1600
call $Fr_F1m_mul
end
get_local $p
i32.const 1600
i32.const 1632
call $Fr_F1m_mul
get_local $r
i32.const 1632
get_local $r
call $Fr_F1m_add
get_local $p
i32.const 32
i32.add
set_local $p
get_local $i
i32.const 32
i32.add
set_local $i
br 0
end
end
get_local $scalarLen
i32.const 32
i32.rem_u
set_local $l
get_local $l
i32.eqz
if
return
end
i32.const 1632
call $Fr_int_zero
i32.const 0
set_local $j
block
loop
get_local $j
get_local $l
i32.eq
br_if 1
get_local $j
get_local $p
i32.load8_u
i32.store8 offset=1632
get_local $p
i32.const 1
i32.add
set_local $p
get_local $j
i32.const 1
i32.add
set_local $j
br 0
end
end
get_local $i
i32.const 32
i32.eq
if
i32.const 1600
call $Fr_F1m_one
else
i32.const 1600
i32.const 672
i32.const 1600
call $Fr_F1m_mul
end
i32.const 1632
i32.const 1600
i32.const 1632
call $Fr_F1m_mul
get_local $r
i32.const 1632
get_local $r
call $Fr_F1m_add
)
(func $Fr_F1m_timesScalar (type $_sig_i32i32i32i32)
 (param $x i32)
 (param $scalar i32)
 (param $scalarLen i32)
 (param $r i32)
get_local $scalar
get_local $scalarLen
i32.const 1664
call $Fr_F1m_load
i32.const 1664
i32.const 1664
call $Fr_F1m_toMontgomery
get_local $x
i32.const 1664
get_local $r
call $Fr_F1m_mul
)
(func $Fr_F1m_exp (type $_sig_i32i32i32i32)
 (param $base i32)
 (param $scalar i32)
 (param $scalarLength i32)
 (param $r i32)
 (local $i i32)
 (local $b i32)
get_local $base
i32.const 1696
call $Fr_int_copy
get_local $r
call $Fr_F1m_one
get_local $scalarLength
set_local $i
block
loop
get_local $i
i32.const 1
i32.sub
set_local $i
get_local $scalar
get_local $i
i32.add
i32.load8_u
set_local $b
get_local $r
get_local $r
call $Fr_F1m_square
get_local $b
i32.const 128
i32.ge_u
if
get_local $b
i32.const 128
i32.sub
set_local $b
i32.const 1696
get_local $r
get_local $r
call $Fr_F1m_mul
end
get_local $r
get_local $r
call $Fr_F1m_square
get_local $b
i32.const 64
i32.ge_u
if
get_local $b
i32.const 64
i32.sub
set_local $b
i32.const 1696
get_local $r
get_local $r
call $Fr_F1m_mul
end
get_local $r
get_local $r
call $Fr_F1m_square
get_local $b
i32.const 32
i32.ge_u
if
get_local $b
i32.const 32
i32.sub
set_local $b
i32.const 1696
get_local $r
get_local $r
call $Fr_F1m_mul
end
get_local $r
get_local $r
call $Fr_F1m_square
get_local $b
i32.const 16
i32.ge_u
if
get_local $b
i32.const 16
i32.sub
set_local $b
i32.const 1696
get_local $r
get_local $r
call $Fr_F1m_mul
end
get_local $r
get_local $r
call $Fr_F1m_square
get_local $b
i32.const 8
i32.ge_u
if
get_local $b
i32.const 8
i32.sub
set_local $b
i32.const 1696
get_local $r
get_local $r
call $Fr_F1m_mul
end
get_local $r
get_local $r
call $Fr_F1m_square
get_local $b
i32.const 4
i32.ge_u
if
get_local $b
i32.const 4
i32.sub
set_local $b
i32.const 1696
get_local $r
get_local $r
call $Fr_F1m_mul
end
get_local $r
get_local $r
call $Fr_F1m_square
get_local $b
i32.const 2
i32.ge_u
if
get_local $b
i32.const 2
i32.sub
set_local $b
i32.const 1696
get_local $r
get_local $r
call $Fr_F1m_mul
end
get_local $r
get_local $r
call $Fr_F1m_square
get_local $b
i32.const 1
i32.ge_u
if
get_local $b
i32.const 1
i32.sub
set_local $b
i32.const 1696
get_local $r
get_local $r
call $Fr_F1m_mul
end
get_local $i
i32.eqz
br_if 1
br 0
end
end
)
(func $Fr_F1m_sqrt (type $_sig_i32i32)
 (param $n i32)
 (param $r i32)
 (local $m i32)
 (local $i i32)
 (local $j i32)
get_local $n
call $Fr_int_isZero
if
get_local $r
call $Fr_int_zero
return
end
i32.const 28
set_local $m
i32.const 928
i32.const 1728
call $Fr_int_copy
get_local $n
i32.const 896
i32.const 32
i32.const 1760
call $Fr_F1m_exp
get_local $n
i32.const 960
i32.const 32
i32.const 1792
call $Fr_F1m_exp
block
loop
i32.const 1760
i32.const 736
call $Fr_int_eq
br_if 1
i32.const 1760
i32.const 1824
call $Fr_F1m_square
i32.const 1
set_local $i
block
loop
i32.const 1824
i32.const 736
call $Fr_int_eq
br_if 1
i32.const 1824
i32.const 1824
call $Fr_F1m_square
get_local $i
i32.const 1
i32.add
set_local $i
br 0
end
end
i32.const 1728
i32.const 1856
call $Fr_int_copy
get_local $m
get_local $i
i32.sub
i32.const 1
i32.sub
set_local $j
block
loop
get_local $j
i32.eqz
br_if 1
i32.const 1856
i32.const 1856
call $Fr_F1m_square
get_local $j
i32.const 1
i32.sub
set_local $j
br 0
end
end
get_local $i
set_local $m
i32.const 1856
i32.const 1728
call $Fr_F1m_square
i32.const 1760
i32.const 1728
i32.const 1760
call $Fr_F1m_mul
i32.const 1792
i32.const 1856
i32.const 1792
call $Fr_F1m_mul
br 0
end
end
i32.const 1792
call $Fr_F1m_isNegative
if
i32.const 1792
get_local $r
call $Fr_F1m_neg
else
i32.const 1792
get_local $r
call $Fr_int_copy
end
)
(func $Fr_F1m_isSquare (type $_sig_i32ri32)
 (param $n i32)
(result i32)
get_local $n
call $Fr_int_isZero
if
i32.const 1
return
end
get_local $n
i32.const 800
i32.const 32
i32.const 1888
call $Fr_F1m_exp
i32.const 1888
i32.const 736
call $Fr_int_eq
)
(func $Fr_copy (type $_sig_i32i32)
 (param $pr i32)
 (param $px i32)
get_local $pr
get_local $px
i64.load
i64.store
get_local $pr
get_local $px
i64.load offset=8
i64.store offset=8
get_local $pr
get_local $px
i64.load offset=16
i64.store offset=16
get_local $pr
get_local $px
i64.load offset=24
i64.store offset=24
get_local $pr
get_local $px
i64.load offset=32
i64.store offset=32
)
(func $Fr_copyn (type $_sig_i32i32i32)
 (param $pr i32)
 (param $px i32)
 (param $n i32)
 (local $s i32)
 (local $d i32)
 (local $slast i32)
get_local $px
set_local $s
get_local $pr
set_local $d
get_local $s
get_local $n
i32.const 40
i32.mul
i32.add
set_local $slast
block
loop
get_local $s
get_local $slast
i32.eq
br_if 1
get_local $d
get_local $s
i64.load
i64.store
get_local $d
i32.const 8
i32.add
set_local $d
get_local $s
i32.const 8
i32.add
set_local $s
br 0
end
end
)
(func $Fr_isTrue (type $_sig_i32ri32)
 (param $px i32)
(result i32)
get_local $px
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $px
i32.const 8
i32.add
call $Fr_int_isZero ;; it was $Fr_F1m_isZero, but it does not exists
i32.eqz
return
end
get_local $px
i32.load
i32.const 0
i32.ne
)
(func $Fr_rawCopyS2L (type $_sig_i32i64)
 (param $pR i32)
 (param $v i64)
get_local $v
i64.const 0
i64.gt_s
if
get_local $pR
get_local $v
i64.store
get_local $pR
i64.const 0
i64.store offset=8
get_local $pR
i64.const 0
i64.store offset=16
get_local $pR
i64.const 0
i64.store offset=24
else
i64.const 0
get_local $v
i64.sub
set_local $v
get_local $pR
get_local $v
i64.store
get_local $pR
i64.const 0
i64.store offset=8
get_local $pR
i64.const 0
i64.store offset=16
get_local $pR
i64.const 0
i64.store offset=24
get_local $pR
get_local $pR
call $Fr_F1m_neg
end
)
(func $Fr_toMontgomery (type $_sig_i32)
 (param $pR i32)
get_local $pR
i32.load8_u offset=7
i32.const 64
i32.and
if
return
else
get_local $pR
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pR
i32.const -1073741824
i32.store offset=4
get_local $pR
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_toMontgomery
else
get_local $pR
i32.const 8
i32.add
get_local $pR
i64.load32_s
call $Fr_rawCopyS2L
get_local $pR
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_toMontgomery
get_local $pR
i32.const 1073741824
i32.store offset=4
end
end
)
(func $Fr_toNormal (type $_sig_i32)
 (param $pR i32)
get_local $pR
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pR
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_fromMontgomery
end
end
)
(func $Fr_toLongNormal (type $_sig_i32)
 (param $pR i32)
get_local $pR
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pR
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_fromMontgomery
end
else
get_local $pR
i32.const 8
i32.add
get_local $pR
i64.load32_s
call $Fr_rawCopyS2L
get_local $pR
i32.const -2147483648
i32.store offset=4
end
)
(func $Fr_isNegative (type $_sig_i32ri32)
 (param $pA i32)
(result i32)
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pA
call $Fr_toNormal
get_local $pA
i32.const 8
i32.add
i32.const 1920
call $Fr_int_gt
return
end
get_local $pA
i32.load
i32.const 0
i32.lt_s
)
(func $Fr_neg (type $_sig_i32i32)
 (param $pR i32)
 (param $pA i32)
 (local $r i64)
 (local $overflow i64)
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pA
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pR
i32.const -1073741824
i32.store offset=4
else
get_local $pR
i32.const -2147483648
i32.store offset=4
end
get_local $pA
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_neg
else
i64.const 0
get_local $pA
i64.load32_s
i64.sub
set_local $r
get_local $r
i64.const 31
i64.shr_s
set_local $overflow
get_local $overflow
i64.eqz
get_local $overflow
i64.const 1
i64.add
i64.eqz
i32.or
if
get_local $pR
get_local $r
i64.store32
get_local $pR
i32.const 0
i32.store offset=4
else
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
i32.const 8
i32.add
get_local $r
call $Fr_rawCopyS2L
end
end
)
(func $Fr_getLsb32 (type $_sig_i32ri32)
 (param $pA i32)
(result i32)
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pA
call $Fr_toNormal
get_local $pA
i32.load offset=8
return
else
get_local $pA
i32.load
return
end
i32.const 0
)
(func $Fr_toInt (type $_sig_i32ri32)
 (param $pA i32)
(result i32)
get_local $pA
call $Fr_isNegative
if
i32.const 8
get_local $pA
call $Fr_neg
i32.const 0
i32.const 8
call $Fr_getLsb32
i32.sub
return
else
get_local $pA
call $Fr_getLsb32
return
end
i32.const 0
)
(func $Fr_add (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
 (local $r i64)
 (local $overflow i64)
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pA
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pB
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pR
i32.const -1073741824
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_add
else
get_local $pB
call $Fr_toMontgomery
get_local $pR
i32.const -1073741824
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_add
end
else
get_local $pB
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pA
call $Fr_toMontgomery
get_local $pR
i32.const -1073741824
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_add
else
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_add
end
end
else
get_local $pA
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pB
call $Fr_toMontgomery
get_local $pR
i32.const -1073741824
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_add
else
get_local $pR
i32.const -2147483648
i32.store offset=4
i32.const 16
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const 8
i32.add
i32.const 16
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_add
end
end
else
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pB
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pA
call $Fr_toMontgomery
get_local $pR
i32.const -1073741824
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_add
else
get_local $pR
i32.const -2147483648
i32.store offset=4
i32.const 16
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
i32.const 16
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_add
end
else
get_local $pA
i64.load32_s
get_local $pB
i64.load32_s
i64.add
set_local $r
get_local $r
i64.const 31
i64.shr_s
set_local $overflow
get_local $overflow
i64.eqz
get_local $overflow
i64.const 1
i64.add
i64.eqz
i32.or
if
get_local $pR
get_local $r
i64.store32
get_local $pR
i32.const 0
i32.store offset=4
else
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
i32.const 8
i32.add
get_local $r
call $Fr_rawCopyS2L
end
end
end
)
(func $Fr_sub (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
 (local $r i64)
 (local $overflow i64)
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pA
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pB
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pR
i32.const -1073741824
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_sub
else
get_local $pB
call $Fr_toMontgomery
get_local $pR
i32.const -1073741824
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_sub
end
else
get_local $pB
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pA
call $Fr_toMontgomery
get_local $pR
i32.const -1073741824
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_sub
else
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_sub
end
end
else
get_local $pA
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pB
call $Fr_toMontgomery
get_local $pR
i32.const -1073741824
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_sub
else
get_local $pR
i32.const -2147483648
i32.store offset=4
i32.const 16
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const 8
i32.add
i32.const 16
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_sub
end
end
else
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pB
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pA
call $Fr_toMontgomery
get_local $pR
i32.const -1073741824
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_sub
else
get_local $pR
i32.const -2147483648
i32.store offset=4
i32.const 16
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
i32.const 16
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_sub
end
else
get_local $pA
i64.load32_s
get_local $pB
i64.load32_s
i64.sub
set_local $r
get_local $r
i64.const 31
i64.shr_s
set_local $overflow
get_local $overflow
i64.eqz
get_local $overflow
i64.const 1
i64.add
i64.eqz
i32.or
if
get_local $pR
get_local $r
i64.store32
get_local $pR
i32.const 0
i32.store offset=4
else
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
i32.const 8
i32.add
get_local $r
call $Fr_rawCopyS2L
end
end
end
)
(func $Fr_eqR (type $_sig_i32i32ri32)
 (param $pA i32)
 (param $pB i32)
(result i32)
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pB
i32.const 8
i32.add
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pB
i32.const -2147483648
i32.store offset=4
end
get_local $pA
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pB
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
call $Fr_int_eq
if
i32.const 1
return
else
i32.const 0
return
end
else
get_local $pA
call $Fr_toNormal
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
call $Fr_int_eq
if
i32.const 1
return
else
i32.const 0
return
end
end
else
get_local $pB
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pB
call $Fr_toNormal
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
call $Fr_int_eq
if
i32.const 1
return
else
i32.const 0
return
end
else
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
call $Fr_int_eq
if
i32.const 1
return
else
i32.const 0
return
end
end
end
else
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pA
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pB
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
call $Fr_int_eq
if
i32.const 1
return
else
i32.const 0
return
end
else
get_local $pA
call $Fr_toNormal
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
call $Fr_int_eq
if
i32.const 1
return
else
i32.const 0
return
end
end
else
get_local $pB
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pB
call $Fr_toNormal
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
call $Fr_int_eq
if
i32.const 1
return
else
i32.const 0
return
end
else
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
call $Fr_int_eq
if
i32.const 1
return
else
i32.const 0
return
end
end
end
else
get_local $pA
i32.load
get_local $pB
i32.load
i32.eq
if
i32.const 1
return
else
i32.const 0
return
end
end
end
i32.const 0
)
(func $Fr_gtR (type $_sig_i32i32ri32)
 (param $pA i32)
 (param $pB i32)
(result i32)
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pB
i32.const 8
i32.add
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pB
i32.const -2147483648
i32.store offset=4
end
get_local $pA
call $Fr_toNormal
get_local $pB
call $Fr_toNormal
get_local $pA
call $Fr_isNegative
if
get_local $pB
call $Fr_isNegative
if
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
call $Fr_int_gt
if
i32.const 1
return
else
i32.const 0
return
end
else
i32.const 0
return
end
else
get_local $pB
call $Fr_isNegative
if
i32.const 1
return
else
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
call $Fr_int_gt
if
i32.const 1
return
else
i32.const 0
return
end
end
end
else
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pA
call $Fr_toNormal
get_local $pB
call $Fr_toNormal
get_local $pA
call $Fr_isNegative
if
get_local $pB
call $Fr_isNegative
if
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
call $Fr_int_gt
if
i32.const 1
return
else
i32.const 0
return
end
else
i32.const 0
return
end
else
get_local $pB
call $Fr_isNegative
if
i32.const 1
return
else
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
call $Fr_int_gt
if
i32.const 1
return
else
i32.const 0
return
end
end
end
else
get_local $pA
i32.load
get_local $pB
i32.load
i32.gt_s
if
i32.const 1
return
else
i32.const 0
return
end
end
end
i32.const 0
)
(func $Fr_eq (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
get_local $pA
get_local $pB
call $Fr_eqR
if
get_local $pR
i64.const 1
i64.store
else
get_local $pR
i64.const 0
i64.store
end
)
(func $Fr_neq (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
get_local $pA
get_local $pB
call $Fr_eqR
if
get_local $pR
i64.const 0
i64.store
else
get_local $pR
i64.const 1
i64.store
end
)
(func $Fr_gt (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
get_local $pA
get_local $pB
call $Fr_eqR
if
get_local $pR
i64.const 0
i64.store
else
get_local $pA
get_local $pB
call $Fr_gtR
if
get_local $pR
i64.const 1
i64.store
else
get_local $pR
i64.const 0
i64.store
end
end
)
(func $Fr_geq (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
get_local $pA
get_local $pB
call $Fr_eqR
if
get_local $pR
i64.const 1
i64.store
else
get_local $pA
get_local $pB
call $Fr_gtR
if
get_local $pR
i64.const 1
i64.store
else
get_local $pR
i64.const 0
i64.store
end
end
)
(func $Fr_lt (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
get_local $pA
get_local $pB
call $Fr_eqR
if
get_local $pR
i64.const 0
i64.store
else
get_local $pA
get_local $pB
call $Fr_gtR
if
get_local $pR
i64.const 0
i64.store
else
get_local $pR
i64.const 1
i64.store
end
end
)
(func $Fr_leq (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
get_local $pA
get_local $pB
call $Fr_eqR
if
get_local $pR
i64.const 1
i64.store
else
get_local $pA
get_local $pB
call $Fr_gtR
if
get_local $pR
i64.const 0
i64.store
else
get_local $pR
i64.const 1
i64.store
end
end
)
(func $Fr_mul (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
 (local $r i64)
 (local $overflow i64)
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pA
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pB
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pR
i32.const -1073741824
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_mul
else
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_mul
end
else
get_local $pB
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_mul
else
get_local $pR
i32.const -1073741824
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_mul
i32.const 704
get_local $pR
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_mul
end
end
else
get_local $pA
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pB
call $Fr_toMontgomery
get_local $pR
i32.const -1073741824
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_mul
else
get_local $pB
call $Fr_toMontgomery
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_mul
end
end
else
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pB
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pA
call $Fr_toMontgomery
get_local $pR
i32.const -1073741824
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_mul
else
get_local $pA
call $Fr_toMontgomery
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_mul
end
else
get_local $pA
i64.load32_s
get_local $pB
i64.load32_s
i64.mul
set_local $r
get_local $r
i64.const 31
i64.shr_s
set_local $overflow
get_local $overflow
i64.eqz
get_local $overflow
i64.const 1
i64.add
i64.eqz
i32.or
if
get_local $pR
get_local $r
i64.store32
get_local $pR
i32.const 0
i32.store offset=4
else
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
i32.const 8
i32.add
get_local $r
call $Fr_rawCopyS2L
end
end
end
)
(func $Fr_idiv (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pA
call $Fr_toNormal
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pB
i32.const 8
i32.add
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pB
i32.const -2147483648
i32.store offset=4
end
get_local $pB
call $Fr_toNormal
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
i32.const 16
call $Fr_int_div
)
(func $Fr_mod (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pA
call $Fr_toNormal
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pB
i32.const 8
i32.add
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pB
i32.const -2147483648
i32.store offset=4
end
get_local $pB
call $Fr_toNormal
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
i32.const 16
get_local $pR
i32.const 8
i32.add
call $Fr_int_div
)
(func $Fr_inv (type $_sig_i32i32)
 (param $pR i32)
 (param $pA i32)
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pA
i32.const 8
i32.add
i32.const 608
get_local $pR
i32.const 8
i32.add
call $Fr_int_inverseMod
get_local $pA
i32.load8_u offset=7
i32.const 64
i32.and
if
get_local $pR
i32.const -1073741824
i32.store offset=4
get_local $pR
i32.const 8
i32.add
i32.const 704
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_mul
else
get_local $pR
i32.const -2147483648
i32.store offset=4
end
)
(func $Fr_div (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
 (local $r i64)
 (local $overflow i64)
get_local $pR
get_local $pB
call $Fr_inv
get_local $pR
get_local $pR
get_local $pA
call $Fr_mul
)
(func $Fr_pow (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
get_local $pA
call $Fr_toMontgomery
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pB
i32.const 8
i32.add
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pB
i32.const -2147483648
i32.store offset=4
end
get_local $pB
call $Fr_toNormal
get_local $pR
i32.const -1073741824
i32.store offset=4
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
i32.const 32
get_local $pR
i32.const 8
i32.add
call $Fr_F1m_exp
)
(func $Fr_fixedShl (type $_sig_i64i64ri64)
 (param $a i64)
 (param $b i64)
(result i64)
get_local $b
i64.const 64
i64.ge_u
if
i64.const 0
return
end
get_local $a
get_local $b
i64.shl
)
(func $Fr_fixedShr (type $_sig_i64i64ri64)
 (param $a i64)
 (param $b i64)
(result i64)
get_local $b
i64.const 64
i64.ge_u
if
i64.const 0
return
end
get_local $a
get_local $b
i64.shr_u
)
(func $Fr_rawgetchunk (type $_sig_i32i32ri64)
 (param $pA i32)
 (param $i i32)
(result i64)
get_local $i
i32.const 4
i32.lt_u
if
get_local $pA
get_local $i
i32.const 8
i32.mul
i32.add
i64.load
return
end
i64.const 0
)
(func $Fr_rawshll (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $n i32)
 (local $oWords1 i32)
 (local $oBits1 i64)
 (local $oWords2 i32)
 (local $oBits2 i64)
 (local $i i32)
i32.const 0
get_local $n
i32.const 6
i32.shr_u
i32.sub
set_local $oWords1
get_local $oWords1
i32.const 1
i32.sub
set_local $oWords2
get_local $n
i64.extend_u/i32
i64.const 63
i64.and
set_local $oBits1
i64.const 64
get_local $oBits1
i64.sub
set_local $oBits2
i32.const 0
set_local $i
block
loop
get_local $i
i32.const 4
i32.eq
br_if 1
get_local $pR
get_local $i
i32.const 8
i32.mul
i32.add
get_local $pA
get_local $oWords1
get_local $i
i32.add
call $Fr_rawgetchunk
get_local $oBits1
call $Fr_fixedShl
get_local $pA
get_local $oWords2
get_local $i
i32.add
call $Fr_rawgetchunk
get_local $oBits2
call $Fr_fixedShr
i64.or
i64.store
get_local $i
i32.const 1
i32.add
set_local $i
br 0
end
end
)
(func $Fr_rawshrl (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $n i32)
 (local $oWords1 i32)
 (local $oBits1 i64)
 (local $oWords2 i32)
 (local $oBits2 i64)
 (local $i i32)
get_local $n
i32.const 6
i32.shr_u
set_local $oWords1
get_local $oWords1
i32.const 1
i32.add
set_local $oWords2
get_local $n
i64.extend_u/i32
i64.const 63
i64.and
set_local $oBits1
i64.const 64
get_local $oBits1
i64.sub
set_local $oBits2
i32.const 0
set_local $i
block
loop
get_local $i
i32.const 4
i32.eq
br_if 1
get_local $pR
get_local $i
i32.const 8
i32.mul
i32.add
get_local $pA
get_local $oWords1
get_local $i
i32.add
call $Fr_rawgetchunk
get_local $oBits1
call $Fr_fixedShr
get_local $pA
get_local $oWords2
get_local $i
i32.add
call $Fr_rawgetchunk
get_local $oBits2
call $Fr_fixedShl
i64.or
i64.store
get_local $i
i32.const 1
i32.add
set_local $i
br 0
end
end
)
(func $Fr_adjustBinResult (type $_sig_i32)
 (param $pA i32)
get_local $pA
get_local $pA
i64.load offset=32
i64.const 4611686018427387903
i64.and
i64.store offset=32
get_local $pA
i32.const 8
i32.add
i32.const 608
call $Fr_int_gte
if
get_local $pA
i32.const 8
i32.add
i32.const 608
get_local $pA
i32.const 8
i32.add
call $Fr_int_sub
drop
end
)
(func $Fr_rawshl (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $n i32)
 (local $r i64)
 (local $overflow i64)
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pA
call $Fr_toNormal
get_local $pR
i32.const 8
i32.add
get_local $pA
i32.const 8
i32.add
get_local $n
call $Fr_rawshll
get_local $pR
call $Fr_adjustBinResult
get_local $pR
i32.const -2147483648
i32.store offset=4
else
get_local $pA
call $Fr_isNegative
if
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pR
i32.const 8
i32.add
get_local $pA
i32.const 8
i32.add
get_local $n
call $Fr_rawshll
get_local $pR
call $Fr_adjustBinResult
get_local $pR
i32.const -2147483648
i32.store offset=4
else
get_local $n
i32.const 30
i32.gt_u
if
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pR
i32.const 8
i32.add
get_local $pA
i32.const 8
i32.add
get_local $n
call $Fr_rawshll
get_local $pR
call $Fr_adjustBinResult
get_local $pR
i32.const -2147483648
i32.store offset=4
else
get_local $pA
i64.load32_s
get_local $n
i64.extend_u/i32
i64.shl
set_local $r
get_local $r
i64.const 31
i64.shr_s
set_local $overflow
get_local $overflow
i64.eqz
get_local $overflow
i64.const 1
i64.add
i64.eqz
i32.or
if
get_local $pR
get_local $r
i64.store32
get_local $pR
i32.const 0
i32.store offset=4
else
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
i32.const 8
i32.add
get_local $r
call $Fr_rawCopyS2L
end
end
end
end
)
(func $Fr_rawshr (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $n i32)
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pA
call $Fr_toNormal
get_local $pR
i32.const 8
i32.add
get_local $pA
i32.const 8
i32.add
get_local $n
call $Fr_rawshrl
get_local $pR
i32.const -2147483648
i32.store offset=4
else
get_local $pA
call $Fr_isNegative
if
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pR
i32.const 8
i32.add
get_local $pA
i32.const 8
i32.add
get_local $n
call $Fr_rawshrl
get_local $pR
i32.const -2147483648
i32.store offset=4
else
get_local $n
i32.const 32
i32.lt_u
if
get_local $pR
get_local $pA
i32.load
get_local $n
i32.shr_u
i32.store
else
get_local $pR
i32.const 0
i32.store
end
get_local $pR
i32.const 0
i32.store offset=4
end
end
)
(func $Fr_shl (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
get_local $pB
call $Fr_isNegative
if
i32.const 48
get_local $pB
call $Fr_neg
i32.const 8
i32.const 48
i32.const 88
call $Fr_lt
i32.const 8
i32.load
if
get_local $pR
get_local $pA
i32.const 48
call $Fr_toInt
call $Fr_rawshr
else
get_local $pR
call $Fr_int_zero
end
else
i32.const 8
get_local $pB
i32.const 88
call $Fr_lt
i32.const 8
i32.load
if
get_local $pR
get_local $pA
get_local $pB
call $Fr_toInt
call $Fr_rawshl
else
get_local $pR
call $Fr_int_zero
end
end
)
(func $Fr_shr (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
get_local $pB
call $Fr_isNegative
if
i32.const 48
get_local $pB
call $Fr_neg
i32.const 8
i32.const 48
i32.const 88
call $Fr_lt
i32.const 8
i32.load
if
get_local $pR
get_local $pA
i32.const 48
call $Fr_toInt
call $Fr_rawshl
else
get_local $pR
call $Fr_int_zero
end
else
i32.const 8
get_local $pB
i32.const 88
call $Fr_lt
i32.const 8
i32.load
if
get_local $pR
get_local $pA
get_local $pB
call $Fr_toInt
call $Fr_rawshr
else
get_local $pR
call $Fr_int_zero
end
end
)
(func $Fr_rawbandl (type $_sig_i32i32i32)
 (param $pA i32)
 (param $pB i32)
 (param $pR i32)
get_local $pR
get_local $pA
i64.load
get_local $pB
i64.load
i64.and
i64.store
get_local $pR
get_local $pA
i64.load offset=8
get_local $pB
i64.load offset=8
i64.and
i64.store offset=8
get_local $pR
get_local $pA
i64.load offset=16
get_local $pB
i64.load offset=16
i64.and
i64.store offset=16
get_local $pR
get_local $pA
i64.load offset=24
get_local $pB
i64.load offset=24
i64.and
i64.store offset=24
)
(func $Fr_band (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pA
call $Fr_toNormal
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pB
i32.const 8
i32.add
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pB
i32.const -2147483648
i32.store offset=4
end
get_local $pB
call $Fr_toNormal
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_rawbandl
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
call $Fr_adjustBinResult
else
get_local $pA
call $Fr_isNegative
if
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pA
call $Fr_toNormal
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pB
i32.const 8
i32.add
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pB
i32.const -2147483648
i32.store offset=4
end
get_local $pB
call $Fr_toNormal
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_rawbandl
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
call $Fr_adjustBinResult
else
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pA
call $Fr_toNormal
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pB
i32.const 8
i32.add
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pB
i32.const -2147483648
i32.store offset=4
end
get_local $pB
call $Fr_toNormal
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_rawbandl
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
call $Fr_adjustBinResult
else
get_local $pB
call $Fr_isNegative
if
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pA
call $Fr_toNormal
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pB
i32.const 8
i32.add
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pB
i32.const -2147483648
i32.store offset=4
end
get_local $pB
call $Fr_toNormal
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_rawbandl
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
call $Fr_adjustBinResult
else
get_local $pR
get_local $pA
i32.load
get_local $pB
i32.load
i32.and
i32.store
get_local $pR
i32.const 0
i32.store offset=4
end
end
end
end
)
(func $Fr_rawborl (type $_sig_i32i32i32)
 (param $pA i32)
 (param $pB i32)
 (param $pR i32)
get_local $pR
get_local $pA
i64.load
get_local $pB
i64.load
i64.or
i64.store
get_local $pR
get_local $pA
i64.load offset=8
get_local $pB
i64.load offset=8
i64.or
i64.store offset=8
get_local $pR
get_local $pA
i64.load offset=16
get_local $pB
i64.load offset=16
i64.or
i64.store offset=16
get_local $pR
get_local $pA
i64.load offset=24
get_local $pB
i64.load offset=24
i64.or
i64.store offset=24
)
(func $Fr_bor (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pA
call $Fr_toNormal
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pB
i32.const 8
i32.add
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pB
i32.const -2147483648
i32.store offset=4
end
get_local $pB
call $Fr_toNormal
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_rawborl
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
call $Fr_adjustBinResult
else
get_local $pA
call $Fr_isNegative
if
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pA
call $Fr_toNormal
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pB
i32.const 8
i32.add
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pB
i32.const -2147483648
i32.store offset=4
end
get_local $pB
call $Fr_toNormal
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_rawborl
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
call $Fr_adjustBinResult
else
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pA
call $Fr_toNormal
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pB
i32.const 8
i32.add
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pB
i32.const -2147483648
i32.store offset=4
end
get_local $pB
call $Fr_toNormal
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_rawborl
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
call $Fr_adjustBinResult
else
get_local $pB
call $Fr_isNegative
if
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pA
call $Fr_toNormal
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pB
i32.const 8
i32.add
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pB
i32.const -2147483648
i32.store offset=4
end
get_local $pB
call $Fr_toNormal
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_rawborl
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
call $Fr_adjustBinResult
else
get_local $pR
get_local $pA
i32.load
get_local $pB
i32.load
i32.or
i32.store
get_local $pR
i32.const 0
i32.store offset=4
end
end
end
end
)
(func $Fr_rawbxorl (type $_sig_i32i32i32)
 (param $pA i32)
 (param $pB i32)
 (param $pR i32)
get_local $pR
get_local $pA
i64.load
get_local $pB
i64.load
i64.xor
i64.store
get_local $pR
get_local $pA
i64.load offset=8
get_local $pB
i64.load offset=8
i64.xor
i64.store offset=8
get_local $pR
get_local $pA
i64.load offset=16
get_local $pB
i64.load offset=16
i64.xor
i64.store offset=16
get_local $pR
get_local $pA
i64.load offset=24
get_local $pB
i64.load offset=24
i64.xor
i64.store offset=24
)
(func $Fr_bxor (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pA
call $Fr_toNormal
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pB
i32.const 8
i32.add
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pB
i32.const -2147483648
i32.store offset=4
end
get_local $pB
call $Fr_toNormal
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_rawbxorl
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
call $Fr_adjustBinResult
else
get_local $pA
call $Fr_isNegative
if
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pA
call $Fr_toNormal
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pB
i32.const 8
i32.add
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pB
i32.const -2147483648
i32.store offset=4
end
get_local $pB
call $Fr_toNormal
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_rawbxorl
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
call $Fr_adjustBinResult
else
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pA
call $Fr_toNormal
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pB
i32.const 8
i32.add
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pB
i32.const -2147483648
i32.store offset=4
end
get_local $pB
call $Fr_toNormal
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_rawbxorl
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
call $Fr_adjustBinResult
else
get_local $pB
call $Fr_isNegative
if
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pA
call $Fr_toNormal
get_local $pB
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pB
i32.const 8
i32.add
get_local $pB
i64.load32_s
call $Fr_rawCopyS2L
get_local $pB
i32.const -2147483648
i32.store offset=4
end
get_local $pB
call $Fr_toNormal
get_local $pA
i32.const 8
i32.add
get_local $pB
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_rawbxorl
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
call $Fr_adjustBinResult
else
get_local $pR
get_local $pA
i32.load
get_local $pB
i32.load
i32.xor
i32.store
get_local $pR
i32.const 0
i32.store offset=4
end
end
end
end
)
(func $Fr_rawbnotl (type $_sig_i32i32)
 (param $pA i32)
 (param $pR i32)
get_local $pR
get_local $pA
i64.load
i64.const -1
i64.xor
i64.store
get_local $pR
get_local $pA
i64.load offset=8
i64.const -1
i64.xor
i64.store offset=8
get_local $pR
get_local $pA
i64.load offset=16
i64.const -1
i64.xor
i64.store offset=16
get_local $pR
get_local $pA
i64.load offset=24
i64.const -1
i64.xor
i64.store offset=24
)
(func $Fr_bnot (type $_sig_i32i32)
 (param $pR i32)
 (param $pA i32)
get_local $pA
i32.load8_u offset=7
i32.const 128
i32.and
if
else
get_local $pA
i32.const 8
i32.add
get_local $pA
i64.load32_s
call $Fr_rawCopyS2L
get_local $pA
i32.const -2147483648
i32.store offset=4
end
get_local $pA
call $Fr_toNormal
get_local $pA
i32.const 8
i32.add
get_local $pR
i32.const 8
i32.add
call $Fr_rawbnotl
get_local $pR
i32.const -2147483648
i32.store offset=4
get_local $pR
call $Fr_adjustBinResult
)
(func $Fr_land (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
get_local $pA
call $Fr_isTrue
get_local $pB
call $Fr_isTrue
i32.and
if
get_local $pR
i64.const 1
i64.store
else
get_local $pR
i64.const 0
i64.store
end
)
(func $Fr_lor (type $_sig_i32i32i32)
 (param $pR i32)
 (param $pA i32)
 (param $pB i32)
get_local $pA
call $Fr_isTrue
get_local $pB
call $Fr_isTrue
i32.or
if
get_local $pR
i64.const 1
i64.store
else
get_local $pR
i64.const 0
i64.store
end
)
(func $Fr_lnot (type $_sig_i32i32)
 (param $pR i32)
 (param $pA i32)
get_local $pA
call $Fr_isTrue
if
get_local $pR
i64.const 0
i64.store
else
get_local $pR
i64.const 1
i64.store
end
)
(func $getOffsetIOSubComponet (type $_t_i32i32ri32)
 (param $comp i32)
 (param $ios i32)
(result i32)
i32.const 6336
local.get $comp
i32.add
i32.load
local.get $ios
i32.const 4
i32.mul
i32.add
i32.load
)
(func $getVersion (type $_t_ri32)
i32.const 2
)
(func $getMinorVersion (type $_t_ri32)
i32.const 1
)
(func $getPatchVersion (type $_t_ri32)
i32.const 6
)
(func $getSharedRWMemoryStart (type $_t_ri32)
(result i32)
i32.const 1992
)
(func $readSharedRWMemory (type $_t_i32ri32)
 (param $p i32)
(result i32)
i32.const 1992
local.get $p
i32.const 4
i32.mul
i32.add
i32.load
)
(func $writeSharedRWMemory (type $_t_i32i32)
 (param $p i32)
 (param $v i32)
i32.const 1992
local.get $p
i32.const 4
i32.mul
i32.add
local.get $v
i32.store
)
(func $reserveStackFr (type $_t_i32ri32)
 (param $nbytes i32)
(result i32)
 (local $inistack i32)
 (local $newbsize i32)
 (local $memorybsize i32)
i32.const 0
i32.load
local.set $inistack
local.get $inistack
local.get $nbytes
i32.add
local.set $newbsize
i32.const 0
local.get $newbsize
i32.store
memory.size
i32.const 16
i32.shl
local.set $memorybsize
local.get $newbsize
local.get $memorybsize
i32.gt_u
if
local.get $newbsize
local.get $memorybsize
i32.sub
i32.const 65535
i32.add
i32.const 16
i32.shr_u
memory.grow
i32.const -1
i32.eq
if
i32.const 5
call $exceptionHandler
end
end
local.get $inistack
)
(func $init (type $_t_i32)
 (param $t i32)
 (local $i i32)
 (local $merror i32)
i32.const 6128
;; Number of Main inputs
i32.const 2
i32.store
i32.const 6132
local.set $i
block
loop
local.get $i
i32.const 6140
i32.eq
br_if 1
local.get $i
i32.const 0
i32.store
local.get $i
i32.const 4
i32.add
local.set $i
br 0
end
end
i32.const 6320
i32.const 6324
i32.store
i32.const 6200
call $Multiplier2_0_create
drop
)
(func $getInputSignalMapPosition (type $_t_i64ri32)
 (param $hn i64)
(result i32)
 (local $ini i32)
 (local $i i32)
 (local $aux i32)
local.get $hn
i32.wrap_i64
i32.const 255
i32.and
local.set $ini
local.get $ini
local.set $i
block
loop
i32.const 2032
local.get $i
i32.const 16
i32.mul
i32.add
local.set $aux
local.get $aux
i64.load
local.get $hn
i64.eq
if
local.get $aux
return
end
local.get $aux
i64.load
i64.eqz
if
i32.const 0
return
end
local.get $i
i32.const 1
i32.add
i32.const 255
i32.and
local.set $i
local.get $i
local.get $ini
i32.eq
if
i32.const 0
return
end
br 0
end
end
i32.const 0
)
(func $checkIfInputSignalSet (type $_t_i32ri32)
 (param $sip i32)
(result i32)
i32.const 6132
local.get $sip
i32.add
i32.load
)
(func $setInputSignal (type $_t_i32i32i32)
 (param $hmsb i32)
 (param $hlsb i32)
 (param $pos i32)
 (local $ns i32) ;; number of signals to set
 (local $mp i32) ;; map position
 (local $sip i32) ;; signal+position number
 (local $sipm i32) ;; position in the signal memory
 (local $vint i32)
 (local $merror i32)
i32.const 6128
i32.load
local.set $ns
local.get $ns
i32.eqz
if
i32.const 2
call $exceptionHandler
else
local.get $hmsb
i64.extend_i32_u
i64.const 32
i64.shl
local.get $hlsb
i64.extend_i32_u
i64.or
call $getInputSignalMapPosition
local.tee $mp
i32.eqz
if
i32.const 1
call $exceptionHandler
else
local.get $pos
local.get $mp
i32.load offset=12
i32.ge_u
if
i32.const 6
call $exceptionHandler
else
local.get $mp
i32.load offset=8
local.get $pos
i32.add
local.tee $sip
i32.const 2
i32.sub
call $checkIfInputSignalSet
if
i32.const 3
call $exceptionHandler
else
local.get $sip
i32.const 40
i32.mul
i32.const 6160
i32.add
local.set $sipm
local.get $sipm
i32.const 1984
call $Fr_toInt
local.set $vint
local.get $vint
i32.store
local.get $sipm
i32.const 0
i32.store offset=4
local.get $sipm
i32.const 8
i32.add
call $Fr_int_zero
local.get $sipm
i32.const 1984
call $Fr_eqR
if
local.get $sipm
local.get $vint
i32.store
local.get $sipm
i32.const 0
i32.store offset=4
local.get $sipm
i32.const 8
i32.add
call $Fr_int_zero
else
local.get $sipm
i32.const 1984
call $Fr_copy
end
local.get $ns
i32.const -1
i32.add
local.set $ns
i32.const 6128
local.get $ns
i32.store
local.get $ns
i32.eqz
if
i32.const 6324
call $Multiplier2_0_run
local.tee $merror
if
local.get $merror
call $exceptionHandler
end
end
end
end
end
end
)
(func $getInputSignalSize (type $_t_i32i32ri32)
 (param $hmsb i32)
 (param $hlsb i32)
(result i32)
local.get $hmsb
i64.extend_i32_u
i64.const 32
i64.shl
local.get $hlsb
i64.extend_i32_u
i64.or
call $getInputSignalMapPosition
i32.load offset=12
)
(func $getRawPrime (type $_t_void)
i32.const 1952
i32.const 1992
call $Fr_int_copy
)
(func $getFieldNumLen32 (type $_t_ri32)
(result i32)
i32.const 8
)
(func $getInputSize (type $_t_ri32)
(result i32)
i32.const 2
)
(func $getWitnessSize (type $_t_ri32)
(result i32)
i32.const 4
)
(func $getWitness (type $_t_i32)
 (param $p i32)
 (local $c i32)
i32.const 6140
local.get $p
i32.const 2
i32.shl
i32.add
i32.load
i32.const 40
i32.mul
i32.const 6160
i32.add
local.set $c
i32.const 1984
local.get $c
call $Fr_copy
i32.const 1984
call $Fr_toLongNormal
)
(func $copy32inSharedRWMemory (type $_t_i32)
 (param $p i32)
i32.const 1992
local.get $p
i32.store
i32.const 1992
i32.const 0
i32.store offset=4
i32.const 1992
i64.const 0
i64.store offset=8
i32.const 1992
i64.const 0
i64.store offset=16
i32.const 1992
i64.const 0
i64.store offset=24
)
(func $copyFr2SharedRWMemory (type $_t_i32)
 (param $p i32)
i32.const 1984
local.get $p
call $Fr_copy
i32.const 1984
call $Fr_toLongNormal
)
(func $getMessageChar (type $_t_ri32)
 (local $c i32)
i32.const 6340
i32.load
local.set $c
local.get $c
i32.const 256
i32.ge_u
if
i32.const 0
return
else
i32.const 6344
local.get $c
i32.add
i32.load8_u
i32.const 6340
local.get $c
i32.const 1
i32.add
i32.store
return
end
i32.const 0
)
(func $buildBufferMessage (type $_t_i32i32)
 (param $m i32)
 (param $l i32)
 (local $em i32)
 (local $bm i32)
 (local $mc i32)
 (local $p10 i32)
i32.const 6600
local.get $m
i32.const 240
i32.mul
i32.add
local.set $em
i32.const 6344
local.set $bm
block
loop
i32.const 6584
local.get $em
i32.eq
br_if 1
local.get $em
i32.load8_u
local.set $mc
local.get $mc
i32.eqz
br_if 1
local.get $bm
local.get $mc
i32.store8
local.get $em
i32.const 1
i32.add
local.set $em
local.get $bm
i32.const 1
i32.add
local.set $bm
br 0
end
end
local.get $bm
i32.const 0x20
i32.store8
local.get $bm
i32.const 1
i32.add
local.set $bm
local.get $bm
i32.const 0x6C
i32.store8
local.get $bm
i32.const 1
i32.add
local.set $bm
local.get $bm
i32.const 0x69
i32.store8
local.get $bm
i32.const 1
i32.add
local.set $bm
local.get $bm
i32.const 0x6E
i32.store8
local.get $bm
i32.const 1
i32.add
local.set $bm
local.get $bm
i32.const 0x65
i32.store8
local.get $bm
i32.const 1
i32.add
local.set $bm
local.get $bm
i32.const 0x3A
i32.store8
local.get $bm
i32.const 1
i32.add
local.set $bm
local.get $bm
i32.const 0x20
i32.store8
local.get $bm
i32.const 1
i32.add
local.set $bm
i32.const 1
local.set $p10
block
loop
local.get $p10
i32.const 10
i32.mul
local.get $l
i32.gt_u
br_if 1
local.get $p10
i32.const 10
i32.mul
local.set $p10
br 0
end
end
block
loop
local.get $p10
i32.eqz
br_if 1
local.get $bm
local.get $l
local.get $p10
i32.div_u
i32.const 0x30
i32.add
i32.store8
local.get $bm
i32.const 1
i32.add
local.set $bm
local.get $l
local.get $p10
i32.rem_u
local.set $l
local.get $p10
i32.const 10
i32.div_u
local.set $p10
br 0
end
end
block
loop
local.get $bm
i32.const 6600
i32.eq
br_if 1
local.get $bm
i32.const 0
i32.store8
local.get $bm
i32.const 1
i32.add
local.set $bm
br 0
end
end
i32.const 6340
i32.const 0
i32.store
)
(func $buildLogMessage (type $_t_i32)
 (param $m i32)
 (local $em i32)
 (local $bm i32)
 (local $mc i32)
local.get $m
local.set $em
i32.const 6344
local.set $bm
block
loop
i32.const 6584
local.get $em
i32.eq
br_if 1
local.get $em
i32.load8_u
local.set $mc
local.get $mc
i32.eqz
br_if 1
local.get $bm
local.get $mc
i32.store8
local.get $em
i32.const 1
i32.add
local.set $em
local.get $bm
i32.const 1
i32.add
local.set $bm
br 0
end
end
block
loop
local.get $bm
i32.const 6600
i32.eq
br_if 1
local.get $bm
i32.const 0
i32.store8
local.get $bm
i32.const 1
i32.add
local.set $bm
br 0
end
end
i32.const 6340
i32.const 0
i32.store
)
(func $Multiplier2_0_create (type $_t_i32ri32)
 (param $signaloffset i32)
(result i32)
 (local $offset i32)
 (local $merror i32)
i32.const 6320
i32.load
local.set $offset
local.get $offset
i32.const 0
i32.store
local.get $offset
local.get $signaloffset
i32.store offset=4
local.get $offset
i32.const 2
i32.store offset=8
i32.const 6320
local.get $offset
i32.const 12
i32.add
i32.store
local.get $offset
)
(func $Multiplier2_0_run (type $_t_i32ri32)
 (param $offset i32)
(result i32)
 (local $cstack i32)
 (local $signalstart i32)
 (local $subcmp i32)
 (local $subcmpload i32)
 (local $ioinfo i32)
 (local $lvar i32)
 (local $expaux i32)
 (local $temp i32)
 (local $aux0 i32)
 (local $aux1 i32)
 (local $aux2 i32)
 (local $counter i32)
 (local $storeaux1 i32)
 (local $storeaux2 i32)
 (local $copycounter i32)
 (local $calllvar i32)
 (local $createloopsubcmp i32)
 (local $createloopoffset i32)
 (local $createloopcounter i32)
 (local $merror i32)
i32.const 0
i32.load
local.set $lvar
local.get $lvar
i32.const 0
i32.add
local.set $expaux
i32.const 120
call $reserveStackFr
local.set $cstack
;; start of the template code
local.get $offset
i32.const 4
i32.add
i32.load
local.set $signalstart
;; store bucket. Line 13
;; getting dest
;; value bucket
i32.const 0
;; end of value bucket
i32.const 40
i32.mul
local.get $signalstart
i32.add
;; getting src
;; compute bucket
local.get $expaux
i32.const 0
i32.add
;; load bucket
;; value bucket
i32.const 1
;; end of value bucket
i32.const 40
i32.mul
local.get $signalstart
i32.add
;; end of load bucket
;; load bucket
;; value bucket
i32.const 2
;; end of value bucket
i32.const 40
i32.mul
local.get $signalstart
i32.add
;; end of load bucket
;; OP(MUL)
call $Fr_mul
local.get $expaux
i32.const 0
i32.add
;; end of compute bucket
call $Fr_copy
;; end of store bucket
i32.const 0
local.get $cstack
i32.store
i32.const 0
)
(table $runsmap 1 1 funcref)
(elem $runsmap (i32.const 0)
 $Multiplier2_0_run
)
(data (i32.const 88) "\fe\00\00\00\00\00\00\00")
(data (i32.const 128) "\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
(data (i32.const 608) "\01\00\00\f0\93\f5\e1C\91p\b9yH\e83(]X\81\81\b6EP\b8)\a01\e1rNd0")
(data (i32.const 640) "\fb\ff\ffO\1c4\96\ac)\cd`\9f\95v\fc6.Fyxo\a3nf/\df\07\9a\c1w\0a\0e")
(data (i32.const 672) "\a7m!\aeE\e6\b8\1b\e3Y\5c\e3\b1:\feS\85\80\bbS=\83I\8c\a5DN\7f\b1\d0\16\02")
(data (i32.const 704) "@\00\bf\b4\e1\d8\94^\b8\b6\fb\1c\be\9cH*\ed\cf\9f\a1d\c6<\89|e\cc\7fKY\f8\0c")
(data (i32.const 736) "\fb\ff\ffO\1c4\96\ac)\cd`\9f\95v\fc6.Fyxo\a3nf/\df\07\9a\c1w\0a\0e")
(data (i32.const 768) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
(data (i32.const 800) "\00\00\00\f8\c9\fa\f0\a1H\b8\dc<$\f4\19\94.\ac\c0@\db\22(\dc\14\d0\98p9'2\18")
(data (i32.const 832) "\01\00\00\f8\c9\fa\f0\a1H\b8\dc<$\f4\19\94.\ac\c0@\db\22(\dc\14\d0\98p9'2\18")
(data (i32.const 864) "\e6\ff\ff\9f\f9\0e\0d\1b?\91*\a3\a3h\ba\ea\89\06\dd\d8v\eb\d8G\c3\bb\f5 U\08\d0\15")
(data (i32.const 896) "?Y\1f>\14\09\97\9b\87\84>\83\d2\85\15\18h[\04\85\9b\02\1a\13.\e7D\06\03\00\00\00")
(data (i32.const 928) "\9c=\d1\80Usnc\d6\ffE$t\f3+\a2\d8\03\b2\1e\c0*EV\e7\f9c)\94\ef`\18")
(data (i32.const 960) "\a0\ac\0f\1f\8a\84\cb\cdCB\9fA\e9\c2\0a\0c\b4-\82\c2M\01\8d\09\97s\22\83\01\00\00\00")
(data (i32.const 1920) "\00\00\00\f8\c9\fa\f0\a1H\b8\dc<$\f4\19\94.\ac\c0@\db\22(\dc\14\d0\98p9'2\18")
(data (i32.const 0) "\b8\1a\00\00")
(data (i32.const 1952) "\01\00\00\f0\93\f5\e1\43\91\70\b9\79\48\e8\33\28\5d\58\81\81\b6\45\50\b8\29\a0\31\e1\72\4e\64\30")
(data (i32.const 1984) "\00\00\00\00\00\00\00\80")
(data (i32.const 2032) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\8c\ec\01\86\4c\dc\63\af\02\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\a5\f1\01\86\4c\df\63\af\03\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
(data (i32.const 6140) "\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00")
(data (i32.const 6160) "\00\00\00\00\00\00\00\80\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
(data (i32.const 6336) "\00\00\00\00")
(data (i32.const 6340) "")
(data (i32.const 6340) "")
(data (i32.const 6600) "Error in template Multiplier2_0\00")
(data (i32.const 6840) "")
)