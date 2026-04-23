#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=scripts/lib.sh
source "$(dirname "$0")/lib.sh"
log_info "Bootstrapping AWX on Kubernetes cluster..."
log_info "Applying AWX Operator..."
kubectl apply -f https://raw.githubusercontent.com/ansible/awx-operator/main/deploy/awx-operator.yaml 2>/dev/null || true
log_info "Waiting for AWX Operator to be ready..."
kubectl wait --for=condition=available deployment/awx-operator-controller-manager -n awx --timeout=120s 2>/dev/null || log_warning "AWX Operator not ready yet"
log_info "Applying AWX instance manifest..."
kubectl apply -f awx/awx-instance.yaml 2>/dev/null || log_warning "AWX instance manifest not found, skipping"
log_success "AWX bootstrap initiated. Check status with: kubectl get awx -n awx"
