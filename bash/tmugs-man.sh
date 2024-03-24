#!/bin/bash

string=$({ apropos -s 1 . | sort; cat ~/bash/manlist; } |
    fzf-tmux -p 80% -n 1 --delimiter=' ' --bind change:first\
    --print-query --border-label "TMUGS-MAN" | tail -1)

[ -z $string ] && exit 0

var=$(echo $string | perl -e 'printf <> =~ /[^\S\n]/ ? 1 : 0')  #perl mentioned!!!
if [ $var -eq 1 ]
then
    command=$(echo $string | cut -d ' ' -f 1)
    section=$(echo $string | cut -d ' ' -f 2 | tr -d '()')
else
    tmux neww -n "man($string)" "man $string" && exit 0
fi

if [ $command -le 9 ]
then
    ~/bash/tmugs-man-ex.sh $command
else
    tmux neww -n "man($command)" "man $section $command"
fi
