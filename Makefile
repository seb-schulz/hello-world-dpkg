BUILDAH ?= $(shell which buildah)

.PHONY: build
build: hello-world

.PHONY: clean
clean:
	rm -rf hello-world hello-world.1

.PHONY: dist-clean
dist-clean: clean
	rm -rf dist
	$(MAKE) -f debian/rules clean

.PHONY: build-with-buildah
build-with-buildah:
	mkdir -p dist && $(BUILDAH) bud --rm --layers -v $(CURDIR)/dist:/workspace/dist:z

hello-world: hello-world.c
	$(CC) -o $@ $<
