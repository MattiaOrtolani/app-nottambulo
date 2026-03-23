#!/usr/bin/env bash

set -euo pipefail

NAMESPACE="${NAMESPACE:-app-nottambulo}"
BACKEND_LOCAL_PORT="${BACKEND_LOCAL_PORT:-8080}"
FRONTEND_LOCAL_PORT="${FRONTEND_LOCAL_PORT:-4200}"
POSTGRES_LOCAL_PORT="${POSTGRES_LOCAL_PORT:-5433}"
KEYCLOAK_LOCAL_PORT="${KEYCLOAK_LOCAL_PORT:-8082}"

PIDS=()

require_cluster() {
	if ! kubectl cluster-info >/dev/null 2>&1; then
		echo "Kubernetes non raggiungibile con il contesto corrente: $(kubectl config current-context 2>/dev/null || echo unknown)" >&2
		echo "Verifica che il cluster sia acceso e che kubeconfig punti al server giusto." >&2
		exit 1
	fi
}

require_service() {
	local name="$1"

	if ! kubectl -n "${NAMESPACE}" get svc "${name}" >/dev/null 2>&1; then
		echo "Service non trovato: ${name} nel namespace ${NAMESPACE}" >&2
		exit 1
	fi
}

cleanup() {
	for pid in "${PIDS[@]:-}"; do
		if kill -0 "${pid}" 2>/dev/null; then
			kill "${pid}" 2>/dev/null || true
		fi
	done

	wait "${PIDS[@]:-}" 2>/dev/null || true
}

start_port_forward() {
	local name="$1"
	local local_port="$2"
	local remote_port="$3"
	local pid

	echo "Starting port-forward for ${name} on localhost:${local_port} -> ${remote_port}"
	kubectl -n "${NAMESPACE}" port-forward "svc/${name}" "${local_port}:${remote_port}" &
	pid="$!"
	PIDS+=("${pid}")

	sleep 1

	if ! kill -0 "${pid}" 2>/dev/null; then
		echo "Port-forward fallito per ${name}. Controlla output kubectl sopra." >&2
		exit 1
	fi
}

trap cleanup EXIT INT TERM

require_cluster
require_service "backend-svc"
require_service "frontend-svc"
require_service "postgres-svc"

start_port_forward "backend-svc" "${BACKEND_LOCAL_PORT}" 8080
start_port_forward "frontend-svc" "${FRONTEND_LOCAL_PORT}" 80
start_port_forward "postgres-svc" "${POSTGRES_LOCAL_PORT}" 5432

if kubectl -n "${NAMESPACE}" get svc keycloak >/dev/null 2>&1; then
	start_port_forward "keycloak" "${KEYCLOAK_LOCAL_PORT}" 8080
fi

echo
echo "Port-forward attivi:"
echo "  backend  -> http://localhost:${BACKEND_LOCAL_PORT}"
echo "  frontend -> http://localhost:${FRONTEND_LOCAL_PORT}"
echo "  postgres -> localhost:${POSTGRES_LOCAL_PORT}"

if kubectl -n "${NAMESPACE}" get svc keycloak >/dev/null 2>&1; then
	echo "  keycloak -> http://localhost:${KEYCLOAK_LOCAL_PORT}"
fi

echo
echo "Premi Ctrl+C per fermarli tutti."

wait
