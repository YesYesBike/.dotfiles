#!/bin/bash

#   $1: Compile Target
#   $2: Option
#       g: Compile for debugging 
#       o: Output with another name and run
#       c: DONT delete compiled file after running
#   $parameter
#   $filename

[ $# -eq 0 ] && echo "Enter more than one parameter"; exit

#No Option, No Problem
[ $# -eq 1 ] && gcc $1 && ./a.out && rm a.out; exit

opt=$(getopt gGo:c)
