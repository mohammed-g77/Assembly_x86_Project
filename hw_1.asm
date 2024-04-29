include inout.asm
.model small,c

.stack

.data


l dw ?
w dw ?
Perimeter dw ?
inputL db "Please enter the length: $"
inputW db "Please enter the width: $"
output db "The perimeter of the rectangle is: $"

.code

start:
mov cx, @data
mov ds, cx

call puts, offset inputL
call getint
mov l,ax

call puts, offset inputW
call getint
mov w, ax

mov bx, l
add bx,w
add bx, bx ;  (2 * (l + w))

mov Perimeter, bx

call endl
call puts, offset output
call putint, Perimeter

mov ah, 4ch
xor al, al ; 
int 21h

end start
