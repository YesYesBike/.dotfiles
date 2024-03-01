#!/bin/sh

arg=$(find ~ -type f | . ~/bash/dirsed.sh | fzf --border-label="Open File(nVim)")
[ -z $arg ] || vi ~/$arg
