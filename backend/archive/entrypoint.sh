#!/usr/bin/env bash

set -euo pipefail

python3 -m wait_for_it --service "postgres:5432"
python3 -m manage migrate --noinput
python3 -m manage collectstatic --no-input
exec "$@"
