#!/bin/sh

setxkbmap -option caps:escape
#xset r rate 250 30
xset r rate 190 40
feh --bg-scale ~/image/wallpaper/01.jpg
~/util/chkbat &

exec dwm
