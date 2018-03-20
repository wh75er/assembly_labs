SD1		SEGMENT para common 'DATA'
		org 2h
		c1	db	5
		c2 	db	8
SD1		ENDS

CSEG SEGMENT para public 'CODE'
	assume ds:SD1,cs:CSEG

Start:
	mov ax,SD1
	mov ds,ax

	mov ah,2

	mov dl,c1
	add dl,'0'
	int 21h

	mov dl,c2
	add dl,'0'
	int 21h

	mov ah,4ch
	int 21h

CSEG ENDS
END Start
