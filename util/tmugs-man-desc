#!/bin/bash

#not using much...
string=$(apropos -s 1,2,3,4,5,7 . | sort -t ' ' -k2 |
    fzf-tmux -p 95% -n 2 --delimiter='-' --bind change:first\
    --border-label "TMUGS-MAN-DESC")
[ -z $string ] && exit 0
command=$(echo $string | cut -d ' ' -f 1)
section=$(echo $string | cut -d ' ' -f 2 | tr -d '()')
tmux neww -n "man($command)" "man $section $command"
