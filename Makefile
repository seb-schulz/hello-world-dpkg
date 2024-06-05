.PHONY: build
build: hello

.PHONY: clean
clean:
	rm -rf hello

hello: hello.c
	$(CC) -o $@ $<
