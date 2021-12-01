.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near


.data

n		dword		3
prev	dword		0
current	dword		1
next	dword		0

.code

main PROC near
_main:
	
	mov eax, prev
	mov ebx, next
	mov ecx, n
	mov edx, current
	
	cmp ecx, 0	;skip loop if n = 0
	je jump

	loop1:

	add eax, edx	;add prev and current store in prev
	mov ebx, eax	;mov sum of prev and current into next
	mov eax, edx	;mov current into prev
	mov edx, ebx	;move next into current
	
	loop loop1

	jump:

	push 0
	call _ExitProcess@4
main ENDP 
END

