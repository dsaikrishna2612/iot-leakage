#!/bin/bash
set -euo pipefail

# Runs once on first MySQL container start (empty data volume).
# Imports the project schema/seed from Database.txt.

echo "[iot-leakage] Importing Database.txt..."

mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" <<-EOSQL
  CREATE DATABASE IF NOT EXISTS leakage_of_authorization;
EOSQL

# Make CREATE DATABASE idempotent for Docker's pre-created MYSQL_DATABASE
sed -e 's/^create database.*/CREATE DATABASE IF NOT EXISTS leakage_of_authorization;/' \
    /schema/Database.txt \
  | mysql -uroot -p"${MYSQL_ROOT_PASSWORD}"

echo "[iot-leakage] Database import complete."
