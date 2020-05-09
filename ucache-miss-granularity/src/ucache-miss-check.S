section .text

global ucmc_64b_nopax8_1
global ucmc_64b_nopax8_2
global ucmc_64b_nopax8_3
global ucmc_64b_nopax8_4
global ucmc_64b_nopax8_5
global ucmc_64b_nopax8_6

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
