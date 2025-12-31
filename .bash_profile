#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#Autostart X at login
#if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
#      exec startx
#fi
#
#clear

GPG_TTY=$(tty)
export GPG_TTY

export BC_ENV_ARGS="$HOME/.bc"
export PERLDOC_PAGER="less -+C "

TEST_DIR=/tmp/test_${USER}
if [ ! -e ${TEST_DIR} ]
then
	mkdir ${TEST_DIR}
	chmod 0700 ${TEST_DIR}
	cp -r ~/.dotfiles/test/* ${TEST_DIR}
	cp -r ~/.dotfiles/test/.* ${TEST_DIR}
fi

SCRATCHPAD="/tmp/scratchpad_${USER}"
if [ ! -e ${SCRATCHPAD} ]
then
	cp ~/personal/scratchpad_template ${SCRATCHPAD}
	chmod 0600 ${SCRATCHPAD}
fi
