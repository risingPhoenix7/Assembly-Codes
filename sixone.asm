;read data from console and write to file
.model tiny
.data
str1 db 'Enter your name: $'

max1 db 32
act1 db ?
inp1 db 32 dup('$')
handle dw ?
fname db 'testing2.txt',0
.code
.startup

;cout<<enter your name

lea dx,str1
mov ah,09h
int 21h

;cin>>str
lea dx,max1
mov ah,0ah
int 21h

    ; Create a file if it
    ; is not existing
    mov ah, 3ch
lea dx, fname
mov cl, 1h
int 21h
mov handle, ax

; open file
mov ah, 3dh
mov al, 1h
lea dx, fname
int 21h
mov handle, ax

; write msg to file
mov ah, 40h
mov bx, handle
mov cl, act1
mov ch,0
lea dx, inp1
int 21h

; close file
mov ah, 3eh
int 21h


.exit
end