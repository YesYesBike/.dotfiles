#!/bin/sh

setxkbmap -option caps:escape
#xset r rate 250 30
xset r rate 190 40
feh --bg-scale ~/images/wallpaper/selected/01.jpg #--bg-scale ~/images/wallpaper/selected/06.jpg

exec dwm
