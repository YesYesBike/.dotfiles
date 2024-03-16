#!/bin/bash

string=$(apropos -s 1 . | sort |
    fzf-tmux -p 80% -n 1 --delimiter=' ' --border-label "TMUGS-MAN") #idk why -d option doesn't work
[ -z $string ] && exit 0
command=$(echo $string | cut -d ' ' -f 1)
section=$(echo $string | cut -d ' ' -f 2 | tr -d [:punct:]) #fix it later: just parentheses
tmux neww -n "man($command)" "man $section $command"
