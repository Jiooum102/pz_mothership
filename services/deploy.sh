#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

SERVICES=(
  minio
  mongo
  redis
  prometheus
  grafana
  node_exporter
  nvidia-dcgm-exporter
  cadvisor
  portainer
  portainer-agent
  ollama
  openwebui
)

list_services() {
  printf '%s\n' "${SERVICES[@]}"
}

is_valid_service() {
  local name="$1"
  for svc in "${SERVICES[@]}"; do
    if [[ "$svc" == "$name" ]]; then
      return 0
    fi
  done
  return 1
}

run_service_deploy() {
  local service="$1"
  local script_path="${SCRIPT_DIR}/${service}/deploy.sh"

  if [[ ! -x "$script_path" ]]; then
    echo "Deploy script missing or not executable: $script_path" >&2
    exit 1
  fi

  echo "Deploying service: $service"
  (cd "${SCRIPT_DIR}/${service}" && ./deploy.sh)
}

usage() {
  cat <<'EOF'
Usage:
  ./deploy.sh all
  ./deploy.sh <service-name> [<service-name> ...]
  ./deploy.sh --list

Examples:
  ./deploy.sh all
  ./deploy.sh minio mongo
  ./deploy.sh ollama openwebui
EOF
}

main() {
  if [[ $# -eq 0 ]]; then
    usage
    exit 1
  fi

  case "$1" in
    --list)
      list_services
      exit 0
      ;;
    all)
      for service in "${SERVICES[@]}"; do
        run_service_deploy "$service"
      done
      ;;
    *)
      for service in "$@"; do
        if ! is_valid_service "$service"; then
          echo "Unknown service: $service" >&2
          echo "" >&2
          usage >&2
          exit 1
        fi
        run_service_deploy "$service"
      done
      ;;
  esac

  echo "Deployment completed."
}

main "$@"
