#!/bin/bash
set -e

# Logar como superusuário postgres
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE EXTENSION pgvector;
EOSQL
