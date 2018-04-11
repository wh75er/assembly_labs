PUBLIC	binWithoutSign


sstack 	SEGMENT STACK
	DB 256 DUP(?)
sstack 	ENDS


CSEG	SEGMENT	PUBLIC
	ASSUME CS:CSEG, SS:sstack



binWithoutSign	PROC	NEAR

	mov		si,16


LO2_Shl1:
	mov		dh,0
	shl		ax,1
	jnc		LO2_Shl1_CF
	inc		dh
	jmp		LO2_Shl2_CF

LO2_Shl1_CF:
	dec		si	
	jnz		LO2_Shl1

LO2_Shl2:
	mov		dh,0
	shl		ax,1
	jnc		LO2_Shl2_CF
	inc		dh	

LO2_Shl2_CF:
	mov		dl,'0'
	add		dl,dh	
	push	ax
	mov		ah,2
	int		21h
	pop		ax
	dec		si
	jnz		LO2_Shl2

	ret
	
binWithoutSign	ENDP

_begin:

	mov ax,5
	call binWithoutSign
	
	mov	ah,4ch
	int 21h

CSEG	ENDS

END _begin
