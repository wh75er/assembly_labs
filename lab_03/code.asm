TITLE lab_02

         SSTACK     SEGMENT PARA STACK  'STACK'
                    DB   256 DUP('STACK____')
         SSTACK     ENDS

         DSEG          SEGMENT  PARA PUBLIC 'DATA'
        x         	DW      1,2,3,4,5
					DW		1,2,3,4,5
					DW		1,2,3,4,5
					DW		1,2,3,4,5
					DW		1,2,3,4,5
		nmax		DW		4
         DSEG          ENDS

 SUBTTL MAIN PROGRAM
 PAGE
         CSEG      SEGMENT PARA PUBLIC 'CODE'
                 ASSUME CS:CSEG,DS:DSEG,SS:SSTACK
_begin:
	mov ax,DSEG
	mov ds,ax
	mov cx,NMAX
	mov si,0
	mov di,0
	mov dx,12
	diagonal:
		mov bx,cx
		mov cx,nmax
		change_array:
			add si,2
			add di,10
			xchg ax,x[si]
			xchg ax,x[di]
			xchg ax,x[si]
			loop change_array
		dec nmax
		mov cx,bx
		mov si,dx
		mov di,dx
		add dx,12
		loop diagonal



	mov cx,5
	mov si,0
	mov ah,2h
	print_array:
		push cx
		mov cx,4
		print_raw:
			push x[si]
			pop di
			add di,'0'
			mov dx,di
			int 21h
			add si,2
			loop print_raw
		add si,2
		mov di,0ah
		mov dx,di
		int 21h
		pop cx
		loop print_array
			

	mov ah,10h
	int 16h

	mov ah,4ch
	mov al,0
	int 21h
		

CSEG      ENDS
end _begin
