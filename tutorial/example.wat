;; Simple WebAssembly example.

(module

  (memory (export "the_memory") 1) ;; 1 64KB memory page
  (data (i32.const 0) "hola")

  (func $test_memory
    (export "test_memory")
    (local $i i32)

    block $break
      loop $top
        local.get $i
        i32.const 10
        i32.eq
        br_if $break

        local.get $i ;; offset
        local.get $i ;; value
        i32.const 2
        i32.mul
        i32.store8

        local.get $i
        i32.const 1
        i32.add
        local.set $i

        br $top
      end ;; loop
    end ;; block
  )

  (func $duplicate
    ;; Function signature: i32 duplicate(i32 $x)
    (export "duplicate")
    (param $x i32)
    (result i32)

    ;; Body of the function
    local.get $x
    i32.const 2
    i32.mul
  )

  (func $f2c
    (export "f2c")
    (param $f f32)
    (result f32)
    f32.const 5.0
    local.get $f
    f32.const 32.0
    f32.sub ;; $f - 32.0
    f32.mul ;; 5.0 * ($f - 32.0)
    f32.const 9.0
    f32.div ;; 5.0 * ($f - 32.0) / 9.0
  )

  (func $root
    (export "root")
    (param $a f64)
    (param $b f64)
    (param $c f64)
    (result f64)
    local.get $b
    local.get $b
    f64.mul
    f64.const 4.0
    local.get $a
    f64.mul
    local.get $c
    f64.mul
    f64.sub
    f64.sqrt
    local.get $b
    f64.sub
    f64.const 2.0
    local.get $a
    f64.mul
    f64.div
  )
)
