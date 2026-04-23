#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"
log_info "Validating GitOps assets..."
for f in gitops/argocd/*.yaml; do
  [ -s "$f" ] && log_success "  $f - OK" || log_error "  $f - EMPTY"
done
ARGOCD_READY=$(kubectl get deployment argocd-server -n argocd -o jsonpath='{.status.readyReplicas}' 2>/dev/null || echo "0")
[ "$ARGOCD_READY" -ge 1 ] && log_success "ArgoCD server: READY" || log_warning "ArgoCD server: not deployed yet"
