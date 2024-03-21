#!/bin/bash

directory=$(find / -mindepth 1 -maxdepth 3 -type d | sort |
    fzf-tmux -p 80% --border-label "TMUGS-CD-ROOT");
[ -z $directory ] && exit 0
[ -n $directory ] && tmux neww -c $directory
