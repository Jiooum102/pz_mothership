#!/usr/bin/env bash
set -euo pipefail

set -a
source "../../.env.dev"
set +a

docker network inspect mothership-ollama-network >/dev/null 2>&1 || docker network create mothership-ollama-network
docker compose -f docker-compose.yml up -d
