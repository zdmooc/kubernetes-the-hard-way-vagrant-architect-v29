#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=scripts/lib.sh
source "$(dirname "$0")/lib.sh"
log_info "Deploying Promtail DaemonSet to logging namespace..."
kubectl apply -f kubernetes/manifests/logging/promtail/promtail.yaml
log_info "Waiting for Promtail DaemonSet to be ready..."
kubectl rollout status daemonset/promtail -n logging --timeout=120s
log_success "Promtail deployed on all nodes"
