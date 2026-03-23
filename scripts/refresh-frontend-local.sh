#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NAMESPACE="app-nottambulo"
DEPLOYMENT="frontend"
IMAGE="app-nottambulo-frontend:local"

echo "Building ${IMAGE}..."
docker build -t "${IMAGE}" "${ROOT_DIR}/frontend"

echo "Updating deployment ${DEPLOYMENT} in namespace ${NAMESPACE}..."
kubectl set image "deployment/${DEPLOYMENT}" "${DEPLOYMENT}=${IMAGE}" -n "${NAMESPACE}"
kubectl rollout restart "deployment/${DEPLOYMENT}" -n "${NAMESPACE}"
kubectl rollout status "deployment/${DEPLOYMENT}" -n "${NAMESPACE}"

echo "Frontend refreshed successfully."
