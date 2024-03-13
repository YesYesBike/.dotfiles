#!/bin/bash

file=$(find ~ ~/src ~/projects -mindepth 1 -maxdepth 5 -type f |
    cut -d "/" -f 4- | grep -v -e "\.cache" -e "\.vim" |
    fzf-tmux -p 80% --border-label "TMUGS-VIM");
[ -z $file ] && exit 0
directorie=~/$(echo $file | sed 's/\/[^/]*$//')
file_vim=$(echo $file | perl -F/ -lane 'print $F[-1]')  #first perl using moment
[ -n $file ] && tmux neww -c $directorie "nvim $file_vim"   #alias doesn't work
