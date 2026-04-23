#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"
log_info "Deploying Loki to logging namespace..."
kubectl apply -f kubernetes/manifests/logging/loki/loki.yaml
log_info "Waiting for Loki StatefulSet to be ready..."
kubectl rollout status statefulset/loki -n logging --timeout=120s
log_success "Loki deployed. Endpoint: loki.logging.svc.cluster.local:3100"
