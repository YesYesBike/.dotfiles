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

# CPAN
PATH="/home/yesyesbike/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/yesyesbike/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/yesyesbike/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/yesyesbike/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/yesyesbike/perl5"; export PERL_MM_OPT;

eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS="--border=bold --reverse --no-info --scroll-off=99\
	--tiebreak=index --bind=change:first"

PATH=$PATH:~/bin
# export BC_ENV_ARGS="$HOME/.bc"
# export PERLDOC_PAGER="less -+C "

date +'%F(%a)'
