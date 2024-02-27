#!/bin/bash

#   $1: Compile Target
#   $2: Option
#       g: Compile for debugging
#       G: Compile for debugging but dont run gdb
#       o: Output with another name and run
#       c: delete compiled file after running
#       a: Ask what to do. I'll add laaaaater
#   $parameter
#   $filename

#gcc $1 && ./a.out

[[ -z $1 ]] && exit

#No Option, No Problem
[[ -z $2 ]] && gcc $1 && ./a.out && exit

#Adding parameters
[[ -n $(echo $2 | tr -cd 'g') ]] && parameter+='-g ' #yank/paste this line for later feature
[[ -n $(echo $2 | tr -cd 'G') ]] && parameter+='-g '
[[ -n $(echo $2 | tr -cd 'o') ]] && read filename && parameter+='-o ' && parameter+=$filename   #This line should be at the last but I don't know why

#Filename
[[ -n $filename ]] && [[ -z $(echo $2 | tr -cd 'c') ]] && echo $filename >> compiled_list.txt
[[ -z $filename ]] && filename='a.out'

#Compiling
gcc $1 $parameter

#Run or GDB
[[ -n $(echo $2 | tr -cd 'g') ]] && gdb ./$filename
[[ -z $(echo $2 | tr -cd 'g') ]] && ./$filename

#Clean Compiled File...
[[ -n $(echo $2 | tr -cd 'c') ]] && rm $filename
echo "Deleted $filename"
