;; TeenyWeenyForth compiler WAT output
(module
  (import "twforth" "print" (func $print (param i32)))
  (import "twforth" "emit" (func $emit (param i32)))
  (func $main
    (export "main")
    (local $_tmp1 i32)
    (local $_tmp2 i32)
    (local $i i32)
    (local $x i32)
    i32.const 10
    local.set $x
    i32.const 1
    local.set $i
    local.get $x
    local.get $i
    i32.add
    call $print
  )
)
