.386P

.model flat

.data


.code

atoi PROC near
_atoi:

	push ebp
	mov ebp, esp
	mov esi, [ebp+8]
	
	mov eax, 0
	mov ecx, 10

	jump:
		movzx ebx, byte ptr [esi]	;zero extend
		inc esi

		cmp ebx, 0dh		;0dh, ascii end of line
		je jump2

		sub ebx, 30h		;convert digit from ascii to decimal
		mul ecx				
		add eax, ebx		;add converted digits
		jmp jump
	jump2:

	pop ebp
	ret

atoi ENDP
END