extern printf
extern scanf

section .data
	inp: db "%d"
	out: db "Sum is %d", 10, 0
	print: db "Enter the number:", 0
	x: dd 0
	y: dd 0


section .text
	global main

	main:
		push ebp
		mov ebp, esp 

		push print 
		call printf
		add esp, 4

		push x
		push inp 
		call scanf 
		add esp, 8

		push print 
		call printf
		add esp, 4

		push y
		push inp
		call scanf 
		add esp, 8

		mov eax, dword [x]
		add eax, dword [y]

		push eax
		push out
		call printf 
		add esp, 8

		mov eax, 0
		leave 
		ret
		

