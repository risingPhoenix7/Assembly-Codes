;Write an ALP that will copy a set of 10 bytes from memory location loc1 to memory location loc2
;in the reverse order.
;only using string ops
.model tiny
.data

fromloc db 'abcdefghij'
toloc db 10 dup(0)

.code
.startup

lea di,toloc
add di,9
mov cx,10
lea si,fromloc
stringloop : 
    cld
    lodsb 
    std
    stosb
    loop stringloop
    
.exit
end