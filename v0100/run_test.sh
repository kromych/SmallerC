#!/bin/bash

gcc -O0 -ggdb3 -DX86_64 smlrc.c -o smlrcx64
./smlrcx64 test.c testx64.s 
gcc -O0 -ggdb3 testx64.s
