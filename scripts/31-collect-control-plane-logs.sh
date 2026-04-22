#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="$ROOT_DIR/evidence/logs"
mkdir -p "$OUT"
cat > "$OUT/README.md" <<'EOF'
Collect logs from:
- etcd
- kube-apiserver
- kube-controller-manager
- kube-scheduler
- kubelet
- containerd
Example remote command:
  journalctl -u kube-apiserver --no-pager > kube-apiserver.log
EOF
echo "[INFO] Log collection workspace prepared in $OUT"
