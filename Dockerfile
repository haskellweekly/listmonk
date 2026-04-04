FROM listmonk/listmonk:v6.1.0

WORKDIR /listmonk
COPY config.toml .
CMD \
  ./listmonk --idempotent --install --yes && \
  ./listmonk --upgrade --yes && \
  ./listmonk
