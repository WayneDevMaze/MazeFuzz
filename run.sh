#[AFL] replace the path by your env
afl_path=/home/tao/Desktop/javafuzz/fuzer/afl/AFL-2.57b/afl-fuzz
#[AFL++] replace the path
aflPP_path=/home/tao/Desktop/javafuzz/fuzzer/AFLplusplus/afl-fuzz
#[MOpt] replace the path by your env
mopt_path=/home/ubuntu/Study/AFL/MOpt-AFL/MOpt-AFL/afl-fuzz
#[ijon]
ijon_path=/home/ubuntu/Study/ijon/afl-fuzz

if [ "$1" ] ; then
    echo "start fuzzing with $1\n"
    echo "=============================\n"
    case " $1 " in " afl ")
	    if [ " $2 " ] 
	    then
		    $afl_path -D -m none -t 250 -i $2 -o $3 ./afl/maze.forward.afl
	    else
		    $afl_path -D -m none -t 250 -i afl/input -o afl/output ./afl/maze.forward.afl
	    fi
    esac
    case " $1 " in " afl++ ") 
        if [ "$2" ]
        then
            $aflPP_path -D -m none -t 250 -i $2 -o $3 ./afl++/maze.forward.afl
        else
            $aflPP_path -D -m none -t 250 -i afl++/input -o afl++/output ./afl/maze.forward.afl
        fi
    esac
    case " $1 " in " mopt ")
	if [ "$2" ]
	then 
	    $mopt_path -m none -t 250 -i $2 -o $3 ./mopt/maze.forward.mopt
	else
	    $mopt_path -m none -t 250 -i mopt/input -o mopt/output ./mopt/maze.forward.mopt
	fi
    esac
    case " $1 " in " ijon ")
	if [ "$2" ]
	then 
	    $ijon_path -m none -t 250 -i $2 -o $3 ./ijon/maze.forward.ijon
	else
	    $ijon_path -m none -t 250 -i ijon/input -o ijon/output ./ijon/maze.forward.ijon
	fi
    esac
else
    ./src/maze.forward
fi

