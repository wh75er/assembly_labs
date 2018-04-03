
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

factorial PROC

	push bp
	mov bp, sp
	push si
	push di
	
	mov bx,[bp+4]
	cmp bx,1
	jg continue
	jle exit

	continue:
		mov dx,bx
		mul dx
		dec bx

		push bx
		call factorial
		add sp,2
	
	exit:
		pop di
		pop si
		pop bp
		ret

factorial ENDP


_begin:
	mov ax,DSEG
	mov ds,ax
	
	mov ax,1
	push M
	call factorial
	add sp,2
	mov fakt1,ax
	
	mov ax,4ch	
	int 21h

CSEG      ENDS
end _begin

