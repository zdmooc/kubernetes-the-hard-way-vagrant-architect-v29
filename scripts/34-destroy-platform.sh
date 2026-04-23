#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/lib.sh"

log_info "Destroying Vagrant machines..."
(cd "$ROOT_DIR/vagrant" && vagrant destroy -f)

log_info "Cleaning up local state..."
bash "$ROOT_DIR/scripts/33-reset-platform.sh"

log_success "Vagrant machines destroyed and state cleaned."
