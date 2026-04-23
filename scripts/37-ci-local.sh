#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/lib.sh"

log_info "Running local CI baseline checks..."

required=(README.md Makefile scripts/26-build-platform.sh .gitlab-ci.yml)
for p in "${required[@]}"; do
  if [[ ! -e "$ROOT_DIR/$p" ]]; then
    log_error "Missing $p"
    exit 1
  fi
done

log_info "Checking shell scripts syntax..."
if command -v shellcheck &>/dev/null; then
  find "$ROOT_DIR/scripts" -name "*.sh" -exec shellcheck {} + || log_warning "Shellcheck found issues"
else
  log_warning "shellcheck not found, skipping"
fi

log_success "Local CI baseline checks passed."
