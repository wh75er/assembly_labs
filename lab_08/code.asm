EXTRN	showMenu:NEAR
EXTRN 	digitEntry:NEAR
EXTRN	binWithoutSign:NEAR
EXTRN	binWithSign:NEAR
EXTRN	decWithoutSign:NEAR
EXTRN	decWithSign:NEAR



         SSTACK     SEGMENT STACK
                    DB   256 DUP('STACK____')
         SSTACK     ENDS

         DSEG          SEGMENT PUBLIC
			list 	DW	__showMenu, __digitEntry, __binWithoutSign, __binWithSign, __decWithoutSign, __decWithSign, __hexWithoutSign, __hexWithSign
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

__showMenu PROC

	push ax
	push dx

	call showMenu

	pop dx
	pop ax
	
	ret
	
__showMenu ENDP

__digitEntry PROC
	
	push bx
	push dx
	push si

	call digitEntry

	pop si
	pop dx
	pop bx
	
	ret

__digitEntry ENDP

__binWithoutSign PROC

	push bp
	mov bp,sp
	push ax
	push dx
	push si

	call __nl
	mov ax,[bp+4]
	call binWithoutSign

	pop si
	pop dx
	pop ax
	mov sp, bp
	pop bp

	ret

__binWithoutSign ENDP

__binWithSign PROC

	push bp
	mov bp,sp
	push ax
	push dx
	push si

	call __nl
	mov ax,[bp+4]
	call binWithSign

	pop si
	pop dx
	pop ax
	mov sp,bp
	pop bp

	ret

__binWithSign ENDP

__decWithoutSign PROC
	
	push bp
	mov bp,sp
	push ax
	push dx
	push bx
	
	call __nl
	mov ax,[bp+4]
	call decWithoutSign

	pop bx
	pop dx
	pop ax
	mov sp,bp
	pop bp

	ret

__decWithoutSign ENDP

__decWithSign PROC
	push bp
	mov bp,sp
	push ax
	push dx
	push bx

	call __nl
	mov ax,[bp+4]
	call decWithSign

	pop bx
	pop dx
	pop ax
	mov sp,bp
	pop bp

	ret

__decWithSign ENDP

__hexWithoutSign PROC
	ret
__hexWithoutSign ENDP

__hexWithSign PROC
	ret
__hexWithSign ENDP



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
				
				_calling:	call list[bx]

				cmp bl,2
				jne _loop
			
				mov k,ax

				jmp _loop

	_exit:	mov ah,4ch
			int 21h

CSEG      ENDS
end _begin

