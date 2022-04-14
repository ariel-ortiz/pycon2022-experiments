;; TeenyWeenyForth compiler WAT output
(module
  (import "twforth" "print" (func $print (param i32)))
  (import "twforth" "emit" (func $emit (param i32)))
  (func $main
    (export "main")
    (local $_tmp1 i32)
    (local $_tmp2 i32)
    (local $r i32)
    (local $of i32)
    (local $from i32)
    (local $i i32)
    (local $j i32)
    (local $two i32)
    (local $the i32)
    (local $Prints i32)
    (local $al i32)
    (local $powers i32)
    (local $to i32)
    i32.const 0
    local.set $i
    block
    loop
    local.get $i
    i32.const 10
    i32.le_s
    i32.eqz
    br_if 1
    i32.const 1
    local.set $r
    i32.const 1
    local.set $j
    block
    loop
    local.get $j
    local.get $i
    i32.le_s
    i32.eqz
    br_if 1
    local.get $r
    i32.const 2
    i32.mul
    local.set $r
    local.get $j
    i32.const 1
    i32.add
    local.set $j
    br 0
    end ;; loop
    end ;; block
    i32.const 2
    call $print
    i32.const 94
    call $emit
    i32.const 32
    call $emit
    local.get $i
    call $print
    i32.const 61
    call $emit
    i32.const 32
    call $emit
    local.get $r
    call $print
    i32.const 10
    call $emit
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br 0
    end ;; loop
    end ;; block
  )
)
