#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OBS_DIR="$ROOT_DIR/kubernetes/manifests/observability"
mkdir -p "$OBS_DIR"
cat > "$OBS_DIR/README.md" <<'EOF'
Observability baseline content:
- metrics-server
- optional kube-state-metrics
- optional node-exporter / promtail / loki skeletons
EOF
cat <<EOF
[INFO] Observability baseline skeleton created at $OBS_DIR
EOF
