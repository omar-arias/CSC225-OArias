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
	

	mov eax, n
	mov ebx, prev
	mov ecx, 1
	mov edx, current
	mov esi, next

	cmp eax, 0
	je jump0

	jump:

	add ebx, edx	;add prev and current, store in ebx
	mov esi, ebx	;mov sum of prev and current into next
	mov ebx, edx	;mov current into prev
	mov edx, esi	;mov next into current
	inc ecx			;increment ecx (counter)

	cmp ecx, eax	;compare counter to n (number entered)
	jle jump		;jump if counter is less than or equal to n

	jump0:

	mov eax, ebx	;mov final number into eax

	push 0
	call _ExitProcess@4


main ENDP
END

