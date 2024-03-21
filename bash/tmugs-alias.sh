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
    cd)
        tmux run-shell -b ". ~/bash/tmugs-cd-root.sh || exit 0; exec bash"
        ;;
    he)
        tmux neww -n "Homepage" -c ".dotfiles_private/projects/homepage" "nvim html/homepage.html"
        ;;
    man)
        tmux run-shell -b ". ~/bash/tmugs-man-ex.sh || exit 0; exec bash"
        ;;
    nf)
        tmux neww "neofetch; sleep 3"
        ;;
    le)
        tmux neww -n "localhost" -c "localhost" "nvim ."
        ;;
    pse)
        tmux neww -n "PerlSnip" -c ".config/nvim/snippets" "nvim perl.lua"
        ;;
    tae)
        tmux neww -n "tmux-alias" -c "bash" "nvim tmugs-alias.sh"
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
