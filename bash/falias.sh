#!/bin/sh

location=$(find ~ -type d | . ~/bash/dirsed.sh | fzf --margin 13% --border-label="Where I go")
[ -z $location ] || cd ~/$location

