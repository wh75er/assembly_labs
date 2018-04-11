PUBLIC	hexWithoutSign


sstack SEGMENT STACK
	DB 128h	DUP(?)
sstack ENDS


DSEG	SEGMENT	PUBLIC
	simbols	DB	'0123456789ABCDEF'
DSEG	ENDS



CSEG	SEGMENT	PUBLIC
	ASSUME CS:CSEG, DS:DSEG, SS:sstack

hexWithoutSign	PROC	NEAR
	MOV		BX,16


	PUSH	AX

LO16_Div1:
		MOV		DX,0
		DIV		BX
		PUSH	AX
		MOV		AH,2
		MOV		DL,'a'
		INT		21h
		POP		AX
		CMP		AX,0
		JNE		LO16_Div1

		MOV	AH,2
		MOV DL,8
		INT 21h

		POP		AX

LO16_Div2:
		MOV		DX,0
		DIV		BX
		PUSH	AX

		PUSH	BX
		MOV   BX, OFFSET simbols
		MOV		AL, DL
		XLAT
		MOV		DL, AL
		POP 	BX
		MOV		AH,2
		JMP		LO16_Add0

LO16_AddA:
		ADD		DL,'A'
		SUB		DL,10

LO16_Add0:
		INT		21h
		MOV		DL,8
		INT		21h
		INT		21h
		POP		AX
		CMP		AX,0
		JNE		LO16_Div2


	ret

hexWithoutSign	ENDP

_begin:
	mov ax,DSEG
	mov ds,ax
	
	mov ax,10
	call hexWithoutSign
	
	mov ah,4ch
	int 21h

CSEG	ENDS

END _begin
