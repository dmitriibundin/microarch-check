#ifndef UCACHE_MISS_CHECK_H
#define UCACHE_MISS_CHECK_H

#include <stddef.h>

//ucmc prefix stands for UCache_Miss_Check

/**
 * Runs 8 times repeated nop ax iteration_count times.
 * nop ax is 4 bytes long so 8 nop ax's consumes the entire 32 byte region of uops-cache.
 * The function code is 64-byte aligned.
 */
void ucmc_8nopax_64b_1(size_t iteration_count);

#endif //UCACHE_MISS_CHECK_H
