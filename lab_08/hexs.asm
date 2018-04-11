PUBLIC	hexWithSign
EXTRN	hexWithoutSign:NEAR


sstack SEGMENT STACK
	DB 128h	DUP(?)
sstack ENDS



CSEG	SEGMENT	PUBLIC
	ASSUME CS:CSEG, SS:sstack
hexWithSign	PROC	NEAR

	CMP		AX,0
	JGE		LO16S_SkipMinus

	PUSH	AX

	MOV		AH,2h
	MOV		DL,'-'
	INT		21h
	POP		AX
	NEG		AX

LO16S_SkipMinus:
	CALL	hexWithoutSign

	ret

hexWithSign	ENDP

_begin:
	mov ax,10
	call hexWithSign
	
	mov ah,4ch
	int 21h

CSEG	ENDS

END _begin
