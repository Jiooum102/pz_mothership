#!/usr/bin/env bash
set -euo pipefail

set -a
source "../../.env.dev"
set +a

docker compose -f docker-compose.yml up -d
