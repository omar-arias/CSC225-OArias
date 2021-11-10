.386P
.model flat

extern _ExitProcess@4: near

.data

.code

main PROC near
_main:
	
	mov eax, 10
	mov ebx, 20
	mov	ecx, 30
	mov edx, 40

	xchg eax, edx
	xchg ebx, ecx

	push 0
	call _ExitProcess@4
main ENDP
END

