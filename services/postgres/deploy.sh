#!/usr/bin/env bash
set -euo pipefail

# Load environment variables from .env.dev in the root directory
set -a
source "../../.env.dev"
set +a

# Start the service
docker compose -f docker-compose.yml up -d
