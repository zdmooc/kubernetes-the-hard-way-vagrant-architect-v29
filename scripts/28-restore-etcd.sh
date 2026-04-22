#!/usr/bin/env bash
set -euo pipefail
SNAPSHOT_PATH="${1:-}"
if [[ -z "$SNAPSHOT_PATH" ]]; then
  echo "Usage: $0 /path/to/etcd-snapshot.db" >&2
  exit 1
fi
cat <<EOF
[INFO] etcd restore drill template.
Expected restore flow:
1. stop kube-apiserver and etcd on target control plane
2. restore snapshot to a clean data-dir
3. reconfigure etcd unit if necessary
4. restart etcd then kube-apiserver
5. validate cluster health

Example:
ETCDCTL_API=3 etcdctl snapshot restore "$SNAPSHOT_PATH"   --data-dir=/var/lib/etcd-from-backup
EOF
