#!/bin/bash

# Perform CPU Benchmarking Using sysbench Tool
# the important thing here is the “total time”
sysbench --test=cpu run
# with changed parameters
sysbench --test=cpu --cpu-max-prime=20000 run

#Threads execution
sysbench  --threads=100  --time=60 cpu --cpu-max-prime=64000 run
sysbench --num-threads=64 --test=threads --thread-yields=100 --thread-locks=2 run

# Benchmark Memory Using the sysbench Tool
# Memory performance can be tested by examining the two parameters, “Total Operations” and data amount transferred.
sysbench --test=memory run
# with additional parameters
sysbench --test=memory --memory-block-size=1M --memory-total-size=10G run

# Benchmark I/O Using the sysbench Tool
#The general sequential write I/O performance test can be done using the following command:
sysbench --test=fileio --file-test-mode=seqwr run
# with parameters
sysbench --test=fileio --file-total-size=3G prepare
sysbench --test=fileio --file-total-size=3G --file-test-mode=rndrw  --time=120 --max-time=300 --max-requests=0 run  
sysbench --test=fileio --file-total-size=3G cleanup 