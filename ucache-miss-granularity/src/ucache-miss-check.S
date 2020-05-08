section .text

global ucmc_8nopax_64b_1

align 64
ucmc_8nopax_64b_1:
    times 8 nop ax
    dec rdi
    jnz ucmc_8nopax_64b_1
    ret
