extern printf
extern scanf

section .data 
	numa: dd 0
	numb: dd 0
	prom: db "Enter the number:", 0
	in: db "%d"
	out: db "Largest is %d", 10, 0
	equal: db "Both are equal", 10, 0

section .text 
	global main

	main:
		push ebp
		mov ebp, esp

		push prom
		call printf
		add esp, 4

		push numa 
		push in
		call scanf
		add esp, 8

		push prom
		call printf
		add esp, 4

		push numb
		push in
		call scanf 
		add esp, 8

		mov eax, dword [numa]
		mov ebx, dword [numb]
		cmp eax, ebx
		jg index
		jl lesst
		je label1


	lesst:
		push dword [numb]
		push out 
		call printf 
		add esp, 8

		jmp final 

	index:
		push dword [numa] 
		push out 
		call printf
		add esp, 8
		jmp final

	label1:
		push equal
		call printf
		add esp, 4
		jmp final 

	final:
		mov eax, 0
		leave 
		ret

