#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=scripts/lib.sh
source "$(dirname "$0")/lib.sh"
log_info "Validating AWX asset files..."
for f in awx/job-templates/*.yml awx/workflow-templates/*.yml; do
  lines=$(wc -l < "$f")
  if [ "$lines" -ge 5 ]; then
    log_success "  $f ($lines lines) - OK"
  else
    log_error "  $f ($lines lines) - TOO SHORT"
  fi
done
log_success "AWX assets validation complete"
