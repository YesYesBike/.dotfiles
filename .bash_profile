#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#Autostart X at login
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
      exec startx
fi

clear
