#!/bin/bash

[ -e $1_help.txt ] || $1 --help > ~/help/$1_help.txt
tmux neww -c ~/help nvim -R $1_help.txt && tmux renamew 'HELP('$1')'

find . -type f -empty -print -delete >> ~/help/delete_log/help
