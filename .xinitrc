#!/bin/sh

setxkbmap -option caps:escape
#xset r rate 250 30
xset r rate 190 40
feh --bg-scale ~/images/wallpaper/selected/02.png

exec dwm
#exec ~/projects/clwm/clwm
