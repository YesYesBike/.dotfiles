#!/bin/bash

directory=$(find ~ ~/src ~/projects -mindepth 1 -maxdepth 5 -type d | sort -u |
    . ~/bash/dirsed.sh | fzf-tmux -p 80% --border-label "TMUGS-CD");
[ -z $directory ] && exit 0
[ -n $directory ] && tmux neww -c ~/$directory
