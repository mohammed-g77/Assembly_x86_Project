include inout.asm
.model small, c
.486

.STACK 8000

.DATA
    S db 200 dup(0)
    amsg db 13, 10, "PLEASE ENTER A STRING :$"
    bmsg db 13, 10, "UPPER_CONTR IS: $"

.CODE
    .STARTUP

    Call puts, offset amsg
    Call gets, offset S

    Lea di, S
    xor cx, cx ; count = 0

NEXT:
    Cmp byte PTR[di], '$'
    JE DONE
    Cmp byte PTR[di], 'A'
    JL nonUpper
    Cmp byte PTR[di], 'Z'
    JG nonUpper

    Inc cx ; count++

nonUpper:
    Inc di ; S++
    JMP NEXT

DONE:
    Call puts, offset bmsg
    Call putint, cx

    .EXIT
END