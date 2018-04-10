
PUBLIC showMenu

         DSEG          SEGMENT PUBLIC
                FAKT1           DW              ?
                FAKT2           DW              ?
                l1              DB      '0. show menu', '$'
                l2              DB      '1. input digit', '$'
                l3              DB      '2. binary without sign', 0DH, '$'
                l4              DB      '3. binary with sign', 0DH, '$'
                l5              DB      '4. decamial without sign', 0DH, '$'
                l6              DB      '5. decamial with sign', 0DH, '$'
                l7              DB      '6. hex without sign', 0DH, '$'
                l8              DB      '7. hex with sign', 0DH, '$'
                l9              DB      '8. exit', 0DH, '$'
         DSEG          ENDS


CSEG	SEGMENT	PUBLIC
	ASSUME CS:CSEG, DS:DSEG


showMenu	PROC	NEAR
	push	ax
	push	dx
	
	mov		ah,9

	lea dx,l1
	int 21h
	
	lea dx,l2
	int 21h

	mov ah, 08h
	int 21h
	
;	lea dx,l3
;	int 21h

;	lea dx,l4
;	int 21h

;	lea dx,l5
;	int 21h

;	lea dx,l6
;	int 21h

;	lea dx,l7
;	int 21h

;	lea dx,l8
;	int 21h

;	lea dx,l9
;	int 21h


	pop		dx
	pop		ax
	ret

showMenu	ENDP

CSEG	ENDS

END
