#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/lib.sh"
SNAP_DIR="${ROOT_DIR}/evidence/etcd"
mkdir -p "$SNAP_DIR"
TS="$(date +%Y%m%d-%H%M%S)"
OUT="$SNAP_DIR/etcd-snapshot-${TS}.db"
cat <<EOF
[INFO] etcd snapshot routine placeholder with realistic command template.
Run from a controller hosting etcd with etcdctl available and proper certs:
ETCDCTL_API=3 etcdctl   --endpoints=https://127.0.0.1:2379   --cacert=/etc/etcd/ca.pem   --cert=/etc/etcd/kubernetes.pem   --key=/etc/etcd/kubernetes-key.pem   snapshot save ${OUT}
EOF
printf 'snapshot_target=%s
' "$OUT" > "$SNAP_DIR/latest-backup.env"
