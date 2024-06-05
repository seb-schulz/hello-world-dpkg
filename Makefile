BUILDAH ?= $(shell which buildah)

.PHONY: build
build: hello-world

.PHONY: clean
clean:
	rm -rf hello

.PHONY: build-deb
build-deb:
	dpkg-buildpackage -us -uc
	mkdir -p dist && cp ../hello-world*.deb dist/

.PHONY: build-with-buildah
build-with-buildah:
	mkdir -p dist && $(BUILDAH) bud --rm --layers -v $(CURDIR)/dist:/workspace/dist:z


hello-world: hello-world.c
	$(CC) -o $@ $<
