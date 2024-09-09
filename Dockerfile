# https://docs.docker.com/reference/dockerfile/

FROM alpine:3.20.3

COPY config.toml /root/listmonk/

WORKDIR /root/listmonk

RUN \
  set -o errexit -o xtrace; \
  wget -O listmonk.tgz https://github.com/knadh/listmonk/releases/download/v3.0.0/listmonk_3.0.0_linux_amd64.tar.gz; \
  tar xf listmonk.tgz; \
  mv listmonk /usr/local/bin/; \
  listmonk --version

CMD listmonk --idempotent --install --yes && listmonk
