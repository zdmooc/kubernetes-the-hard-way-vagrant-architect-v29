#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/lib.sh"

OUT_DIR="$ROOT_DIR/dist"
mkdir -p "$OUT_DIR"
VERSION_TAG="${1:-v39-enterprise}"
ZIP_NAME="kubernetes-the-hard-way-vagrant-architect-${VERSION_TAG}.zip"

log_info "Packaging release ${VERSION_TAG}..."
(cd "$ROOT_DIR/.." && zip -r "$OUT_DIR/$ZIP_NAME" "$(basename "$ROOT_DIR")" -x "*.git*" -x "*vagrant/.vagrant*" >/dev/null)

log_success "Packaged release: $OUT_DIR/$ZIP_NAME"
