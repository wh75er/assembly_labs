PUBLIC	binWithSign
EXTRN	binWithoutSign:NEAR



sstack SEGMENT STACK
	DB 128 DUP(?)
sstack ENDS



CSEG	SEGMENT	PUBLIC
	ASSUME CS:CSEG, SS:sstack
binWithSign	PROC	NEAR
	
	push bp
	mov bp,sp
	push ax
	mov ax,[bp+4]

	CMP		AX,0
	JGE		LO2S_SkipMinus

	PUSH	AX
	MOV		AH,2h
	MOV		DL,'-'
	INT		21h
	POP		AX
	NEG		AX

LO2S_SkipMinus:
	push ax
	CALL	binWithoutSign
	add sp,2

	pop ax
	mov sp,bp
	pop bp

	ret
	
binWithSign		ENDP
_begin:

	mov ax,7
	push ax
	call binWithSign
	add sp,2
	
	mov ah,4ch
	int 21h

CSEG	ENDS

END _begin
