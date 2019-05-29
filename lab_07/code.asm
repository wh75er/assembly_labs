
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

fact_in_1 PROC
	
	push bp
	mov bp, sp

	mov bx, [bp+4]
	call fact_1 

	mov sp,bp
	pop bp
	ret

fact_in_1 ENDP

fact_1 PROC

	cmp bx, 1
	jne con
	mov ax, 1
	jmp ext

	con:
		dec bx
		call fact_1
		inc bx
		mul bx

	ext:
		ret

fact_1 ENDP


factorial_2 PROC

	push bp
	mov bp,sp
	push si

	mov bx, [bp+4]
	mov si, [bp+6]
	call fact_1 
	mov[si], ax

	pop si
	mov sp,bp
	pop bp
	ret

factorial_2 ENDP




_begin:
	mov ax,DSEG
	mov ds,ax
	
	push M
	call fact_in_1
	add sp,2
	mov fakt1,ax

	mov fakt2,4
	push fakt2
	push M
	call factorial_2
	add sp,2
	mov si,fakt2
	mov ax,[si]

	mov ax,4ch	
	int 21h

CSEG      ENDS
end _begin

