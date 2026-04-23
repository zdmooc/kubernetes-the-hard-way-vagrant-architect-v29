#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=scripts/lib.sh
source "$(dirname "$0")/lib.sh"

log_info "Validating logging stack..."
kubectl get pods -n logging

LOKI_READY=$(kubectl get statefulset loki -n logging -o jsonpath='{.status.readyReplicas}' 2>/dev/null || echo "0")
PROMTAIL_DESIRED=$(kubectl get daemonset promtail -n logging -o jsonpath='{.status.desiredNumberScheduled}' 2>/dev/null || echo "0")
PROMTAIL_READY=$(kubectl get daemonset promtail -n logging -o jsonpath='{.status.numberReady}' 2>/dev/null || echo "0")

if [ "$LOKI_READY" -ge 1 ]; then
  log_success "Loki: READY"
else
  log_error "Loki: NOT READY"
fi

if [ "$PROMTAIL_READY" -eq "$PROMTAIL_DESIRED" ]; then
  log_success "Promtail: READY ($PROMTAIL_READY/$PROMTAIL_DESIRED)"
else
  log_error "Promtail: NOT READY ($PROMTAIL_READY/$PROMTAIL_DESIRED)"
fi
