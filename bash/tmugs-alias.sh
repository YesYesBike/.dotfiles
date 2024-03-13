#!/bin/bash

alias=$(cat ~/.tmux-alias | fzf-tmux -p 50% --border-label='Tmugs-Alias' |
    cut -d '/' -f 1 | sed 's/\b//g')

case $alias in
    ae)
        tmux neww -n "aliasrc" "nvim ~/.aliasrc"
        ;;
    be)
        tmux neww -n "bashrc" "nvim ~/.bashrc"
        ;;
    he)
        tmux neww -n "Homepage" -c ".dotfiles_private/projects/homepage" "nvim html/homepage.html"
        ;;
    le)
        tmux neww -n "localhost" -c "localhost" "nvim ."
        ;;
    te)
        tmux neww -n "tmuxconf" "nvim ~/.tmux.conf"
        ;;
    twe)
        tmux neww -n "tmuxconf" "nvim ~/.tmux-windownames"
        ;;
    ve)
        tmux neww -n "nvim_set" -c ".config/nvim" "nvim init.lua"
        ;;
    *)
        ;;
esac
