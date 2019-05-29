PUBLIC	decWithSign
EXTRN	decWithoutSign:NEAR


sstack SEGMENT STACK
	DB 128h DUP(?)
sstack ENDS


CSEG	SEGMENT	PUBLIC
	ASSUME CS:CSEG, SS:sstack
decWithSign	PROC	NEAR

		push bp
		mov bp,sp
		push ax
		push dx
		push bx

		MOV		AX,[BP+4]
		CMP		AX,0
		JGE		LO10S_SkipMinus	
		PUSH	AX
		MOV		AH,2h
		MOV		DL,'-'
		INT		21h
		POP		AX
		NEG		AX

LO10S_SkipMinus:
		push ax
		CALL 	decWithoutSign
		add sp,2

		pop bx
		pop dx
		pop ax
		mov sp,bp
		pop bp

		ret

decWithSign	ENDP

_begin:
	
	mov ax,5
	push ax
	call decWithSign
	add sp,2

	mov ah,4ch
	int 21h

CSEG	ENDS

END _begin
