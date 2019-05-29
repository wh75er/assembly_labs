PUBLIC	hexWithSign
EXTRN	hexWithoutSign:NEAR


sstack SEGMENT STACK
	DB 128h	DUP(?)
sstack ENDS



CSEG	SEGMENT	PUBLIC
	ASSUME CS:CSEG, SS:sstack
hexWithSign	PROC	NEAR

	push bp
	mov bp,sp
	push ax
	push dx
	push bx

	MOV		AX,[BP+4]
	CMP		AX,0
	JGE		LO16S_SkipMinus

	PUSH	AX

	MOV		AH,2h
	MOV		DL,'-'
	INT		21h
	POP		AX
	NEG		AX

LO16S_SkipMinus:
	push ax
	CALL	hexWithoutSign
	add sp,2

	pop bx
	pop dx
	pop ax
	mov sp,bp
	pop bp

	ret

hexWithSign	ENDP

_begin:
	mov ax,10
	push ax
	call hexWithSign
	add sp,2
	
	mov ah,4ch
	int 21h

CSEG	ENDS

END _begin
