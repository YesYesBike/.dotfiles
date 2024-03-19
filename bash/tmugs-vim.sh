#!/bin/bash

file=$(find ~ ~/src ~/projects -mindepth 1 -maxdepth 3 -type f | sort -u |
    cut -d "/" -f 4- | grep -v -e "\.cache" -e "\.vim" |
    fzf-tmux -p 80% --border-label "TMUGS-VIM");
[ -z $file ] && exit 0
directorie=$(dirname $file)
file_vim=$(basename $file)
[ -n $file ] && tmux neww -c $directorie "nvim $file_vim"
