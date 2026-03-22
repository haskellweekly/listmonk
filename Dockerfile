FROM listmonk/listmonk:v6.0.0

WORKDIR /listmonk
COPY config.toml .
CMD \
  ./listmonk --idempotent --install --yes && \
  ./listmonk --upgrade --yes && \
  ./listmonk
