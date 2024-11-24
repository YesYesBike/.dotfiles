#include <fcntl.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define NELEM(x)	(sizeof(x)/sizeof((x)[0]))
#define PERR(X)		(perror(X+0), exit(EXIT_FAILURE))
#define ERRL()		(err_exit("%s: %d\n", __FILE__, __LINE__))

typedef int8_t			i8;
typedef int16_t			i16;
typedef int32_t			i32;
typedef int64_t			i64;
typedef uint8_t			u8;
typedef uint16_t		u16;
typedef uint32_t		u32;
typedef uint64_t		u64;

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

int main(int argc, char *argv[])
{
}
