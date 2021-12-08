.386P

.model flat

extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near

.data

written		dword		?
outputHandle	dword	?

.code

writeline PROC near
_writeline:

	push ebp			; save old base pointer
	mov ebp, esp		; set new base pointer
	mov ebx,[ebp+8]		; offset msg
	mov ecx, [ebp+12]	; number of chars to read

	; handle = GetStdHandle(-11) Output handle
	push -11
	call _GetStdHandle@4
	mov outputHandle, eax


	; WriteConsole(handle, msg[0], 15, written, 0)
	push 0
	push offset written
	push ecx
	push ebx
	push outputHandle
	call _WriteConsoleA@20

	pop ebp

	ret

writeLine ENDP
END