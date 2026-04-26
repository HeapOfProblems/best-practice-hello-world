global print_h1

section .text
print_h1:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov byte [rbp - 8], "H"

    mov rax, 1
    mov rdi, 1
    lea rsi, [rbp - 8]
    mov rdx, 1
    syscall

    mov rsp, rbp
    pop rbp
    ret
