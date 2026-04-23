#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"
log_info "Deploying Grafana to observability namespace..."
kubectl apply -f kubernetes/manifests/observability/grafana.yaml
log_info "Waiting for Grafana deployment to be ready..."
kubectl wait --for=condition=available deployment/grafana -n observability --timeout=120s
log_success "Grafana deployed. Access at NodePort 30000 (admin/admin)"
