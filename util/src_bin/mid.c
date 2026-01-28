#include <unistd.h>
#include <stdlib.h>
#include <string.h>

/*
=========================Arrange the text in the middle=========================
================================Usage: mid [ch]=================================
=======================If argc is 1, then fills with '='========================
                               Filled with space
*/

int main(int argc, char *argv[])
{
	char ch;
	size_t len;
	size_t fill_cnt;
	char fill[40];
	char buf[81] = {};
	char *p = buf;

	if (argc == 1)
		ch = '=';
	else
		ch = *argv[1];
	memset(fill, ch, 40);

	read(STDIN_FILENO, buf, 81);
	if (buf[80])
		exit(69);

	while (*p) {
		if (*p == '\n') {
			*p = 0;
			break;
		}
		++p;
	}

	len = p-buf;
	fill_cnt = (80-len)/2;

	write(STDOUT_FILENO, fill, fill_cnt);
	write(STDOUT_FILENO, buf, len);
	if (ch == ' ')
		exit(0);

	if (len&1)
		++fill_cnt;
	write(STDOUT_FILENO, fill, fill_cnt);
}
