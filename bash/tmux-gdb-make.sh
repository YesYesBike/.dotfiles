#!/bin/bash

filename=$(cat /tmp/__FILENAME42069)
pwd=$(cat /tmp/__PWD42069)

tmux neww -c $pwd -n "gdb($filename)" "gdb $filename"
