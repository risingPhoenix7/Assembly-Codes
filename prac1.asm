;Write an ALP that will examine a set of 20 memory locations that have alphabets and count the
;number of vowels. The alphabets are store from memory location alph1 and the count of the
;vowels must be stored in location vcnt.
; no usage of inc/dec for string ops

.model tiny
.data
 alph1 db 'aoiuthgyuisuwpoiazvc'
 count db 20
 vcnt db ?
 vowels db 'aeiou'
 numofvowels db 5
 temporarycount db ?

.code
.startup

mov bl,numofvowels
lea si,alph1
lea di,vowels
mov cl,count
mov dl,0

stringloop:
    mov temporarycount,cl
    lodsb
    mov cl,5
    vowelsloop:
        scasb
        jne notfoundvowel
        inc dl
        jmp resetloop
    notfoundvowel: 
        loop vowelsloop
    resetloop:
        lea di,vowels
        mov bl,numofvowels
        mov cl,temporarycount
        loop stringloop

mov vcnt,dl
.exit
end