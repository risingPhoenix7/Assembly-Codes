;count number of negative numbers
.model tiny
.data

array1 db 0CEh,0E7h,0ABh,22h,17h,0F7h,00h,17h
count db 8
neg1 db ?
.code
.startup
mov cl,count
mov ch,00
mov al,00
lea si,array1
label1: cmp [si],al
        jge label2
        inc ch
label2: inc si
        dec cl
        jnz label1
mov neg1,ch
.exit
end