BigBrain :

#Every byte is set to one at the beginning.

#Operations (Always executes with current byte and right of cursor) :

+
-
*
/
=
^
: (root)
$ (resets current byte to 1)
_ (concatination)

#Movement :

>
<

#Byte Movement :

? Moves byte to the left
! Moves byte to the right

#Inputting / Outputting :

.

#Loops :

[
    #Stops when back to a byte that is equal to 0
]

{
    #Stops when back to a byte that is equal to 1
}
