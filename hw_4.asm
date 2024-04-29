include inout.asm
.MODEL SMALL, C
.486
.STACK 800
.DATA
    num DW ?
    binary DB 17 DUP('$');
    msg1 DB "Enter an integer: $"
    msg2 DB "in Binary : $"
.CODE
.startup

   
    call puts, offset msg1
    call getint
    mov num, ax
    mov cx, 16 
    mov di, 16 
ag:
    shr num, 1
    jc setBit ; Jump if carry flag is set 
    mov byte ptr [binary + di - 1], '0' 
    jmp next
setBit:
    mov byte ptr [binary + di - 1], '1'
next:
    dec di
    loop ag
    mov byte ptr [binary + 16], '$'
    call puts, offset msg2
    mov dx, offset binary
    call puts, dx

    .Exit
    END
