.386P
.model flat

extern _ExitProcess@4: near
extern _GetStdHandle@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near


.data

num1	db	10
num2	db	20
num3	db	30
num4	db	40

.code

main PROC near
_main:
	
	mov al, [num1]
	mov	bl, [num4]	

	mov [num1], bl	;bl holds value of num4, moves into num1
	mov [num4],	al	;al holds value of num1, moves into num4
	
	mov al, [num2]
	mov bl, [num3]

	mov [num2], bl	;bl holds value of num3, moves into num2
	mov [num3], al	;al holds value of num2, moves into num3
	
	push 0
	call _ExitProcess@4
main ENDP
END

