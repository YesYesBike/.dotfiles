#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#if [[ $TMUX ]]; then source ~/.tmux-git/tmux-git.sh; fi

parse_git_branch()
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`
branch_color ()
{
   if git rev-parse --git-dir >/dev/null 2>&1
   then
      color=""
      if [[ "$(git status --porcelain 2> /dev/null)" != "" ]];
      #if git diff --quiet 2>/dev/null >&2
      then
          color=${c_red}
      else
         color=${c_cyan}
      fi
   else
      return 0
   fi
   echo -ne $color
}
export PS1='\[\e[32m\]\W\[\e[0m\]\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]\$ '
. ~/.bash.d/cht.sh

set -o vi
#PS1='\[\e[32m\W\e[0m\$ '     #w: full directory, W: current directory
#PS1="\[\e[32m\]\W\[\e[0m\]\$ "
alias :q='exit'
alias be='vi ~/.bashrc'
alias bs='source ~/.bashrc'
alias c=clear
alias cc='~/bash/./gcc.sh'
alias cdf='cd ~/.dotfiles'
alias cht='cht.sh '
alias f='cd $(find ~ -type d | ~/bash/./dirsed.sh | fzf)'
alias ga.='git add .'
alias gaa='git add -A'
alias gb='git branch '
alias gc='git commit '
alias gca='git commit --amend'
alias gcm='git commit -m '
alias gC='git checkout '
alias gCb='git checkout -b '
alias gd='git diff '
alias gds='git diff --staged '
alias gl='git log '
alias gm='git merge '
alias gs='git status '
alias gss='git status -s '
alias gp='git push '
alias gP='git pull '
alias grep='grep --color=auto'
alias he='cd ~/.dotfiles_private/projects/homepage/ && vi .'
alias ht='~/bash/./helptotxt.sh '
alias la='ls -a'
alias ls='ls --color=auto'
alias ll='ls -al'
alias mt='~/bash/./mantotxt.sh '  #I didn't know :Man when I wrote this...
#alias p='~/bash/./pacmaninstall.sh '
alias pi='sudo pacman -S'
alias pr='sudo pacman -Rscn'
alias pq='pacman -Q > ~/.dotfiles/package_list2.txt && vi ~/.dotfiles/package_list2.txt'
alias pu='echo "PACKAGE UPGRADE" && sudo pacman -Syu && pacman -Q | sed "s/ .*//" > ~/.dotfiles/package_list.txt'
alias rb='echo "FUN FUN RE-BOOT!" && sudo reboot'
alias sd='echo "SHUTDOWN" && sudo shutdown -h 0'
alias t='tmux '
alias ta='tmux new -A -s 0'
alias te='vi ~/.tmux.conf'
alias tge='vi ~/.tmux-git.conf'
alias tk='tmux kill-ses -t 0'
alias tl='tmux ls'
alias sudo='sudo -E -s '
#alias sudo='sudo '
alias vi=nvim
alias ve='cd ~/.config/nvim && vi ~/.config/nvim/init.lua'
alias vf='~/bash/./vimfile.sh'

export FZF_DEFAULT_COMMAND=""
export FZF_COMPLETION_TRIGGER='**'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


clear
echo 'BASHRC LOADED'
