.PHONY: build
build: hello-world

.PHONY: clean
clean:
	rm -rf hello

.PHONY: build-deb
build-deb:
	dpkg-buildpackage -us -uc
	mkdir -p dist && cp ../hello-world*.deb dist/

hello-world: hello-world.c
	$(CC) -o $@ $<
