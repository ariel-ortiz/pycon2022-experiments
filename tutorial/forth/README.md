# ChiquiForth

## Easy Forth Tutorial

https://skilldrick.github.io/easyforth/#stack-manipulation

    1 + 2 * 3

in forth:

    1 2 + 3 *

## Operations

+ Plus +
+ Minus -
+ Multiplication *
+ Division /
+ Duplicate `dup`
+ Drop `drop`
+ Swap `swap`
+ Emit `emit` used to output numbers as ascii characters
+ Print `.`
+ Carriage return `cr`
+ Space `sp`
+ Comparisons `== != < <= > >=`
+ Conditional `if` body `fi`
+ Loop _N_ _M_ `loop` body `pool`

    1 10 loop . cr pool
