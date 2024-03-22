#!/bin/bash

#it needs to be fixed later...
export PERLDOC_PAGER="less -+C "
keyword=$(cat /tmp/perldoc)
tmux renamew perldoc($keyword)
perldoc -f $keyword
