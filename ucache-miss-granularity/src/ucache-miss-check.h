#ifndef UCACHE_MISS_CHECK_H
#define UCACHE_MISS_CHECK_H

#include <stddef.h>

//ucmc prefix stands for UCache_Miss_Check

/**
 * The ucmc_64b_nopax8_n routine uns 8*n times repeated nop ax iteration_count times.
 * nop ax is 4 bytes long so 8 nop ax's consumes the entire 32 byte region of uops-cache.
 * The function code is 64-byte aligned.
 */
void ucmc_64b_nopax8_1(size_t iteration_count);
void ucmc_64b_nopax8_2(size_t iteration_count);
void ucmc_64b_nopax8_3(size_t iteration_count);
void ucmc_64b_nopax8_4(size_t iteration_count);
void ucmc_64b_nopax8_5(size_t iteration_count);
void ucmc_64b_nopax8_6(size_t iteration_count);

#endif //UCACHE_MISS_CHECK_H
