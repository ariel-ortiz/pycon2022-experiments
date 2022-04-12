
(module

  (import "bf" "putchar" (func $putchar (param i32)))
  (import "bf" "getchar" (func $getchar (result i32)))
  (memory 1)

  (func $main
    (export "main")
    (local $ptr i32)

    ;; Operator .
    local.get $ptr
    i32.load8_u
    call $putchar

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator +
    local.get $ptr
    local.get $ptr
    i32.load8_u
    i32.const 1
    i32.add
    i32.store8

    ;; Operator .
    local.get $ptr
    i32.load8_u
    call $putchar

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator .
    local.get $ptr
    i32.load8_u
    call $putchar

  )
)

