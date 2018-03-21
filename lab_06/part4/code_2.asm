EXTRN X:byte
PUBLIC Next

DS2		SEGMENT para 'DATA'
		Y	db	'Y'
DS2 ENDS

CS2		SEGMENT para public 'CODE'
	assume ds:DS2, cs:CS2

Next:
	mov bx,ds
	mov ax,DS2
	mov ds,ax


	mov ch,Y
	mov ds,bx
	mov cl,X
	xchg ch,cl
	mov X,cl
	mov ax,DS2
	mov ds,ax
	mov Y,ch
	mov ah,2h
	mov dl,Y
	int 21h
	
	mov ah,4ch
	int 21h
CS2 ENDS
END Next
