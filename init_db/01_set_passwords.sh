#!/bin/bash
set -e

SANDBOX_USER_PASSWORD="$(cat /run/secrets/sandbox_user_password)"

psql -v ON_ERROR_STOP=1 \
     --username "$POSTGRES_USER" \
     --dbname "$POSTGRES_DB" <<-EOSQL
  ALTER ROLE sandbox_user PASSWORD '${SANDBOX_USER_PASSWORD}';
EOSQL