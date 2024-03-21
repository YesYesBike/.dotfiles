#!/bin/bash

#   $1: Compile Target
#   $2: Option
#       g: Compile for debugging (doesn't delete compiled file)
#       G: Compile for debugging but dont run gdb (doesn't delete compiled file)
#       o: Output with another name and run
#       c: DONT delete compiled file after running
#   $parameter
#   $filename

[ $# -eq 0 ] && echo "Enter more than one parameter"; exit

#No Option, No Problem
[ $# -eq 1 ] && gcc $1 && ./a.out && rm a.out; exit

#Adding parameters
[[ -n $(echo $2 | tr -cd 'g') ]] && parameter+='-g ' #yank/paste this line for later feature
[[ -n $(echo $2 | tr -cd 'G') ]] && parameter+='-g '
[[ -n $(echo $2 | tr -cd 'o') ]] && read -p "Enter the Filename: " filename &&
    parameter+='-o ' && parameter+=$filename   #This line should be at the last but I don't know why

#Filename
[[ -n $filename ]] && [[ -z $(echo $2 | tr -cd 'c') ]]
[[ -z $filename ]] && filename='a.out'

#Compiling with parameters
gcc $1 $parameter

#Run or GDB
[[ -n $(echo $2 | tr -cd 'g') ]] && gdb ./$filename
[[ -z $(echo $2 | tr -cd 'g') ]] && ./$filename

#Clean Compiled File...
[[ -n $(echo $2 | tr -cd 'c') ]] && rm $filename && echo "Deleted $filename"
