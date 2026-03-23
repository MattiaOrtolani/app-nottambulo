#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NAMESPACE="${NAMESPACE:-app-nottambulo}"
DEPLOYMENT_NAME="${DEPLOYMENT_NAME:-postgres}"
SQL_FILE="${ROOT_DIR}/scripts/seed-locali-lombardia-300.sql"

kubectl exec -i -n "${NAMESPACE}" "deployment/${DEPLOYMENT_NAME}" -- \
  sh -lc 'psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB"' \
  < "${SQL_FILE}"

echo "Seed Lombardia completato: 300 locali caricati nel namespace ${NAMESPACE}."
