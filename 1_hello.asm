section .text
    global main 

main:
	mov eax, 4 ;sys call number 
	mov edx, 11  ;length of the string 
	mov ecx, msg 
	mov ebx, 1 ;stdout 
	int 0x80 ;call kernel

ret 
msg db "hello world$", 11, 0
