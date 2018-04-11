PUBLIC	decWithoutSign

sstack SEGMENT STACK
	DB	128h DUP(?)
sstack ENDS


CSEG	SEGMENT	PUBLIC
	ASSUME CS:CSEG, SS:sstack
decWithoutSign	PROC	NEAR

		MOV		BX,10

		PUSH	AX

LO10_Div1:
		MOV		DX,0
		DIV		BX	
		PUSH	AX
		MOV		AH,2
		MOV		DL,'a'
		INT		21h
		POP		AX	
		CMP		AX,0	
		JNE		LO10_Div1

		MOV	AH,2
		MOV DL,8
		INT 21h

		POP		AX

	LO10_Div2:
		MOV		DX,0
		DIV		BX
		PUSH	AX	
		MOV		AH,2
		ADD		DL,'0'
		INT		21h
		MOV		DL,8
		INT		21h
		INT		21h
		POP		AX	
		CMP		AX,0	
		JNE		LO10_Div2


	ret

decWithoutSign	ENDP

_begin:
	
	mov ax,5
	call decWithoutSign

	mov ah,4ch
	int 21h

CSEG	ENDS

END _begin
