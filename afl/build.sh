CC=gcc
FuzzCC=afl-gcc
SRC=../src
rm maze*
$CC -o maze.forward $SRC/main.c
$CC -DMAZE_BACK -o maze.back $SRC/main.c
$FuzzCC -DFUZZ_MAZE -o maze.forward.afl $SRC/main.c
$FuzzCC -DFUZZ_MAZE -DMAZE_BACK -o maze.back.afl $SRC/main.c