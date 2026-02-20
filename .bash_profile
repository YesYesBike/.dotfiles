#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#Autostart X at login
#if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
#      exec startx
#fi
#
#clear

GPG_TTY=$(tty)
export GPG_TTY

export BC_ENV_ARGS="$HOME/.bc"
export PERLDOC_PAGER="less -+C "

[ -z "$TMUX" ] && . ~/bash_login
