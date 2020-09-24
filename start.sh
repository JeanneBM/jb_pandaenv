#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
env_file=".local/lab.env"
if [[ ! -f "$env_file" ]]; then
  printf '%s\n' 'Create .local/lab.env from .env.example and configure a NEW Jenkins agent secret locally.' >&2
  exit 1
fi
mkdir -p volumes/jenkins volumes/artifactory
# This historical lab requires fresh service setup; no saved users or credentials are restored.
exec docker compose --env-file "$env_file" -f compose/docker-compose.yml up -d --build
