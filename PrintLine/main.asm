.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near


.data

msg		byte	'Hello World!', 10
handle	dword	?
written	dword	?

.code

main PROC near
_main:
	
	push offset msg	; Pushing msg onto stack, to be used by printLine
	call printLine

	push 0
	call _ExitProcess@4
main ENDP

printLine PROC
_printLine:

	push ebp			; Saving old base pointer
	mov ebp, esp		; Setting new base pointer
	mov ebx, [ebp+8]	; Moving msg into ebx
						; + 8 because msg located 2 spaces above current stack pointer

	; handle = GetStdHandle(-11)
	push -11
	call _GetSTDHandle@4
	mov handle, eax

	; WriteConsole(handle, ebx, 5, written,0)
	push 0
	push offset written
	push 13
	push ebx
	push handle
	call _WriteConsoleA@20

	pop ebp				; Restore old base pointer
	
	ret
printLine ENDP

END

