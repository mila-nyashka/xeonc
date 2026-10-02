CC = clang
CFLAGS = -std=c17 -fsanitize=address,leak,undefined -fno-omit-frame-pointer \
	 -Weverything -Werror -Wno-c++-compat -Wno-pre-c11-compat -Wno-nrvo \
	 -D_POSIX_C_SOURCE=202405L -g -O0
SRC = $(wildcard ./src/*.c)
INC = ./src/
OBJS = $(patsubst ./src/%.c, ./build/%.o, $(SRC))

build: $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@

./build/%.o: ./src/%.c
	mkdir -p ./build/
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf ./build ./build/

.PHONY: build clean

