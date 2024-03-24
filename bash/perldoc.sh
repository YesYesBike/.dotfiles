#!/bin/bash

#export PERLDOC_PAGER="less -+C "
#title=$(cat /tmp/perldoc)
#tmux renamew "perldoc($title)"
#perldoc -f $title || perldoc $title || perldoc -v $title

export PERLDOC_PAGER="less -+C "
tmux renamew "perldoc($1)"
perldoc -f $1 || perldoc $1 || perldoc -v $1
