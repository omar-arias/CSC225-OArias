.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

extern writeline: near
extern readline: near
extern atoi: near
extern itoa: near


.data

msg1	byte	'Enter Number 1:',10
msg2	byte	'Enter Number 2:',10
msg3	byte	'The multiplication result is:'
readbuffer	byte	1024	DUP(0)
product	dword		1024	DUP(0)
number	dword	?


.code

main PROC near
_main:

	; print msg1
	push 15
	push offset msg1
	call writeline

	; read input
	Push offset readBuffer
	call readline

	; convert to int
	push offset readBuffer
	call atoi
	mov number, eax	; save converted input into number

	; print msg2
	push 15
	push offset msg2
	call writeline

	;read input 2
	push offset readBuffer
	call readline
	
	; convert input 2
	push offset readBuffer
	call atoi

	mul number	; multiply input1 by input2, stored in eax

	; convert back to ascii
	push eax
	push offset product
	call itoa

	; print msg3
	push 29
	push offset msg3
	call writeline

	; print product
	push 20
	push offset product
	call writeline
	

	push 0
	call _ExitProcess@4

main ENDP

END

