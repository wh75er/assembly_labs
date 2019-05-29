SSTACK     SEGMENT para stack 'STACK'
                    DB   256 DUP('STACK____')
         SSTACK         ENDS

DS1 	SEGMENT para public 'DATA'
		s1 db 'h'	
		db 64000-2 dup (0)
DS1 	ENDS

DS2 	SEGMENT para public 'DATA'
		s2 db 'e'	
		db 64000-2 dup (0)
DS2		ENDS

DS3 	SEGMENT para public 'DATA'
		s3 db 'y'	
		db 64000-2 dup (0)
DS3 	ENDS

CSEG SEGMENT para public 'CODE'
	assume cs:CSEG, ds:DS1, ss:SSTACK

Start:
	mov ax,DS1
	mov ds,ax
	mov dl,s1
	call print

	assume DS:DS2
	mov ax,DS2
	mov ds,ax
	mov dl,s2
	call print
	
	assume DS:DS3
	mov ax,DS3
	mov ds,ax
	mov dl,s3
	call print

	mov ah,4ch
	int 21h

print PROC
	mov ah,2
	int 21h
	mov dl,0Ah
	int 21h
	ret
print ENDP

CSEG ENDS
END Start
