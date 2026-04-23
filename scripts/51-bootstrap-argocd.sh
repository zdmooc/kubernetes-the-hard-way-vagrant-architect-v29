#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=scripts/lib.sh
source "$(dirname "$0")/lib.sh"
log_info "Bootstrapping ArgoCD..."
kubectl apply -f gitops/argocd/installation.yaml
log_info "Waiting for ArgoCD server to be ready..."
kubectl wait --for=condition=available deployment/argocd-server -n argocd --timeout=180s
log_info "Applying App-of-Apps pattern..."
kubectl apply -f gitops/argocd/app-of-apps.yaml
log_success "ArgoCD deployed. Access at NodePort 30080 (http) or 30443 (https)"
