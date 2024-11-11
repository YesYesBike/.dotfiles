#!/bin/bash

firefox &
exec st -e tmux new -A -s 1
