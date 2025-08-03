#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ "$TERM" = "linux" ]
then
	echo -ne '\033[?8c'
fi

#parse_git_branch()
#{
#	 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
#}
#c_cyan=`tput setaf 6`
#c_red=`tput setaf 1`
#c_green=`tput setaf 2`
#c_red=`tput setaf 1; tput bold`
#c_cyan=`tput setaf 6; tput bold`
#c_sgr0=`tput sgr0`
#branch_color ()
#{
#	if git rev-parse --git-dir >/dev/null 2>&1
#	then
#	   color=""
#	   if [[ "$(git status --porcelain 2> /dev/null)" != "" ]];
#	   then
#		   color=${c_red}
#	   else
#		   color=${c_cyan}
#	   fi
#	else
#	   return 0
#	fi
#	echo -ne $color
#}
PS1='~ '
#PS1='\[$(branch_color)\]$(parse_git_branch)?\[${c_sgr0}\] '
#PS1='\[$(branch_color)\]?\[${c_sgr0}\] '
#PS1='\[\e[32m\]\W\[\e[0m\]\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]\$ '
#PS1='Nani ga Hoshii-desuka Goshujin-sama? '
#PS1='\[\e[32m\W\e[0m\$ '	  #w: full directory, W: current directory
#PS1="\[\e[32m\]\W\[\e[0m\]\$ "



set -o vi
stty -ixon
. ~/.aliasrc


export FZF_DEFAULT_OPTS="--border=bold --reverse --no-info --scroll-off=99\
	--tiebreak=index --bind=change:first"
export FZF_COMPLETION_TRIGGER='~~'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PLAN9=/usr/local/plan9
export BC_ENV_ARGS="$HOME/.bc"
export PERLDOC_PAGER="less -+C "

date +'%F(%a)'
