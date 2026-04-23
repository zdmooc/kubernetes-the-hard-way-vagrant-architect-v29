#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
bash "$ROOT_DIR/scripts/34-destroy-platform.sh"
bash "$ROOT_DIR/scripts/33-reset-platform.sh"
bash "$ROOT_DIR/scripts/26-build-platform.sh"
