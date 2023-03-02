;replace instances of 0ah in a string with 65h

.model tiny
.data
array1 db 91h,02h,83h,0ah,75h,0ah,47h,012h,76h,61h
.code
.startup
lea si,array1
mov cl,10
mov al,0ah
mov bl,65h

label1: cmp al,[si]
        jnz label2
        mov [si],bl
label2: inc si
        dec cl
        jnz label1

.exit
end