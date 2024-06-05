ARG DEBIAN_TAG=testing

FROM docker.io/debian:${DEBIAN_TAG} AS build

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y build-essential devscripts debhelper pandoc \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /workspaces

COPY . .

RUN dpkg-buildpackage -us -uc \
    && cp ../hello-world*.deb /workspace/dist \
    && cp ../hello-world*.buildinfo /workspace/dist \
    && cp ../hello-world*.changes /workspace/dist \
    && cp ../hello-world*.tar* /workspace/dist \
    && cp ../hello-world*.dsc /workspace/dist
