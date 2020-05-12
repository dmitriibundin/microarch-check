%include "ucache-miss-check.mac"

ITERATION_COUNT equ 1 << 31

section .text

global _start

;The parameter is the process exit code
%macro sys_exit 1
    mov eax, 0x3C ;SYS_EXIT system call number
    mov rdi, %1
    syscall
%endmacro

_start:
    mov rdi, ITERATION_COUNT
    nop32nopax4jnzjmp 1
    sys_exit 0
