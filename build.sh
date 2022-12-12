#[normal] GCC
CC=gcc
#[AFL] replace the path by your env
AFLCC=/home/tao/Desktop/javafuzz/fuzzer/afl/AFL-2.57b/afl-gcc
#[AFL++] replace the path
AFLPPCC=/home/tao/Desktop/javafuzz/fuzzer/AFLplusplus/afl-gcc

#[MOpt] replace the path by your env
MoptCC=/home/ubuntu/Study/AFL/MOpt-AFL/MOpt-AFL/afl-gcc
#[ijon] replace the path by your env
ijonCC=/home/ubuntu/Study/ijon/afl-gcc
SRC=src


$CC -o $SRC/maze.forward $SRC/main.c
$CC -DMAZE_BACK -o $SRC/maze.back $SRC/main.c
$AFLCC -DFUZZ_MAZE -o afl/maze.forward.afl $SRC/main.c
$AFLCC -DFUZZ_MAZE -DMAZE_BACK -o afl/maze.back.afl $SRC/main.c
$AFLPPCC -DFUZZ_MAZE -o afl++/maze.forward.afl $SRC/main.c
$AFLPPCC -DFUZZ_MAZE -DMAZE_BACK -o afl++/maze.back.afl $SRC/main.c

# if use mopt / ijon
#$MoptCC -DFUZZ_MAZE -o mopt/maze.forward.mopt $SRC/main.c
#$MoptCC -DFUZZ_MAZE -DMAZE_BACK -o mopt/maze.back.mopt $SRC/main.c
#$ijonCC -DFUZZ_MAZE -o ijon/maze.forward.ijon $SRC/main.c
#$ijonCC -DFUZZ_MAZE -DMAZE_BACK -o ijon/maze.back.ijon $SRC/main.c
