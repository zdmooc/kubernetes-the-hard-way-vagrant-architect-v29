#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"
log_info "Validating Policy Engine assets..."
for f in policy/policies/*.yaml; do
  lines=$(wc -l < "$f")
  [ "$lines" -ge 20 ] && log_success "  $f ($lines lines) - OK" || log_error "  $f ($lines lines) - TOO SHORT"
done
KYVERNO_READY=$(kubectl get deployment kyverno -n kyverno -o jsonpath='{.status.readyReplicas}' 2>/dev/null || echo "0")
[ "$KYVERNO_READY" -ge 1 ] && log_success "Kyverno: READY" || log_warning "Kyverno: not deployed yet"
kubectl get clusterpolicies 2>/dev/null || log_warning "No ClusterPolicies found"
