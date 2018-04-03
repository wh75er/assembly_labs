
         SSTACK     SEGMENT PARA STACK  'STACK'
                    DB   256 DUP('STACK____')
         SSTACK     ENDS

         DSEG          SEGMENT  PARA PUBLIC 'DATA'
        M         	DW      5
		FAKT1		DW		?
		FAKT2		DW		?
         DSEG          ENDS

 SUBTTL MAIN PROGRAM
 PAGE
         CSEG      SEGMENT PARA PUBLIC 'CODE'
                 ASSUME CS:CSEG,DS:DSEG,SS:SSTACK

factorial_1 PROC

	push bp
	mov bp,sp
	push si
	push di

	mov bx, [bp+4]
	cmp bx, 1
	jne con
	mov ax, 1
	jmp ext

	con:
		dec bx
		push bx
		call factorial_1
		mov bx, [bp+4]
		mul bx

	ext:
		pop di
		pop si
		mov sp,bp
		pop bp
		ret

factorial_1 ENDP





_begin:
	mov ax,DSEG
	mov ds,ax
	
	mov ax,1
	push M
	call factorial_1
	add sp,2
	mov fakt1,ax

	;mov fakt2,1
	;push fakt2
	;push M
	;call factorial_2
	;add sp,2
	;pop fakt2

	mov ax,4ch	
	int 21h

CSEG      ENDS
end _begin

