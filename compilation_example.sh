#!/bin/bash

# paths and files
cwd=${PWD}
topdir="$cwd/compilation_example"
hello_c="$topdir/hello.c"
lib_c="$topdir/lib.c"
lib_h="$topdir/lib.h"
compile_sh="$topdir/compile.sh"
mk_sol="$topdir/Makefile.solution"

# prepare
mkdir -p $topdir

# auto-create C source files
cat > $hello_c << EOF
#include <stdio.h>
#include "lib.h"

int main(void) {
    printf("%s", greeting());
    return 0;
}
EOF

cat > $lib_c << EOF
char * greeting(void) {
    return "Everything is in place!\n";
}
EOF

cat > $lib_h << EOF
char * greeting(void);
EOF

# auto-create compile file
cat > $compile_sh << EOF
#!/bin/bash
gcc -c lib.c -o lib.o
gcc -c hello.c -o hello.o -I.
gcc -o hello.exe hello.o lib.o -I.
./hello.exe
EOF
chmod u+x $compile_sh

# dump the solution Makefile
cat > $mk_sol << "EOF"
SRC_C := $(wildcard *.c)
SRC_H := $(wildcard *.h)
SRC_O := $(patsubst %.c, %.o, $(SRC_C))
TARGET := hello.exe

CC := gcc
CFLAGS := -Wall -Wextra -std=c99
INCDIR := -I.

## all     : compile the source codes
all : $(TARGET)

%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $*.o # $(INCDIR)

$(TARGET) : $(SRC_O)
	$(CC) $(CFLAGS) -o $@ $^ $(INCDIR)

## run     : execute the target
.PHONY : run
run :
	@echo Executing $(TARGET) ...
	@./$(TARGET)

## help    : create a help message
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<

## clean   : remove build artefacts
.PHONY : clean
clean :
	rm -rf $(TARGET) $(SRC_O)
EOF
