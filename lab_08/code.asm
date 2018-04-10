EXTRN	showMenu:NEAR



         SSTACK     SEGMENT STACK
                    DB   256 DUP('STACK____')
         SSTACK     ENDS

         DSEG          SEGMENT PUBLIC
         DSEG          ENDS

 SUBTTL MAIN PROGRAM
 PAGE
         CSEG      SEGMENT PUBLIC
                 ASSUME CS:CSEG,DS:DSEG,SS:SSTACK

_begin:
	mov ax,DSEG
	mov ds,ax

	call showMenu

	mov ax,4ch
	int 21h

CSEG      ENDS
end _begin

