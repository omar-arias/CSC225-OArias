.386P

.model flat

.data

ten		dword		10

.code

itoa PROC near
_itoa:

	push ebp
	mov ebp, esp
	mov esi, [ebp+8]	; buffer
	mov eax, [ebp + 12]	; number to convert
	xor ebx, ebx		; zeroing ebx to be used as digit counter

	division:
		xor edx, edx
		div ten
		add edx, 30h	;converting decimal to ascii
		push edx		;pushing converted digit onto stack
		inc bx
		cmp eax, 0
		jne division

	mov cx, bx		;moving digit count into cx for loop

	;loop used to pop digits off of stack in correct order
	digit:
		pop eax
		mov dword ptr [esi], eax
		inc esi
		loop digit

	pop ebp

	ret 
itoa ENDP
END