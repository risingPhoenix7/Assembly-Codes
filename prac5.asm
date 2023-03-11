;An array of data is stored in data segment starting from ARRAY. The number of elements in the
;array is stored in location COUNT. Write an ALP to find the minimum number and the
;displacement at which it is stored. The number must be stored in memory location MIN and the
;address of the number in memory location MINADDR.


;couldnt do it with only string ops


.model tiny
.data
ARRAY db 'gfhaystdgahausyshdgb'
COUNT db 20
MIN db ?
MINADDR dw ?


.code
.startup

lea di,ARRAY
mov cl,COUNT
mov ch,00
mov al,0FFh
mov dx,di

stringop:
    cmp al,[di]
    jbe continue
    mov al,[di]
    mov dx,di
    continue:
        inc di
        loop stringop

mov MIN,al
mov MINADDR,dx

.exit
end