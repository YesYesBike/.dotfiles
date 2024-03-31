#!/bin/bash

file=$(find ~ ~/src ~/projects -mindepth 1 -maxdepth 5 -type f | sort -u |
    cut -d "/" -f 4- | grep -v -e "\.cache" -e "\.vim" -e "\.cpan" |
    fzf-tmux -p 80% --bind change:first --border-label "TMUGS-VIM");
[ -z $file ] && exit 0
directorie=$(dirname $file)
file_vim=$(basename $file)
[ -n $file ] && tmux neww -c $directorie "nvim $file_vim"
