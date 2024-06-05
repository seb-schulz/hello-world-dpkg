# hello-world-dpkg

This is an example how to build a debian package.
Goal is to keep it as simple as possible.

## Build debian packages

Run `make build-with-buildah` starts a container.
Relevant files are dropped into `dist/`

For more information, checkout [build routine](Dockerfile).

## Install debian package

- Install package with `sudo apt install -f ./dist/hello-world_0.1.0_amd64.deb`
- Run `hello-world` and check with `which hello-world` path of binary
- Test manpage with `man hello-world`
- Uninstall entire package with `sudo apt purge hello-world`
