;An array of data is stored in data segment starting at ARRAY. The number of elements in the array
;is stored in location COUNT. Write a program to count the number of occurrences of the element
;in CODE1 in the ARRAY and store this result in location RESULT.

.model tiny
.data
ARRAY db 'asdfghjaoiauyatrewqa'
COUNT db 20
CODE1 db 'a'
RESULT db ?

.code
.startup

mov al,CODE1
lea di,ARRAY
mov cl,COUNT
mov ch,00
mov bl,0

startofloop:
    SCASB
    jnz endofloop
    inc bl
    endofloop:
       loop startofloop

mov RESULT,bl

.exit
end