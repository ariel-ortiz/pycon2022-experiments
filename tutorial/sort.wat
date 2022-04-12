
(module

  (import "bf" "putchar" (func $putchar (param i32)))
  (import "bf" "getchar" (func $getchar (result i32)))
  (memory 1)

  (func $main
    (export "main")
    (local $ptr i32)

    ;; Operator [
    block $break_0
    loop $top_0
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_0

    ;; Operator .
    local.get $ptr
    i32.load8_u
    call $putchar

    ;; Operator -
    local.get $ptr
    local.get $ptr
    i32.load8_u
    i32.const 1
    i32.sub
    i32.store8

    ;; Operator -
    local.get $ptr
    local.get $ptr
    i32.load8_u
    i32.const 1
    i32.sub
    i32.store8

    ;; Operator .
    local.get $ptr
    i32.load8_u
    call $putchar

    ;; Operator .
    local.get $ptr
    i32.load8_u
    call $putchar

    ;; Operator ]
    br $top_0
    end ;; $top_0
    end ;; $break_0

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator ,
    local.get $ptr
    call $getchar
    i32.store8

    ;; Operator [
    block $break_0
    loop $top_0
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_0

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator ,
    local.get $ptr
    call $getchar
    i32.store8

    ;; Operator ]
    br $top_0
    end ;; $top_0
    end ;; $break_0

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator [
    block $break_0
    loop $top_0
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_0

    ;; Operator [
    block $break_1
    loop $top_1
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_1

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator ]
    br $top_1
    end ;; $top_1
    end ;; $break_1

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator [
    block $break_1
    loop $top_1
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_1

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator [
    block $break_2
    loop $top_2
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_2

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

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator +
    local.get $ptr
    local.get $ptr
    i32.load8_u
    i32.const 1
    i32.add
    i32.store8

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator -
    local.get $ptr
    local.get $ptr
    i32.load8_u
    i32.const 1
    i32.sub
    i32.store8

    ;; Operator ]
    br $top_2
    end ;; $top_2
    end ;; $break_2

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator [
    block $break_2
    loop $top_2
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_2

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

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator [
    block $break_3
    loop $top_3
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_3

    ;; Operator -
    local.get $ptr
    local.get $ptr
    i32.load8_u
    i32.const 1
    i32.sub
    i32.store8

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator ]
    br $top_3
    end ;; $top_3
    end ;; $break_3

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator [
    block $break_3
    loop $top_3
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_3

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator ]
    br $top_3
    end ;; $top_3
    end ;; $break_3

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator -
    local.get $ptr
    local.get $ptr
    i32.load8_u
    i32.const 1
    i32.sub
    i32.store8

    ;; Operator ]
    br $top_2
    end ;; $top_2
    end ;; $break_2

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator [
    block $break_2
    loop $top_2
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_2

    ;; Operator [
    block $break_3
    loop $top_3
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_3

    ;; Operator -
    local.get $ptr
    local.get $ptr
    i32.load8_u
    i32.const 1
    i32.sub
    i32.store8

    ;; Operator ]
    br $top_3
    end ;; $top_3
    end ;; $break_3

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator [
    block $break_3
    loop $top_3
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_3

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

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator -
    local.get $ptr
    local.get $ptr
    i32.load8_u
    i32.const 1
    i32.sub
    i32.store8

    ;; Operator ]
    br $top_3
    end ;; $top_3
    end ;; $break_3

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator [
    block $break_3
    loop $top_3
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_3

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator +
    local.get $ptr
    local.get $ptr
    i32.load8_u
    i32.const 1
    i32.add
    i32.store8

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator -
    local.get $ptr
    local.get $ptr
    i32.load8_u
    i32.const 1
    i32.sub
    i32.store8

    ;; Operator ]
    br $top_3
    end ;; $top_3
    end ;; $break_3

    ;; Operator ]
    br $top_2
    end ;; $top_2
    end ;; $break_2

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator [
    block $break_2
    loop $top_2
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_2

    ;; Operator [
    block $break_3
    loop $top_3
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_3

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator +
    local.get $ptr
    local.get $ptr
    i32.load8_u
    i32.const 1
    i32.add
    i32.store8

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator -
    local.get $ptr
    local.get $ptr
    i32.load8_u
    i32.const 1
    i32.sub
    i32.store8

    ;; Operator ]
    br $top_3
    end ;; $top_3
    end ;; $break_3

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator ]
    br $top_2
    end ;; $top_2
    end ;; $break_2

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator ]
    br $top_1
    end ;; $top_1
    end ;; $break_1

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator [
    block $break_1
    loop $top_1
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_1

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

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

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator -
    local.get $ptr
    local.get $ptr
    i32.load8_u
    i32.const 1
    i32.sub
    i32.store8

    ;; Operator ]
    br $top_1
    end ;; $top_1
    end ;; $break_1

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator >
    local.get $ptr
    i32.const 1
    i32.sub
    local.set $ptr

    ;; Operator ]
    br $top_0
    end ;; $top_0
    end ;; $break_0

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator [
    block $break_0
    loop $top_0
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_0

    ;; Operator .
    local.get $ptr
    i32.load8_u
    call $putchar

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator <
    local.get $ptr
    i32.const 1
    i32.add
    local.set $ptr

    ;; Operator ]
    br $top_0
    end ;; $top_0
    end ;; $break_0

    ;; Operator [
    block $break_0
    loop $top_0
    local.get $ptr
    i32.load8_u
    i32.eqz
    br_if $break_0

    ;; Operator .
    local.get $ptr
    i32.load8_u
    call $putchar

    ;; Operator ]
    br $top_0
    end ;; $top_0
    end ;; $break_0

  )
)

