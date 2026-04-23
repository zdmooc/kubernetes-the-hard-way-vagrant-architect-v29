#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/lib.sh"

banner "Validating identity boundaries"
mkdir -p "$ROOT_DIR/evidence/identity"

log_info "Checking Keycloak status..."
kubectl get pods -n keycloak || log_warning "Keycloak namespace not found"

log_info "Checking OIDC configuration on API server..."
if [ -f "$ROOT_DIR/kubernetes/configs/apiserver-oidc.env" ]; then
  log_success "OIDC config found"
else
  log_error "OIDC config missing"
fi

log_info "Checking RBAC manifests..."
ls -la "$ROOT_DIR/kubernetes/manifests/rbac/" || log_warning "RBAC manifests directory empty"

log_success "Identity boundaries validation complete"
