#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"
log_info "Bootstrapping Kyverno Policy Engine..."
kubectl create -f https://github.com/kyverno/kyverno/releases/download/v1.10.0/install.yaml 2>/dev/null || log_warning "Kyverno may already be installed"
log_info "Waiting for Kyverno to be ready..."
kubectl wait --for=condition=available deployment/kyverno -n kyverno --timeout=180s 2>/dev/null || log_warning "Kyverno not ready yet"
log_info "Applying baseline policies..."
kubectl apply -f policy/policies/
log_success "Kyverno deployed with baseline policies"
