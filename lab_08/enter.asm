PUBLIC	digitEntry

sstack	SEGMENT STACK
	DB 256 DUP(?)
sstack	ENDS

DSEG	SEGMENT	PUBLIC
	doneMsg		DB	13, 10, '<entered>', 13, 10, '$'
	view		DB  13, 10, '> ', '$'
DSEG	ENDS

CSEG	SEGMENT	PUBLIC
	ASSUME CS:CSEG, SS:sstack


digitEntry	PROC	NEAR
		MOV		AX,0
		MOV		BX,0

		MOV		AH,9
		LEA		DX,view
		INT		21h
		MOV		DX,0

LII_Loop:
		MOV		AH,1
		INT		21h	

		CMP		AL,13
		JE		LII_Success

		CMP		AL,2Dh 
		JNE		LII_NotMinus
		MOV		SI,1
		JMP		LII_Loop 

LII_NotMinus:

		PUSH	AX
		MOV		AX,BX
		MOV		BX,10
		MUL		BX
		POP		BX	
		SUB		BL,'0'
		MOV		BH,0
		ADD		BX,AX
		JMP		LII_Loop

LII_Success:
		MOV	AX,BX
		CMP	SI,1
		JNE	LII_End	
		NEG	AX

LII_End:
		PUSH	AX
		LEA		DX,doneMsg
		MOV		AH,9
		INT		21h

		POP		AX

		RET

digitEntry	ENDP

_begin:
	mov ax,DSEG
	mov DS,ax

	call digitEntry
	
	mov ah,4ch
	int 21h

CSEG	ENDS

END	_begin
