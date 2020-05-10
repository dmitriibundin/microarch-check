#ifndef UCACHE_MISS_CHECK_H
#define UCACHE_MISS_CHECK_H

#include <stddef.h>

//ucmc prefix stands for UCache_Miss_Check

/**
 * The ucmc_64b_nopax8_n routine is 8*n times repeated nop ax iteration_count times.
 * nop ax is 4 bytes long so 8 nop ax's consumes the entire 32 byte region of uops-cache.
 *
 * The function code is 64-byte aligned.
 */
void ucmc_64b_nopax8_1(size_t iteration_count);
void ucmc_64b_nopax8_2(size_t iteration_count);
void ucmc_64b_nopax8_3(size_t iteration_count);
void ucmc_64b_nopax8_4(size_t iteration_count);
void ucmc_64b_nopax8_5(size_t iteration_count);
void ucmc_64b_nopax8_6(size_t iteration_count);

/**
 * The ucmc_64b_nopax7jmp_n routines consist of 7 times repeated nop ax instructions following
 * an unconditional jmp to the next 32-byte aligned chunk of code. The chunk of code in turns
 * contains 8 times repeated nop ax then again 7 times nop ax following an unconditional jmp.
 *
 * n is the total number of such blocks (either times 7 nop ax - jmp or times 8 nop ax)
 * 
 * The function code is 64-byte aligned.
 */
void ucmc_64b_nopax7jmp_1(size_t iteration_count);
void ucmc_64b_nopax7jmp_2(size_t iteration_count);
void ucmc_64b_nopax7jmp_3(size_t iteration_count);
void ucmc_64b_nopax7jmp_4(size_t iteration_count);
void ucmc_64b_nopax7jmp_5(size_t iteration_count);
void ucmc_64b_nopax7jmp_6(size_t iteration_count);

#endif //UCACHE_MISS_CHECK_H
