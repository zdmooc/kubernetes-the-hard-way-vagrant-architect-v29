#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=scripts/lib.sh
source "$(dirname "$0")/lib.sh"

log_info "Validating GitOps assets..."

for f in gitops/argocd/*.yaml; do
  if [ -s "$f" ]; then
    log_success "  $f - OK"
  else
    log_error "  $f - EMPTY"
  fi
done

ARGOCD_READY=$(kubectl get deployment argocd-server -n argocd -o jsonpath='{.status.readyReplicas}' 2>/dev/null || echo "0")

if [ "$ARGOCD_READY" -ge 1 ]; then
  log_success "ArgoCD server: READY"
else
  log_warning "ArgoCD server: not deployed yet"
fi
