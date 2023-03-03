; takes in an alphabet entered by user and tells whether its 'a' (case insensitive)
; by printing out the result

.model tiny
.486
.data
string1 db 'The character entered is A',0Ah,'$'
str2 db 'The character entered is not A',0Ah,'$'
.code
.startup
	mov ah,07h
	int 21h
	mov bl,al
	mov bh,'a'
	mov cl,'A'
	cmp bh,bl
	jz point1
	cmp cl,bl
	jz point1
	lea dx,str2
	jmp point2
point1:	lea dx,string1
point2:	
	mov ah,09h
	int 21h
	


.exit
end