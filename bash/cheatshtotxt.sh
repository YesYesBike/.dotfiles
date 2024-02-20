#!/bin/bash

mkdir -p ~/help/cheat_sh
[ -e $1_chtsh.txt ] || curl cheat.sh/$1?qT > ~/help/cheat_sh/$1_chtsh.txt
tmux neww -c ~/help chtsh/nvim $1_chtsh.txt && tmux renamew 'CHTSH('$1')'

find . -type f -empty -print -delete >> ~/help/delete_log/cheatsh
