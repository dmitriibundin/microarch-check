perf stat  -e \
icache_16b.ifdata_stall:u,\
icache_64b.iftag_hit:u,\
icache_64b.iftag_miss:u,\
icache_64b.iftag_stall:u,\
idq.dsb_uops:u,\
idq.mite_uops:u,\
idq.ms_uops:u,\
cycles $1
