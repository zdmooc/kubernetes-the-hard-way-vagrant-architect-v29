#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/lib.sh"

log_info "Resetting local generated artifacts..."
rm -rf "$ROOT_DIR/evidence/generated" "$ROOT_DIR/kubernetes/pki/generated" "$ROOT_DIR/kubernetes/kubeconfigs/generated"
mkdir -p "$ROOT_DIR/evidence/generated" "$ROOT_DIR/kubernetes/pki/generated" "$ROOT_DIR/kubernetes/kubeconfigs/generated"

log_info "Resetting Ansible state..."
rm -f "$ROOT_DIR/ansible/*.retry"

log_success "Local generated artifacts reset complete."
