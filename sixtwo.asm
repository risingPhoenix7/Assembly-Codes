;take 2 inputs and write to 2 files

.model tiny
.data
fname1 db 'name.txt',0
fname2 db 'id.txt',0
handle1 dw ?
handle2 dw ?

msg1 db 'Enter your name :$'
msg2 db 0ah,'Enter your ID :$'


max1 db 32
act1 db ?
inp1 db 32 dup('$')

max2 db 32
act2 db ?
inp2 db 32 dup('$')


.code
.startup
;cout<<msg1
lea dx,msg1
mov ah,09h
int 21h

;cin>>str1
lea dx,max1
mov ah,0ah
int 21h

;cout<<msg2
lea dx,msg2
mov ah,09h
int 21h

;cin>>str2
lea dx,max2
mov ah,0ah
int 21h


    ; Create files if it
    ; is not existing
    mov ah, 3ch
lea dx, fname1
mov cl, 1h
int 21h
mov handle1, ax

mov ah, 3ch
lea dx, fname2
mov cl, 1h
int 21h
mov handle2, ax


; open file1
mov ah, 3dh
mov al, 1h
lea dx, fname1
int 21h
mov handle1, ax

; write msg to file1
mov ah, 40h
mov bx, handle1
mov cl, act1
mov ch,0
lea dx, inp1
int 21h

; close file1
mov ah, 3eh
int 21h

; open file2
mov ah, 3dh
mov al, 1h
lea dx, fname2
int 21h
mov handle2, ax

; write msg to file2
mov ah, 40h
mov bx, handle2
mov cl, act2
mov ch,0
lea dx, inp2
int 21h

; close file2
mov ah, 3eh
int 21h


.exit
end
