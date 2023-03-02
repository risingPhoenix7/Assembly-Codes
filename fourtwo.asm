;replace a substring if exists with a star
.model tiny
.data
string1 db 'BITSIOTLAB'
string2 db 'IOTA'
string1length db 10
string2length db 4

.code
.startup

lea si,string1
lea di,string2
mov cl,string1length
mov ch,string2length
point1: mov al,[si]
        cmp al,[di]
        jz point2
        inc si
        dec cl
        jnz point1
        jmp point5
point2: dec cl
        dec ch
        jz point3
        inc di
        inc si
        mov al,[si]
        cmp al,[di]
        jz point2
        mov ch,string2length
        inc si
        lea di,string2
        jmp point1

point3: mov bl,cl
        dec bl
        mov bh,bl
        mov cl,string2length
        mov ch,00h
        mov di,si
        sub di,cx
        inc di
        mov al,42
        mov [di],al
        inc di
        inc si
point4: mov bh,[si]
        mov [di],bh
        inc si
        inc di
        dec bl
        jnz point4

point5:
.exit
end