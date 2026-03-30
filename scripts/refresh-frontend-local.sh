#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NAMESPACE="app-nottambulo"
DEPLOYMENT="frontend"
IMAGE="app-nottambulo-frontend:local"
MINIKUBE_PROFILE="${MINIKUBE_PROFILE:-minikube}"

require_command() {
	if ! command -v "$1" >/dev/null 2>&1; then
		echo "Comando richiesto non trovato: $1" >&2
		exit 1
	fi
}

require_command minikube
require_command docker
require_command kubectl

if ! minikube status -p "${MINIKUBE_PROFILE}" >/dev/null 2>&1; then
	echo "Minikube non risulta avviato per il profilo ${MINIKUBE_PROFILE}." >&2
	exit 1
fi

ORIGINAL_DOCKER_HOST="${DOCKER_HOST:-}"
ORIGINAL_DOCKER_TLS_VERIFY="${DOCKER_TLS_VERIFY:-}"
ORIGINAL_DOCKER_CERT_PATH="${DOCKER_CERT_PATH:-}"
ORIGINAL_MINIKUBE_ACTIVE_DOCKERD="${MINIKUBE_ACTIVE_DOCKERD:-}"

cleanup() {
	if [[ -n "${ORIGINAL_DOCKER_HOST}" ]]; then
		export DOCKER_HOST="${ORIGINAL_DOCKER_HOST}"
	else
		unset DOCKER_HOST
	fi

	if [[ -n "${ORIGINAL_DOCKER_TLS_VERIFY}" ]]; then
		export DOCKER_TLS_VERIFY="${ORIGINAL_DOCKER_TLS_VERIFY}"
	else
		unset DOCKER_TLS_VERIFY
	fi

	if [[ -n "${ORIGINAL_DOCKER_CERT_PATH}" ]]; then
		export DOCKER_CERT_PATH="${ORIGINAL_DOCKER_CERT_PATH}"
	else
		unset DOCKER_CERT_PATH
	fi

	if [[ -n "${ORIGINAL_MINIKUBE_ACTIVE_DOCKERD}" ]]; then
		export MINIKUBE_ACTIVE_DOCKERD="${ORIGINAL_MINIKUBE_ACTIVE_DOCKERD}"
	else
		unset MINIKUBE_ACTIVE_DOCKERD
	fi
}

trap cleanup EXIT

echo "Switching Docker environment to Minikube (${MINIKUBE_PROFILE})..."
eval "$(minikube -p "${MINIKUBE_PROFILE}" docker-env)"

echo "Building ${IMAGE} inside Minikube..."
docker build -t "${IMAGE}" "${ROOT_DIR}/frontend"

echo "Updating deployment ${DEPLOYMENT} in namespace ${NAMESPACE}..."
kubectl set image "deployment/${DEPLOYMENT}" "${DEPLOYMENT}=${IMAGE}" -n "${NAMESPACE}"
kubectl rollout restart "deployment/${DEPLOYMENT}" -n "${NAMESPACE}"
kubectl rollout status "deployment/${DEPLOYMENT}" -n "${NAMESPACE}"

echo "Frontend refreshed successfully from Minikube image cache."
