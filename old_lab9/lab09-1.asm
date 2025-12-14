%include 'in_out.asm'

SECTION .data
msg: DB 'Введите x: ',0
result: DB 'Результат: ',0

SECTION .bss
x: RESB 80
tmp: RESB 80

SECTION .text
GLOBAL _start

_start:
    mov eax, msg
    call sprint
    
    mov ecx, x
    mov edx, 80
    call sread
    
    mov eax, x
    call atoi
    
    call calc
    
    mov [tmp], eax
    
    mov eax, result
    call sprint
    
    mov eax, [tmp]
    call iprintLF
    
    call quit

calc:
    mov ebx, 2
    mul ebx
    add eax, 7
    ret
