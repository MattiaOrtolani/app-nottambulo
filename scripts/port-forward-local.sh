#!/usr/bin/env bash

set -euo pipefail

NAMESPACE="${NAMESPACE:-app-nottambulo}"
KEYCLOAK_NAMESPACE="${KEYCLOAK_NAMESPACE:-keycloak}"
BACKEND_LOCAL_PORT="${BACKEND_LOCAL_PORT:-8080}"
FRONTEND_LOCAL_PORT="${FRONTEND_LOCAL_PORT:-4200}"
POSTGRES_LOCAL_PORT="${POSTGRES_LOCAL_PORT:-5433}"
KEYCLOAK_LOCAL_PORT="${KEYCLOAK_LOCAL_PORT:-8081}"

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
	local namespace="$1"
	local name="$2"
	local local_port="$3"
	local remote_port="$4"
	local address="${5:-}"
	local pid

	echo "Starting port-forward for ${name} on localhost:${local_port} -> ${remote_port}"
	if [[ -n "${address}" ]]; then
		kubectl -n "${namespace}" port-forward --address "${address}" "svc/${name}" "${local_port}:${remote_port}" &
	else
		kubectl -n "${namespace}" port-forward "svc/${name}" "${local_port}:${remote_port}" &
	fi
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

start_port_forward "${NAMESPACE}" "backend-svc" "${BACKEND_LOCAL_PORT}" 8080
start_port_forward "${NAMESPACE}" "frontend-svc" "${FRONTEND_LOCAL_PORT}" 80
start_port_forward "${NAMESPACE}" "postgres-svc" "${POSTGRES_LOCAL_PORT}" 5432

if kubectl -n "${KEYCLOAK_NAMESPACE}" get svc keycloak >/dev/null 2>&1; then
	start_port_forward "${KEYCLOAK_NAMESPACE}" "keycloak" "${KEYCLOAK_LOCAL_PORT}" 8080 "0.0.0.0"
fi

echo
echo "Port-forward attivi:"
echo "  backend  -> http://localhost:${BACKEND_LOCAL_PORT}"
echo "  frontend -> http://localhost:${FRONTEND_LOCAL_PORT}"
echo "  postgres -> localhost:${POSTGRES_LOCAL_PORT}"

if kubectl -n "${KEYCLOAK_NAMESPACE}" get svc keycloak >/dev/null 2>&1; then
	echo "  keycloak -> http://localhost:${KEYCLOAK_LOCAL_PORT}"
fi

echo
echo "Premi Ctrl+C per fermarli tutti."

wait
