public Vid
EXTRN X: byte

dseg2	segment AT 0B800h
	ca label byte
	org 324
	z label byte
dseg2 ends

cseg segment para public 'CODE'
	assume ds:dseg2,cs:CSEG

Vid proc far
	mov al,X
	mov bx,dseg2
	mov ds,bx
	mov ca, al
	mov ah,31
	mov z,al
	ret

Vid endp 
cseg ends
end
