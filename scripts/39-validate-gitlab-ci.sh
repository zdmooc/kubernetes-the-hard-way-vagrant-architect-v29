#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"
log_info "Validating GitLab CI pipeline files..."
for f in gitlab/ci/*.yml; do
  if [ -s "$f" ]; then
    log_success "  $f - OK (non-empty)"
  else
    log_error "  $f - EMPTY"
  fi
done
log_success "GitLab CI validation complete"
