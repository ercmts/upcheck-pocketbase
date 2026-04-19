#!/bin/sh
set -e

exec /pb/pocketbase serve \
  --http=0.0.0.0:8080 \
  --initial-admin-email="${PB_ADMIN_EMAIL:-admin@upcheck.com}" \
  --initial-admin-password="${PB_ADMIN_PASSWORD:-Admin123456}"
