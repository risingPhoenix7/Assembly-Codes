;An array of data is stored in data segment starting from ARRAY. The number of elements in the
;array is stored in location COUNT. Write an ALP to arrange these number in the ascending order.
;Also store the value of the second largest number in the array in location SECMAX.

.model tiny
.data
ARRAY db 'asdfghjaoiayyatrewqa'
COUNT db 20
SECMAX db ?
ARRAY2 db 256 dup(0)

.code
.startup
lea si,ARRAY
mov cl,COUNT
mov ch,0
mov bx,1
mov ah,00

countall:
    lea di, ARRAY2
    lodsb
    add di,ax
    add [di],bl
    loop countall

mov bx,0
mov cl,0FFh
mov ch,0
lea si,ARRAY2
lea di,ARRAY

fillarray:
    mov bl,cl
    lodsb
    mov cl,al
    mov al,0FFh
    sub al,bl
    rep stosb
    mov cl,bl
    loop fillarray

mov cl,COUNT
mov ch,0
dec di
mov al,[di]
std
repe scasb
inc di
mov si,di
lea di,SECMAX
movsb

.exit
end