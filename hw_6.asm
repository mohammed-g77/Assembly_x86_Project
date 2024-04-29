include inout.asm
.model small, C
.486
.stack 
.data

.CODE
.startup

Mov BX, 0b800h
Mov ES , BX 
xor Di,Di;
Mov Cx ,80*25 
ag:
Mov ax,ES:[Di] 
CMP al, ' ';
JNE Ignore 
Mov al,'@'
Ignore:
Mov ES:[Di],ax
Add Di ,2
loop ag

.EXIT 

END