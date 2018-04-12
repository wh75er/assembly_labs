PUBLIC	binWithoutSign


sstack 	SEGMENT STACK
	DB 256 DUP(?)
sstack 	ENDS


CSEG	SEGMENT	PUBLIC
	ASSUME CS:CSEG, SS:sstack



binWithoutSign	PROC	NEAR

	push bp
	mov bp,sp
	push ax
	push dx

	mov ax,[bp+4]

	cmp ax,0
	mov		dl,'0'
	mov 	si,1
	je _print

	mov		si,17

_shl_zero:
	shl		ax,1
	dec 	si
	jnc		_shl_zero
	inc 	dl
	jmp		_print

_shl:
	mov		dl,'0'
	shl		ax,1
	jnc		_print
	inc		dl

_print:
	push	ax
	mov		ah,2
	int		21h
	pop		ax
	dec		si
	jnz		_shl

	pop dx
	pop ax
	mov sp,bp
	pop bp

	ret
	
binWithoutSign	ENDP

_begin:

	mov ax,1
	push ax
	call binWithoutSign
	add sp,2
	
	mov	ah,4ch
	int 21h

CSEG	ENDS

END _begin
