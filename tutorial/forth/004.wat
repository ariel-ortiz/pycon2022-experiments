;; TeenyWeenyForth compiler WAT output
(module
  (import "twforth" "print" (func $print (param i32)))
  (import "twforth" "emit" (func $emit (param i32)))
  (func $main
    (export "main")
    (local $_tmp1 i32)
    (local $_tmp2 i32)
    (local $i i32)
    (local $n i32)
    (local $j i32)
    i32.const 5
    local.set $n
    i32.const 1
    local.set $i
    block
    loop
    local.get $n
    i32.eqz
    br_if 1
    local.get $i
    local.set $j
    block
    loop
    local.get $j
    i32.eqz
    br_if 1
    i32.const 42
    call $emit
    local.get $j
    i32.const 1
    i32.sub
    local.set $j
    br 0
    end ;; loop
    end ;; block
    i32.const 10
    call $emit
    local.get $n
    i32.const 1
    i32.sub
    local.set $n
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br 0
    end ;; loop
    end ;; block
  )
)
