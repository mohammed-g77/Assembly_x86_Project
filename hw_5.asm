include inout.asm
.model small, C
.486
.stack 
.data
    num dw ?
    msg db 13, 10, "Enter a number please: $"
   msg1 db 13, 10, "number is Emirp $"
    msg2 db 13, 10, "number is Not Emirp $"
	
.code

proc isPrime
   

    mov cx, 2
    mov dx, 0

    div cx ;

    
ag:
    cmp cx, ax
    jae notPrime

    mov ax, dx
    inc cx
    div cx

  or dx, dx
    jz iprime
    jmp ag

notPrime:

    ret
isPrime endp

proc isEmpirp
    LOCALS
    push AX
    push BX
    push DX

    call puts, offset msg
    call getint
    mov num, AX
    or AX, AX
    js done


    cmp AX, 3
    jle iprime

    mov BX, 2

next:
    mov AX, num
    cwd
    div BX
    or DX, DX
    jz isnotprime

    inc BX
    cmp BX, AX
    JL next

iprime:
    
    mov BX, 10
    mov AX, num

again:
    cwd
    div BX
    push AX
    push DX
    mov AX,num
    mul BX
    pop DX
    add AX, DX
    mov num, AX
    pop AX
    or AX, AX
    jnz again

    mov AX,num
    call isPrime
    jz isnotprime

    cmp AX, num
    je isnotprime

    call puts, offset msg1
    jmp done

isnotprime:
    call puts, offset msg2
    call endl

done:
    pop DX
    pop BX
    pop AX
    ret
isEmpirp endp

.startup
    call isEmpirp

.exit
end
