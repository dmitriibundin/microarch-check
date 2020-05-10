#include "ucache-miss-check.h"

#define ITERATION_COUNT 1L << 31

int main(void){
    ucmc_64b_nopax7jmp_2(ITERATION_COUNT);
}
