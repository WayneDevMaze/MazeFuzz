if [ '$1' ]
then
    echo "start fuzzing with $1\n"
    case " $1 " in
    " afl ") 
        if [ '$2' ]
        then
        afl-fuzz -m none -t 250 -i $2 -o $3 ./maze.forward.afl
        else
        afl-fuzz -m none -t 250 -i afl/input -o afl/output ./maze.forward.afl
        fi
    esac
else
    ./maze.forward
fi