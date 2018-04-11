PUBLIC	decWithSign
EXTRN	decWithoutSign:NEAR


sstack SEGMENT STACK
	DB 128h DUP(?)
sstack ENDS


CSEG	SEGMENT	PUBLIC
	ASSUME CS:CSEG, SS:sstack
decWithSign	PROC	NEAR

		CMP		AX,0
		JGE		LO10S_SkipMinus	
		PUSH	AX
		MOV		AH,2h
		MOV		DL,'-'
		INT		21h
		POP		AX
		NEG		AX

LO10S_SkipMinus:
		CALL 	decWithoutSign

		ret

decWithSign	ENDP

_begin:
	
	mov ax,5
	call decWithSign

	mov ah,4ch
	int 21h

CSEG	ENDS

END _begin
