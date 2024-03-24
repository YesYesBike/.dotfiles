#!/bin/bash

string=$({ apropos -s 1 . | sort; cat ~/bash/manlist; } |
    fzf-tmux -p 80% -n 1 --delimiter=' ' --bind change:first\
    --border-label "TMUGS-MAN")

[ -z $string ] && exit 0

command=$(echo $string | cut -d ' ' -f 1)
section=$(echo $string | cut -d ' ' -f 2 | tr -d '()')

if [ $command -le 9 ]
then
    ~/bash/tmugs-man-ex.sh $command
else
    tmux neww -n "man($command)" "man $section $command"
fi
