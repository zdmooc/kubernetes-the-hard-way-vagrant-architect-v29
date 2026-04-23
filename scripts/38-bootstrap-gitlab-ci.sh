#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=scripts/lib.sh
source "$(dirname "$0")/lib.sh"
log_info "Bootstrap GitLab CI configuration"
log_info "Validating .gitlab-ci.yml syntax..."
if command -v yamllint &>/dev/null; then
  yamllint .gitlab-ci.yml && log_success ".gitlab-ci.yml is valid YAML"
else
  log_warning "yamllint not found, skipping YAML validation"
fi
log_info "Checking GitLab CI includes..."
for f in gitlab/ci/*.yml; do
  log_info "  Found CI include: $f"
done
log_success "GitLab CI bootstrap complete"
