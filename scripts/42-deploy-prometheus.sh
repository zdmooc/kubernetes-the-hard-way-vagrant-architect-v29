#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=scripts/lib.sh
source "$(dirname "$0")/lib.sh"
log_info "Deploying Prometheus to observability namespace..."
kubectl apply -f kubernetes/manifests/observability/namespace.yaml
kubectl apply -f kubernetes/manifests/observability/prometheus.yaml
log_info "Waiting for Prometheus deployment to be ready..."
kubectl wait --for=condition=available deployment/prometheus -n observability --timeout=120s
log_success "Prometheus deployed. Access at NodePort 30090"
