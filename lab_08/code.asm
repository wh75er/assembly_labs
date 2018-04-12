EXTRN	showMenu:NEAR
EXTRN 	digitEntry:NEAR
EXTRN	binWithoutSign:NEAR
EXTRN	binWithSign:NEAR
EXTRN	decWithoutSign:NEAR
EXTRN	decWithSign:NEAR
EXTRN	hexWithoutSign:NEAR
EXTRN	hexWithSign:NEAR



         SSTACK     SEGMENT STACK
                    DB   256 DUP('STACK____')
         SSTACK     ENDS

         DSEG          SEGMENT PUBLIC
			list 	DW	showMenu, digitEntry, binWithoutSign, binWithSign, decWithoutSign, decWithSign, hexWithoutSign, hexWithSign
			k		DW	1
         DSEG          ENDS

 SUBTTL MAIN PROGRAM
 PAGE
         CSEG      SEGMENT PUBLIC
                 ASSUME CS:CSEG,DS:DSEG,SS:SSTACK

__nl	PROC
	push ax
	push dx

	mov ah,2
	mov dl,10
	int 21h

	mov dl,13
	int 21h

	pop dx
	pop ax

	ret
	
__nl	ENDP


_begin:
	mov ax,DSEG
	mov ds,ax

	call list

	_loop:	mov ah,10h
			int 16h

			cmp al,'8'
			je _exit
			ja _loop

			cmp al,'0'
			jb _loop

	_working:	mov bx,ax
				sub bl,'0'
				add bl,bl
				mov bh,0
		
				push k

				cmp bl,2
				jg _calling
				
				add sp,2
				
				_calling:	call __nl
							call list[bx]

				cmp bl,2
				jne _loop
			
				mov k,ax

				jmp _loop

	_exit:	mov ah,4ch
			int 21h

CSEG      ENDS
end _begin

