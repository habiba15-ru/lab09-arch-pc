section .data
    filename db 'name.txt', 0
    prompt db 'What is your name? ', 0
    prompt_len equ $ - prompt
    prefix db 'My name is ', 0
    prefix_len equ $ - prefix
    newline db 10

section .bss
    name resb 100

section .text
global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, prompt_len
    int 80h
    
    mov eax, 3
    mov ebx, 0
    mov ecx, name
    mov edx, 100
    int 80h
    
    dec eax
    mov esi, eax
    
    mov eax, 8
    mov ebx, filename
    mov ecx, 0644o
    int 80h
    
    mov ebx, eax
    mov eax, 4
    mov ecx, prefix
    mov edx, prefix_len
    int 80h
    
    mov eax, 4
    mov ecx, name
    mov edx, esi
    int 80h
    
    mov eax, 4
    mov ecx, newline
    mov edx, 1
    int 80h
    
    mov eax, 6
    int 80h
    
    mov eax, 1
    xor ebx, ebx
    int 80h
