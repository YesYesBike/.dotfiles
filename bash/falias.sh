#!/bin/sh

location=$(find ~ -type d | . ~/bash/dirsed.sh | fzf --border-label="Where I go")
[ -z $location ] || cd ~/$location

