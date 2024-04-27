#!/bin/sh

setxkbmap -option caps:escape
#xset r rate 250 30
xset r rate 190 40
feh --bg-scale ~/images/wallpaper/selected/01.jpg
xrandr --output HDMI-1-4 --auto --right-of eDP-1

exec dwm
#exec ~/projects/clwm/clwm
