# Compiler: GCC
CC := clang
# Common GCC flags
CCFLAGS := -O1 -fno-stack-protector 
# Compiler flags for x86_64
CCFLAGS64 := $(CCFLAGS) -m64

# Make anything
%: %.c
	make $@.64

# Build 64 bit binaries
%.64: %.c
	$(CC) $(CCFLAGS64) $< -o $@
	objcopy -N FILE $@

# Determine all C programs in directory
SRCS = $(wildcard *.c)
# Substitute the programs' names
PROGS = $(patsubst %.c,%.64,$(SRCS))
# All lets you make everything
all: $(PROGS)

docker:
	docker build -t crackmes .

docker-run:
	docker run --rm -i -t -v $(shell pwd):/work/crackmes crackmes

# Delete everything
.PHONY: clean
clean:
	rm -f *.64
