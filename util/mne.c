#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void err_exit(char *fmt, ...)
{
	va_list ap;

	fflush(stdout);

	va_start(ap, fmt);
	vfprintf(stderr, fmt, ap);
	va_end(ap);

	fflush(stderr);

	exit(EXIT_FAILURE);
}

static inline int buf_clear(void)
{
	char ch;
	while ((ch = getchar()) != '\n') {
		if (ch == EOF)
			return 1;
	}

	return 0;
}

void get_str(char *str, unsigned long len, char *arg)
{
	int pfd[2];
	if (pipe(pfd) == -1)
		err_exit("pipe()\n");

	switch (fork()) {
	case -1:
		err_exit("fork()\n");

	case 0:
		if (close(pfd[0]) == -1)
			err_exit("close() pfd[0] child\n");

		if (pfd[1] != STDOUT_FILENO) {
			if (dup2(pfd[1], STDOUT_FILENO) == -1)
				err_exit("dup2()\n");
			if (close(pfd[1]) == -1)
				err_exit("close() pfd[1] child\n");
		}

		execlp("pwgen", "pwgen", "-sy", arg, (char*)NULL);
		err_exit("execlp()\n");

	default:
		if (close(pfd[1]) == -1)
			err_exit("close() parent\n");

		if (read(pfd[0], str, len+1) != len+1)
			err_exit("read()\n");

		str[len] = '\0';
		break;
	}
}

int main(int argc, char *argv[])
{
	unsigned long str_len;
	char *str_buf, *ans_buf;

	if (argc != 2)
		err_exit("Usage: %s num\n", *argv);

	str_len = strtoul(argv[1], NULL, 10);
	if (str_len == 0)
		err_exit("%s: Enter the decimal number!\n", argv[1]);

	str_buf = malloc(str_len + 1);
	ans_buf = malloc(str_len + 1);

	for (;;) {
		system("clear");
		get_str(str_buf, str_len, argv[1]);

		puts(str_buf);
		puts("Press Enter to continue");
		if (buf_clear())
			break;

		system("clear");
		printf("Enter the answer\n> ");
		fgets(ans_buf, str_len+1, stdin);
		if (buf_clear())
			break;
		ans_buf[str_len] = '\0';

		if (strcmp(str_buf, ans_buf) == 0) {
			puts("Correct!");
		} else {
			puts("Wrong!");
			printf("Correct Answer: %s\nYour Answer:    %s\n",
					str_buf, ans_buf);
		}

		puts("Press Enter to continue");
		if (buf_clear())
			break;
	}

	free(str_buf);
	free(ans_buf);

	return 0;
}
