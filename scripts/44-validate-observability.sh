#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=scripts/lib.sh
source "$(dirname "$0")/lib.sh"

log_info "Validating observability stack..."
kubectl get pods -n observability

PROMETHEUS_READY=$(kubectl get deployment prometheus -n observability -o jsonpath='{.status.readyReplicas}' 2>/dev/null || echo "0")
GRAFANA_READY=$(kubectl get deployment grafana -n observability -o jsonpath='{.status.readyReplicas}' 2>/dev/null || echo "0")

if [ "$PROMETHEUS_READY" -ge 1 ]; then
  log_success "Prometheus: READY"
else
  log_error "Prometheus: NOT READY"
fi

if [ "$GRAFANA_READY" -ge 1 ]; then
  log_success "Grafana: READY"
else
  log_error "Grafana: NOT READY"
fi
