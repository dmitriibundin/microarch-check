#include "ucache-miss-check.h"

#define ITERATION_COUNT 1L << 31

int main(void){
    ucmc_64b_nopax8_6(ITERATION_COUNT);
}
