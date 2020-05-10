section .text

global ucmc_64b_nopax8_1
global ucmc_64b_nopax8_2
global ucmc_64b_nopax8_3
global ucmc_64b_nopax8_4
global ucmc_64b_nopax8_5
global ucmc_64b_nopax8_6

global ucmc_64b_nopax7jmp_1
global ucmc_64b_nopax7jmp_2
global ucmc_64b_nopax7jmp_3
global ucmc_64b_nopax7jmp_4
global ucmc_64b_nopax7jmp_5
global ucmc_64b_nopax7jmp_6

;=============== Macro and implementaion of ucmc_64b_nopax8_n routines ===============
%macro nopax8_rep 1
    %%loop:
    %rep %1
         times 8 nop ax
    %endrep
    dec rdi
    jnz %%loop
    ret
%endmacro

align 64
ucmc_64b_nopax8_1:
    nopax8_rep 1

align 64
ucmc_64b_nopax8_2:
    nopax8_rep 2

align 64
ucmc_64b_nopax8_3:
    nopax8_rep 3

align 64
ucmc_64b_nopax8_4:
    nopax8_rep 4

align 64
ucmc_64b_nopax8_5:
    nopax8_rep 5

align 64
ucmc_64b_nopax8_6:
    nopax8_rep 6

;=============== Macro and implementaion of ucmc_64b_nopax7jmp_n routines ===============
%macro nopax7jmp 1
    %%loop:
    ;TODO: This is an ugly way to check for evennes of the current iteration
    %define ODD
    %rep %1
        %ifdef ODD
            times 7 nop ax
            %push
            jmp %$aligned_label
            align 32
            %$aligned_label:
            %pop
            %undef ODD
        %else
            times 8 nop ax
            %define ODD
        %endif
    %endrep
    dec rdi
    jnz %%loop
    ret
%endmacro

align 64
ucmc_64b_nopax7jmp_1:
    nopax7jmp 1
    
align 64
ucmc_64b_nopax7jmp_2:
    nopax7jmp 2

align 64
ucmc_64b_nopax7jmp_3:
    nopax7jmp 3

align 64
ucmc_64b_nopax7jmp_4:
    nopax7jmp 4

align 64
ucmc_64b_nopax7jmp_5:
    nopax7jmp 5

align 64
ucmc_64b_nopax7jmp_6:
    nopax7jmp 6
