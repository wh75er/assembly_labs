PUBLIC	binWithSign
EXTRN	binWithoutSign:NEAR



sstack SEGMENT STACK
	DB 128 DUP(?)
sstack ENDS



CSEG	SEGMENT	PUBLIC
	ASSUME CS:CSEG, SS:sstack
binWithSign	PROC	NEAR

	CMP		AX,0
	JGE		LO2S_SkipMinus

	PUSH	AX
	MOV		AH,2h
	MOV		DL,'-'
	INT		21h
	POP		AX
	NEG		AX

LO2S_SkipMinus:
	CALL	binWithoutSign

	ret
	
binWithSign		ENDP
_begin:

	mov ax,5
	call binWithSign
	
	mov ah,4ch
	int 21h

CSEG	ENDS

END _begin
