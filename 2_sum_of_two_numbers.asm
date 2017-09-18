section .data
	input_msg db "Enter number:"
	len_inpMsg equ $-input_msg

section .bss
	a resb 5
	b resb 5

section .text
    global main

main:
	;prompt for first input 
	mov eax, 4 ;write
	mov ebx, 1 ; stdin
	mov ecx, input_msg
	mov edx, len_inpMsg
	int 0x80

	;read and store user input 
	mov eax, 3 ; read_syscall
	mov ebx, 2 	
	mov ecx, a
	mov edx, 5  ;5 bytes
	int 0x80

	;prompt for 2nd input 
	mov eax, 4 ;write
	mov ebx, 1 ; stdin
	mov ecx, input_msg
	mov edx, len_inpMsg
	int 0x80

	;read and store user's 2nd input 
    mov eax, 3 ; read_syscall
    mov ebx, 2  
    mov ecx, b
    mov edx, 5  ;5 bytes
    int 0x80

    ;compute add 
    mov eax, a
    mov ebx, b
    add eax, ebx 
    mov ecx, eax


    ;print output 
    mov eax, 4
    mov ebx, 1
    mov edx, 5
    int 0x80


	
	 

