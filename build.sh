CC=gcc
FuzzCC=afl-gcc
rm maze*
$CC -o maze.forward main.c
$CC -DMAZE_BACK -o maze.back main.c
$FuzzCC -DFUZZ_MAZE -o maze.forward.afl main.c
$FuzzCC -DFUZZ_MAZE -DMAZE_BACK -o maze.back.afl main.c