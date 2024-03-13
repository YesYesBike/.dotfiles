#!/bin/bash

directory=$(find ~ ~/src ~/projects -mindepth 1 -maxdepth 3 -type d |
    . ~/bash/dirsed.sh |fzf-tmux -p 80% --border-label "TMUGS-CD");
[ -z $directory ] && exit 0
[ -n $directory ] && tmux neww -c ~/$directory
