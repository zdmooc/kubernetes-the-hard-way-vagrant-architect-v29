#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"
log_info "=== DEMO WALKTHROUGH - Kubernetes The Hard Way Architect Edition ==="
log_info ""
log_info "STEP 1: Cluster Health Check"
kubectl get nodes -o wide
kubectl get pods -A | grep -v Running | grep -v Completed || log_success "All pods running"
log_info ""
log_info "STEP 2: Control Plane Components"
kubectl get componentstatuses 2>/dev/null || kubectl get --raw='/healthz?verbose' 2>/dev/null
log_info ""
log_info "STEP 3: Observability Stack"
kubectl get pods -n observability
log_info ""
log_info "STEP 4: Logging Stack"
kubectl get pods -n logging
log_info ""
log_info "STEP 5: Policy Engine"
kubectl get clusterpolicies 2>/dev/null || log_warning "Kyverno not installed yet"
log_info ""
log_info "STEP 6: GitOps (ArgoCD)"
kubectl get applications -n argocd 2>/dev/null || log_warning "ArgoCD not installed yet"
log_success "=== DEMO COMPLETE ==="
