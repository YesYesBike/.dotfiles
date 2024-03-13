#!/bin/bash

alias=$(cat ~/.tmux-alias | fzf-tmux -p 50% --border-label='Tmugs-Alias' |
    cut -d '/' -f 1 | tr -d ' ')

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
    tae)
        tmux neww -n "tmux-alias" "nvim ~/.tmux-alias"
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
        #echo no
        ;;
esac
