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

TEST_DIR=/tmp/test_${USER}
if [ ! -e ${TEST_DIR} ]
then
	mkdir ${TEST_DIR}
	chmod 0700 ${TEST_DIR}
	cp -r ~/.dotfiles/test/* ${TEST_DIR}
fi
