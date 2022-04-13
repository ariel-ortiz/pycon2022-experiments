;; TeenyWeenyForth compiler WAT output
(module
  (import "twforth" "print" (func $print (param i32)))
  (import "twforth" "emit" (func $emit (param i32)))
  (func $main
    (export "main")
    (local $tmp1 i32)
    (local $tmp2 i32)
    i32.const 33
    i32.const 100
    i32.const 108
    i32.const 114
    i32.const 111
    i32.const 119
    i32.const 32
    i32.const 44
    i32.const 111
    i32.const 108
    i32.const 108
    i32.const 101
    i32.const 72
    call $emit
    call $emit
    call $emit
    call $emit
    call $emit
    call $emit
    call $emit
    call $emit
    call $emit
    call $emit
    call $emit
    call $emit
    call $emit
    i32.const 10
    call $emit
  )
)
