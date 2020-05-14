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

_start:
    mov rdi, ITERATION_COUNT
    iftag_granularity_miss 1
    sys_exit 0
