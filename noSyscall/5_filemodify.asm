extern printf
extern scanf
extern fopen 
extern fread
extern memset
extern fclose 

%define BUF_S 20
%define EACH_B 1       

section .data
    filename: dd 0
    openfilemode: db "r", 0 
    infile: db "sample.txt", 0
    fileLen: equ $-infile 
    fileerror: db "Filename not given [%s yourfilename]"  ;if filename is not given, 0, "$"
    fopenerror: db "Unable to open file", 10, 0 
    outstring:  db "%s", 0 
    resfilename: dd 0

section .bss
    buffer: resb BUF_S

section .text
    global main


    main:
        push ebp 
        mov ebp, esp 

        mov eax, dword [ebp+0x8] ;check if the arg count is two 
        cmp eax, 0x2
        jne nofile

        mov eax, dword [ebp+0xc] ;eax has addr of first arg  
        mov eax, dword [eax+4] ;reaching to 2nd arg address
        mov [filename], eax
        push openfilemode
        push dword [filename]
        call fopen 
        add esp, 8

        test eax, eax ;check file exist
        jz openfailed

        mov [resfilename], eax

        push BUF_S  ;initialising buffer to zero
        push 0
        push buffer
        call memset 
        add esp, 12

        push dword [resfilename] ;fread - readfile to buffer
        push BUF_S
        push EACH_B
        push buffer
        call fread
        add esp, 0x10

        push buffer    ;print buffer 
        push outstring
        call printf
        add esp, 8

        push dword [resfilename] ;close file
        call fclose 
        add esp, 4

        mov eax, 0
        jmp end

    nofile:
        mov eax, dword [ebp+0xc]
        mov eax, dword [eax]
        push eax 
        push fileerror
        call printf
        add esp, 8
        mov eax, 1
        jmp end

    openfailed:
        push fopenerror
        call printf
        add esp, 4
        mov eax, 1
        jmp end

    end:
        leave 
        ret