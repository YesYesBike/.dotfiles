TARGET = rofl
SRC = main.c rofl.c
OBJ = ${SRC:.c=.o}

all: ${TARGET}
	rm -f ${OBJ}	#clean

.c.o:
	gcc -c $<

${TARGET}: ${OBJ}
	gcc -o $@ ${OBJ}
