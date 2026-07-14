FROM listmonk/listmonk:v6.1.0

WORKDIR /listmonk
COPY config.toml .
# Only serve. Schema migrations run once per deploy via fly.toml's
# `release_command`. The database is installed manually (see README);
# doing it on boot would silently re-create an empty schema if the
# database ever came up blank, masking data loss instead of failing loudly.
CMD ./listmonk
