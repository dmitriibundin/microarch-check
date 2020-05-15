%include "ucache-miss-check.mac"

ITERATION_COUNT equ 1 << 31

;The parameter is the process exit code
%macro sys_exit 1
    mov eax, 0x3C ;SYS_EXIT system call number
    mov edi, %1
    syscall
%endmacro

section .text

global _start

example_fun:
    align 64
    times 8 nop ax
    .loop:
    times 4 nop ax
    test edi, 0x1
    jnz .no_fetch_start
    times 2 nop ax
    .cache_line_boundary: ;To simplify debugging
    times 2 nop ax
    nop dword [eax + 1 * eax + 0x1]
    jmp .loop_branch
    .no_fetch_start:
    times 4 nop ax
    .32bytes_boundary:    ;To simplify debugging
    times 6 nop ax
    nop dword [eax + 1 * eax + 0x1]
    jmp .loop_branch
    .loop_branch:
    dec rdi
    jnz .loop
    ret

_start:
    mov rdi, ITERATION_COUNT
    call example_fun
    sys_exit 0
