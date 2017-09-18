extern printf

section .data
	a: dd 1
	out: db "%d", 10, 0

section .text
	global main

	main:
		push ebp
		mov ebp, esp 
		push dword [a]

		loop:
			push out 
			call printf

			pop eax
			pop eax
			add eax, 1
			push eax

			cmp eax, 10
			jle loop

			leave
			ret


			
			



