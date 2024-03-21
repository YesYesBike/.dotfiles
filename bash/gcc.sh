#!/bin/bash

#   Option
#       g: Compile for debugging 
#       o: Output with another name and run
#       c: DONT delete compiled file after running
#   $parameter
#   $filename

[ $# -eq 0 ] && echo "Enter more than one parameter" && exit

#No Option, No Problem
[ $# -eq 1 ] && gcc $1 && ./a.out && rm a.out && exit

compile=$1
set -- $(getopt -q :go:c "$@")

while [ -n "$1" ]
do
    case "$1" in
        -g)
            parameter=$parameter"-g "
            debug=1
            ;;
        -o)
            parameter=$parameter"-o $2 "
            filename=$2
            shift ;;
        -c)
            not_clear=1 ;;
    esac
    shift
done

#echo $compile $parameter

gcc $compile $parameter

[ -z "$filename" ] && filename="a.out"

if [ -n "$debug" ]
then
    gdb $filename
else
    ././$filename
fi


[ -n "$not_clear" ] || rm $filename
