#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

docker build -t app-nottambulo-backend:local "${ROOT_DIR}/backend"
docker build -t app-nottambulo-frontend:local "${ROOT_DIR}/frontend"

echo "Immagini locali buildate:"
echo "  - app-nottambulo-backend:local"
echo "  - app-nottambulo-frontend:local"
