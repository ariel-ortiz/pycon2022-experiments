( Prints al the powers of two from 0 to 10 )

0 i! do
    i 10 <= ?
    1 r! 1 j! do
        j i <= ?
        r 2 * r!
        j 1 + j!
    loop
    2 . 94 emit bl i . 61 emit bl r . ( print: 2 ^ i = r )
    cr
    i 1 + i!
loop
