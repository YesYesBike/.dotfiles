#!/bin/sh

location=$(find ~ ~/src ~/projects -mindepth 1 -maxdepth 5 -type d |
    . ~/bash/dirsed.sh | fzf --margin 13% --border-label="Where I go")
[ -z $location ] || cd ~/$location

