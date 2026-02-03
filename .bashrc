#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ "$TERM" = "linux" ]
then
	echo -ne '\033[?8c'
fi

function monon
{
	xrandr --output HDMI-1-0 --auto --left-of eDP-1
	feh --bg-scale ~/images/wallpaper/selected/12.jpg --bg-scale ~/images/wallpaper/selected/06.jpg
}

function monoff
{
	xrandr --output HDMI-1-0 --off
	feh --bg-scale ~/images/wallpaper/selected/12.jpg
}

function rfeh
{
	feh -zF
}

function duhead
{
	local line=$1
	[ -z "$line" ] && line=10
	du -hd1 | sort -rh | sed ${line}q
}

PS1='~ '

set -o vi
stty -ixon
. ~/.aliasrc
. ~/.bashrc_personal

export FZF_DEFAULT_OPTS="--border=bold --reverse --no-info --scroll-off=99\
	--tiebreak=index --bind=change:first"

PATH=$PATH:~/bin
# export BC_ENV_ARGS="$HOME/.bc"
# export PERLDOC_PAGER="less -+C "

date +'%F(%a)'
