SD1		SEGMENT para common 'DATA'
		c1	label byte	
		org 1h
		c2	label byte	
SD1		ENDS

CSEG SEGMENT para public 'CODE'
	assume ds:SD1,cs:CSEG

Start:
	mov ax,SD1
	mov ds,ax

	mov ah,2

	mov dl,c1
	int 21h

	mov dl,c2
	in 21h

	mov ah,4ch
	int 21h

CSEG ENDS
END Start
