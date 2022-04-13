;; TeenyWeenyForth compiler WAT output
(module
  (import "twforth" "print" (func $print (param i32)))
  (import "twforth" "emit" (func $emit (param i32)))
  (func $main
    (export "main")
    (local $tmp1 i32)
    (local $tmp2 i32)
    i32.const 20
    i32.const 14
    i32.sub
    i32.const 4
    i32.const 3
    i32.add
    i32.mul
    local.set $tmp1
    local.get $tmp1
    local.get $tmp1
    call $print
    i32.const 10
    call $emit
    call $print
  )
)
