;; TeenyWeenyForth compiler WAT output
(module
  (import "twforth" "print" (func $print (param i32)))
  (import "twforth" "emit" (func $emit (param i32)))
  (func $main
    (export "main")
    (local $tmp1 i32)
    (local $tmp2 i32)
    i32.const 1
    i32.const 10
    local.set $tmp1
    local.get $tmp1
    local.get $tmp1
    block $break
    loop $top
    i32.eqz
    br_if $break
    local.set $tmp1
    local.set $tmp2
    local.get $tmp1
    local.get $tmp2
    local.set $tmp1
    local.get $tmp1
    local.get $tmp1
    call $print
    i32.const 10
    call $emit
    i32.const 1
    i32.add
    local.set $tmp1
    local.set $tmp2
    local.get $tmp1
    local.get $tmp2
    i32.const 1
    i32.sub
    local.set $tmp1
    local.get $tmp1
    local.get $tmp1
    br $top
    end ;; loop
    end ;; block
    drop
    drop
  )
)
