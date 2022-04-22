

(module

  (;
     This function computes the average of two 64-bit floating point
     numbers. It's equivalent to the following Python function:

     def avg2(a: float, b: float) -> float:
         return (a + b) / 2.0
  ;)
  (func $avg2       ;; Define a function called $avg2
    (export "avg2") ;; Export it outside this module as "avg2"
    (param $a f64)  ;; Declare parameter $a as 64-bit float
    (param $b f64)  ;; Declare parameter $b as 64-bit float
    (result f64)    ;; Function returns 64-bit float
    local.get $a    ;; Push $a
    local.get $b    ;; Push $b
    f64.add         ;; Pop two values, add them up, push result
    f64.const 2.0   ;; Push 2.0
    f64.div         ;; Pop two values, divide them, push result
  )

  (func $avg3
    (export "avg3")
    (param $a f64)
    (param $b f64)
    (param $c f64)
    (result f64)
    local.get $a
    local.get $b
    f64.add
    local.get $c
    f64.add
    f64.const 3
    f64.div
  )
)
