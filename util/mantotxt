#!/bin/bash

mkdir -p ~/help/man
if [ -z $2 ]; then
    [ -e $1_man.txt ] || man $1 | col -b > ~/help/man/$1_man.txt
    tmux neww -c ~/help nvim -R man/$1_man.txt && tmux renamew 'MAN('$1')'
else
    [ -e $2_man_$1.txt ] || man $1 $2 | col -b > ~/help/man/$2_man_$1.txt
    tmux neww -c ~/help nvim -R man/$2_man_$1.txt && tmux renamew 'MAN('$2_$1')'
fi

#Delete Empty Files
mkdir -p ~/help/delete_log
find ~/help -type f -empty -print -delete >> ~/help/delete_log/man
