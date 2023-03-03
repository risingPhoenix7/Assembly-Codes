;takes in a string and changes and prints the string(and newline) with all small letters capitalised
;doesnt affect letters other than small letters

.model tiny
.486
.data
max1 db 32
act1 db ?
inp1 db 32 dup(0)
.code
.startup
;takes input and before that stores the size of input and max size of input
;i.e 20h
    lea DX, max1
    mov ah, 0ah
    int 21h


	inc dx
	mov si,dx
	mov bl,[si]
	mov cl,bl
	mov bh,32 ;32 is the difference between caps and small 
	point1:	inc si
		    mov bl,[si]
		    cmp bl,97
		    jl point2
            cmp bl,7Ah
            jg point2
		    sub [si],bh

point2:		dec cl
		    jnz point1

; to end the string $
mov bl,0ah
inc si
mov [si],bl
mov bl,'$'
inc si
mov [si],bl
lea dx,max1
mov ah,09h
int 21h
.exit
end
