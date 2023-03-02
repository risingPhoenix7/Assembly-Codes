#palindrome checker

.model tiny
.data
arkstring db 'wasitacatisaw'
res db ?
count dw 13
.code
.startup
lea si,arkstring
mov di,si
add di,count
dec di
mov cx,count
mov ah,01h

start : mov al,[di]
cmp al,[si]
jnz nopalindrome
dec di
inc si
dec cl
jz palindrome
dec cl
jnz start
palindrome: mov res,ah 
nopalindrome: 
.exit
end