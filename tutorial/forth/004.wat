;; TeenyWeenyForth compiler WAT output
(module
  (import "twforth" "print" (func $print (param i32)))
  (import "twforth" "emit" (func $emit (param i32)))
  (func $main
    (export "main")
    (local $tmp1 i32)
    (local $tmp2 i32)
    i32.const 0
    local.set $tmp1
    block $break
      loop $top
        local.get $tmp1
        i32.eqz
        br_if $break
        i32.const 5
        call $print
        br $top
      end ;; loop
    end ;; block
  )
)
