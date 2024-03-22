#!/bin/bash

export PERLDOC_PAGER="less -+C "
title=$(cat /tmp/perldoc)
tmux renamew "perldoc($title)"
perldoc -f $title
