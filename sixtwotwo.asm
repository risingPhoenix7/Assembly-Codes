;take substrings from two files and write to third

.model tiny
.data
fname1 db 'name.txt',0
handle1 dw ?
fname2 db 'id.txt',0
handle2 dw ?
fname3 db 'splice.txt',0
handle3 dw ?

part1 db 15 dup('$')
part2 db 13 dup('$')

.code
.startup

; open file1
mov ah, 3dh
mov al, 0h
lea dx, fname1
int 21h
mov handle1, ax

;read file 1
mov ah,3fh
mov bx,handle1
mov cx,15
lea dx,part1
int 21h

; close file1
mov ah, 3eh
int 21h

; open file2
mov ah, 3dh
mov al, 0h
lea dx, fname2
int 21h
mov handle2, ax

;read file 2
mov ah,3fh
mov bx,handle2
mov cx,15
lea dx,part2
int 21h

; close file2
mov ah, 3eh
int 21h


   ; Create splice file if it
    ; is not existing
    mov ah, 3ch
lea dx, fname3
mov cl, 1h
int 21h
mov handle3, ax


; open splice file
mov ah, 3dh
mov al, 1h
lea dx, fname3
int 21h
mov handle3, ax

; write msg to file1
mov ah, 40h
mov bx, handle3
mov cl, 28
mov ch,0
lea dx, part1
int 21h

; close file1
mov ah, 3eh
int 21h





.exit
end
