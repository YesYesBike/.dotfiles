#!/bin/bash

directory=$(find ~ ~/src ~/projects -mindepth 1 -maxdepth 3 -type d |
    cut -d "/" -f 4- | grep -v -e ".cache" |fzf-tmux -p 80% --border-label "TMUGS-CD");
[ -z $directory ] && exit 0
[ -n $directory ] && tmux neww -c ~/$directory
