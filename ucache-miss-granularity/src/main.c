#include "ucache-miss-check.h"

#define ITERATION_COUNT 1L << 31

int main(void){
    ucmc_8nopax_64b_1(ITERATION_COUNT);
}
