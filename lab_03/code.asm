TITLE lab_02

         SSTACK     SEGMENT PARA STACK  'STACK'
                    DB   64 DUP('STACK____')
         SSTACK     ENDS

         DSEG          SEGMENT  PARA PUBLIC 'DATA'
        x         	DW      1,2,3,4,5
					DW		1,2,3,4,5
					DW		1,2,3,4,5
					DW		1,2,3,4,5
					DW		1,2,3,4,5
		nmax		DW		4
		n			DW		2
         DSEG          ENDS

 SUBTTL MAIN PROGRAM
 PAGE
         CSEG      SEGMENT PARA PUBLIC 'CODE'
                 ASSUME CS:CSEG,DS:DSEG,SS:SSTACK
_begin:
	mov ax,DSEG
	mov ds,ax
	mov cx,NMAX
	lea bx,x
	mov si,0
	mov dx,10
	diagonal:
		push cx
		push si
		push bx
		mov cx,nmax
		change_array:
			add si,n
			push x[bx][si]
			sub si,n
			add bx,dx
			push x[bx][si]
			sub bx,dx
			add si,n
			pop x[bx][si]
			sub si,n
			add bx,dx
			pop x[bx][si]
			sub bx,dx
			add n,2
			add dx,10
			loop change_array
		dec nmax
		mov dx,10
		mov n,2
		pop bx
		pop si
		pop cx
		add bx,10
		add si,2
		loop diagonal

	mov ah,10h
	int 16h

	int 20h
		

CSEG      ENDS
end _begin
