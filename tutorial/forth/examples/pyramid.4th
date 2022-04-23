( Program: Draw a pyramid of stars with base size n )

62 emit bl ( print prompt )
input n!
1 i! do
    i n <= ?
    i j! do
        j 0 > ?
        42 emit
        j 1 - j!
    loop
    cr
    i 1 + i!
loop
