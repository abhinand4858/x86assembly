extern printf

section .data
 msg: db "Program working"
 len: equ $-msg

 section .text
 	global main

 	main:
 		push ebp
 		mov ebp, esp 

 		push dword msg
 		call printf

 		add esp, 4
 		mov eax, 0
 		leave
 		ret