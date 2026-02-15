#!/bin/bash

firefox &
tmux new -ds 2 -n 'SU' 'su; exec bash'
tmux neww -t '2:' -n 'NET' 'nmtui; exec bash'
tmux neww -t '2:' -n 'VOL' 'alsamixer; exec bash'
st -e tmux new -A -s 1 &
exit 0
