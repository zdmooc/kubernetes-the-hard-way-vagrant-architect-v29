#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
rm -rf "$ROOT_DIR/evidence/generated" "$ROOT_DIR/kubernetes/pki/generated" "$ROOT_DIR/kubernetes/kubeconfigs/generated"
mkdir -p "$ROOT_DIR/evidence/generated" "$ROOT_DIR/kubernetes/pki/generated" "$ROOT_DIR/kubernetes/kubeconfigs/generated"
echo "[INFO] Local generated artifacts reset complete."
