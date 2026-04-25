global print_h1

section .rodata
  letter_h db "H"

section .text
print_h1:
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel letter_h]
    mov rdx, 1
    syscall
    ret
