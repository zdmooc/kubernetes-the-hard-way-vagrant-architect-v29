#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"
log_info "Validating logging stack..."
kubectl get pods -n logging
LOKI_READY=$(kubectl get statefulset loki -n logging -o jsonpath='{.status.readyReplicas}' 2>/dev/null || echo "0")
PROMTAIL_DESIRED=$(kubectl get daemonset promtail -n logging -o jsonpath='{.status.desiredNumberScheduled}' 2>/dev/null || echo "0")
PROMTAIL_READY=$(kubectl get daemonset promtail -n logging -o jsonpath='{.status.numberReady}' 2>/dev/null || echo "0")
[ "$LOKI_READY" -ge 1 ] && log_success "Loki: READY" || log_error "Loki: NOT READY"
[ "$PROMTAIL_READY" -eq "$PROMTAIL_DESIRED" ] && log_success "Promtail: READY ($PROMTAIL_READY/$PROMTAIL_DESIRED)" || log_error "Promtail: NOT READY ($PROMTAIL_READY/$PROMTAIL_DESIRED)"
