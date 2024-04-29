include inout.asm
 .MODEL SMALL,c 
.STACK 800
.DATA
   arr DB 20 DUP('$')
    arr2 DB 20 DUP('$')
    msg1 DB "Enter a string: $"
    msg2 DB "Reversed string: $"
	msg3 DB "original string: $"
.CODE
 .startup
  
    
    call puts,offset msg1
    call gets, offset arr
	
	call endl
    call puts,offset msg3
    call puts,offset arr
	call endl
	
	
    MOV SI, OFFSET arr  ; 
    MOV DI, OFFSET arr2
    MOV CX, 0

rLoop:
    MOV AL, [SI]
    CMP AL, '$'           
    JE nn
    INC SI
    INC CX
    JMP rLoop

nn:
    MOV SI, SI  

next:
    DEC SI
    MOV AL, [SI]
    MOV [DI], AL
    INC DI
    LOOP next

  
    MOV byte ptr[DI], '$'
	call endl
    call puts, offset msg2
    MOV DX, offset arr2
    call puts, DX

.Exit
END 