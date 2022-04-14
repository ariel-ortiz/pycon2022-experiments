( Program: Draw a pyramid of stars with base size n )

10 n!
1 i!
do
    n ?
    i j!
    do
        j ?
        42 emit
        j 1 - j!
    loop
    cr
    n 1 - n!
    i 1 + i!
loop
