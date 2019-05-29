PUBLIC showMenu

sstack 	SEGMENT STACK
	DB 256 DUP(?)
sstack	ENDS

         DSEG          SEGMENT PUBLIC
                l1              DB      13, 10, '0. show menu', 13, 10, '$'
                l2              DB      '1. input digit', 13, 10, '$'
                l3              DB      '2. binary without sign', 13, 10, '$'
                l4              DB      '3. binary with sign', 13, 10, '$'
                l5              DB      '4. decamial without sign', 13, 10, '$'
                l6              DB      '5. decamial with sign', 13, 10, '$'
                l7              DB      '6. hex without sign', 13, 10, '$'
                l8              DB      '7. hex with sign', 13, 10, '$'
                l9              DB      '8. exit', 13, 10, '$'
         DSEG          ENDS


CSEG	SEGMENT	PUBLIC
	ASSUME CS:CSEG, DS:DSEG


showMenu	PROC	NEAR

	push	ax
	push	dx

	mov		ah,9

	mov dx,offset l1
	int 21h
	
	mov dx,offset l2
	int 21h

	mov dx,offset l3
	int 21h

	mov dx,offset l4
	int 21h

	mov dx,offset l5
	int 21h

	mov dx,offset l6
	int 21h

	mov dx,offset l7
	int 21h

	mov dx,offset l8
	int 21h

	mov dx,offset l9
	int 21h

	pop		dx
	pop		ax

	ret

showMenu	ENDP

_begin:
	mov ax,DSEG
	mov DS,ax

	call showMenu

	mov ah,4ch
	int 21h

CSEG	ENDS

END _begin
