EXTRN Vid:far
         SSTACK     SEGMENT PARA STACK  'STACK'
                    DB   256 DUP('STACK____')
         SSTACK     ENDS

         DSEG          SEGMENT  PARA PUBLIC 'DATA'
        x         	DB	'R'
         DSEG          ENDS

CSEG      SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:CSEG,DS:DSEG,SS:SSTACK

main:
	push DS
	mov ax,0
	push ax

	mov ax,DSEG
	mov ds,ax

	jmp Vid

	mov ah,10h
	int 16h

	mov ax,4c00h
	int 21h
CSEG ends

public x

end main
