TITLE lab_02

         SSTACK     SEGMENT PARA STACK  'STACK'
                    DB   256 DUP('STACK____')
         SSTACK     ENDS

         DSEG          SEGMENT  PARA PUBLIC 'DATA'
        x         	DW      1,4,3,4,5,9,3,8
		nmax		DW		8
         DSEG          ENDS

 SUBTTL MAIN PROGRAM
 PAGE
         CSEG      SEGMENT PARA PUBLIC 'CODE'
                 ASSUME CS:CSEG,DS:DSEG,SS:SSTACK
_begin:
	mov ax,DSEG
	mov ds,ax
	lea bx,x
	dec nmax
	mov cx,nmax
	MainLoop:
		mov di,0
		mov si,2
		mov dx,cx
		mov ax,nmax
		sub ax,cx
		mov cx,nmax
		sub cx,ax
		InsideLoop:
			mov ax,[bx][si]
			cmp [bx][di],ax
			jle _go_forward
			jg _switch


			_switch: 
				xchg ax,[bx][di]
				xchg ax,[bx][si]
				xchg ax,[bx][di]

			_go_forward:
				add di,2
				add si,2
				loop InsideLoop

		mov cx,dx
		loop MainLoop


	mov ah,4ch
	int 21h
		

CSEG      ENDS
end _begin
