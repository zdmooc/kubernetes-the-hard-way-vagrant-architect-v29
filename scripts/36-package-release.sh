#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="$ROOT_DIR/dist"
mkdir -p "$OUT_DIR"
VERSION_TAG="${1:-v29-local}"
ZIP_NAME="kubernetes-the-hard-way-vagrant-architect-${VERSION_TAG}.zip"
(cd "$ROOT_DIR/.." && zip -r "$OUT_DIR/$ZIP_NAME" "$(basename "$ROOT_DIR")" >/dev/null)
echo "[INFO] Packaged release: $OUT_DIR/$ZIP_NAME"
