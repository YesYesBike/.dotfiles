#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ "$TERM" = "linux" ]
then
	echo -ne '\033[?8c'
fi

if [ "$TERM" = "tmux-256color" ]
then
	echo -ne '\033[?8c'
fi

#parse_git_branch()
#{
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
#}
#c_cyan=`tput setaf 6`
#c_red=`tput setaf 1`
#c_green=`tput setaf 2`
#c_red=`tput setaf 1; tput bold`
#c_cyan=`tput setaf 6; tput bold`
#c_sgr0=`tput sgr0`
#branch_color ()
#{
#   if git rev-parse --git-dir >/dev/null 2>&1
#   then
#      color=""
#      if [[ "$(git status --porcelain 2> /dev/null)" != "" ]];
#      then
#          color=${c_red}
#      else
#          color=${c_cyan}
#      fi
#   else
#      return 0
#   fi
#   echo -ne $color
#}
PS1='~ '
#PS1='\[$(branch_color)\]$(parse_git_branch)?\[${c_sgr0}\] '
#PS1='\[$(branch_color)\]?\[${c_sgr0}\] '
#PS1='\[\e[32m\]\W\[\e[0m\]\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]\$ '
#PS1='Nani ga Hoshii-desuka Goshujin-sama? '
#PS1='\[\e[32m\W\e[0m\$ '     #w: full directory, W: current directory
#PS1="\[\e[32m\]\W\[\e[0m\]\$ "



set -o vi
bind -m vi-insert "\C-l":clear-screen
. ~/.aliasrc




export FZF_DEFAULT_OPTS="--border=bold --reverse --no-info --scroll-off=99\
    --tiebreak=index --bind=change:first"
export FZF_COMPLETION_TRIGGER='~~'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export BC_ENV_ARGS="$HOME/.bc"
export PERLDOC_PAGER="less -+C "
export PATH=$PATH:~/.spoof-dpi/bin
export PATH=$PATH:~/cross_complie/arm-gnu-toolchain-13.2.Rel1-x86_64-aarch64-none-linux-gnu/bin


#autocompletion for alias
#function make-completion-wrapper () {
#    local function_name="$2"
#    local arg_count=$(($#-3))
#    local comp_function_name="$1"
#    shift 2
#    local function="
#        function $function_name {
#          ((COMP_CWORD+=$arg_count))
#          # Quotes here are important
#          COMP_WORDS=( "$@" \"\${COMP_WORDS[@]:1}\" )
#          "$comp_function_name"
#          return 0
#        }"
#    eval "$function"
#    echo $function_name
#    echo "$function"
#}

clear

if [ -s ~/note/quicknotes/important ]
then
    cat ~/note/quicknotes/important 
fi
