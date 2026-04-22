#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
required=(README.md Makefile scripts/26-build-platform.sh docs/03-bootstrap/17-v18-local-platform-completion.md)
for p in "${required[@]}"; do
  [[ -e "$ROOT_DIR/$p" ]] || { echo "[ERROR] Missing $p" >&2; exit 1; }
done
echo "[INFO] Local CI baseline checks passed."
