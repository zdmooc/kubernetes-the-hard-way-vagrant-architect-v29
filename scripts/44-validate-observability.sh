#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"
log_info "Validating observability stack..."
kubectl get pods -n observability
PROMETHEUS_READY=$(kubectl get deployment prometheus -n observability -o jsonpath='{.status.readyReplicas}' 2>/dev/null || echo "0")
GRAFANA_READY=$(kubectl get deployment grafana -n observability -o jsonpath='{.status.readyReplicas}' 2>/dev/null || echo "0")
[ "$PROMETHEUS_READY" -ge 1 ] && log_success "Prometheus: READY" || log_error "Prometheus: NOT READY"
[ "$GRAFANA_READY" -ge 1 ] && log_success "Grafana: READY" || log_error "Grafana: NOT READY"
