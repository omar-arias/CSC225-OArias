.386P

.model flat

extern _GetStdHandle@4: near
extern _ReadConsoleA@20: near

.data

inputHandle		dword		?
read		dword		?
charsToRead		dword		1024	; max to read



.code

readline PROC near
_readline:

	push ebp
	mov ebp, esp
	mov ebx, [ebp + 8]	; buffer

	; inputHandle = GetStdHandle (-10) input handle
	push -10
	call _GetStdHandle@4
	mov inputHandle, eax

	
	; ReadConsole (inputHandle, buffer, charsToRead, read, 0)
	push 0
	push offset read
	push charsToRead
	push ebx
	push inputHandle
	call _ReadConsoleA@20

	pop ebp

	ret


readline ENDP
END