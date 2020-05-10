#include "ucache-miss-check.h"

#define ITERATION_COUNT 1L << 31

int main(void){
    ucmc_64b_nopax8nop19jmp_6(ITERATION_COUNT);
}
