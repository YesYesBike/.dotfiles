#!/bin/sh

arg=$(find ~ -type f | . ~/bash/dirsed.sh | fzf --margin 13% --border-label="Open File(nVim)")
[ -z $arg ] || vi ~/$arg
