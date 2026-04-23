#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/lib.sh"

OUT="$ROOT_DIR/evidence/logs"
mkdir -p "$OUT"

log_info "Collecting logs from control plane nodes..."
for i in 0 1 2; do
  log_info "Collecting from controller-${i}..."
  vagrant ssh controller-${i} -c "sudo journalctl -u kube-apiserver --no-pager > /tmp/kube-apiserver.log" 2>/dev/null || log_warning "Failed on controller-${i}"
done

log_success "Log collection workspace prepared in $OUT"
