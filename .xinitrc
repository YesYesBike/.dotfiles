#!/bin/sh

setxkbmap -option caps:escape
#xset r rate 250 30
xset r rate 190 40
xrandr --output HDMI-1-1 --auto --left-of eDP-1
xrandr --output HDMI-1-2 --auto --left-of eDP-1
xrandr --output HDMI-1-3 --auto --left-of eDP-1
xrandr --output HDMI-1-4 --auto --left-of eDP-1
feh --bg-scale ~/images/wallpaper/selected/01.jpg --bg-scale ~/images/wallpaper/selected/06.jpg

exec dwm
