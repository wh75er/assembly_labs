EXTRN Next:far
PUBLIC X

SSTACK     SEGMENT para stack 'STACK'
                    DB   256 DUP('STACK____')
SSTACK         ENDS

DS1		SEGMENT para 'DATA'
		X	db	'X'
DS1		ENDS

CS1		SEGMENT para public 'CODE'
	assume	cs:CS1, ds:DS1

Start:
	mov ax,DS1
	mov ds,ax
	
	jmp Next

CS1 ENDS
END Start
