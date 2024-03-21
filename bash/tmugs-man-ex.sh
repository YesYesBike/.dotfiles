#!/bin/bash

string=$(apropos -s 2,3,4,5,7 . | sort |
    fzf-tmux -p 80% -n 1 --delimiter=' ' --border-label "TMUGS-MAN-EX")
[ -z $string ] && exit 0
command=$(echo $string | cut -d ' ' -f 1)
section=$(echo $string | cut -d ' ' -f 2 | tr -d '()')
tmux neww -n "man($command)" "man $section $command"
