# https://docs.docker.com/reference/dockerfile/

FROM alpine:3.21.2

COPY config.toml /root/listmonk/

WORKDIR /root/listmonk

ARG LISTMONK_VERSION=4.1.0
RUN \
  set -o errexit -o xtrace; \
  machine=$( uname -m ); \
  arch=$( case "$machine" in aarch64) echo arm64;; x86_64) echo amd64;; *) echo "$machine";; esac ); \
  wget -O listmonk.tgz "https://github.com/knadh/listmonk/releases/download/v$LISTMONK_VERSION/listmonk_${LISTMONK_VERSION}_linux_$arch.tar.gz"; \
  tar xf listmonk.tgz; \
  mv listmonk /usr/local/bin/; \
  listmonk --version

CMD \
  listmonk --idempotent --install --yes && \
  listmonk --upgrade --yes && \
  listmonk
