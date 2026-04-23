#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=scripts/lib.sh
source "$(dirname "$0")/lib.sh"

log_info "Validating Policy Engine assets..."

for f in policy/policies/*.yaml; do
  lines=$(wc -l < "$f")
  if [ "$lines" -ge 20 ]; then
    log_success "  $f ($lines lines) - OK"
  else
    log_error "  $f ($lines lines) - TOO SHORT"
  fi
done

KYVERNO_READY=$(kubectl get deployment kyverno -n kyverno -o jsonpath='{.status.readyReplicas}' 2>/dev/null || echo "0")

if [ "$KYVERNO_READY" -ge 1 ]; then
  log_success "Kyverno: READY"
else
  log_warning "Kyverno: not deployed yet"
fi

kubectl get clusterpolicies 2>/dev/null || log_warning "No ClusterPolicies found"
