#!/usr/bin/env bash
set -euo pipefail
cat <<'EOF'
[INFO] Conformance-lite checks to run after cluster build:
- kubectl cluster-info
- kubectl get nodes
- kubectl get pods -A
- kubectl run dns-test --image=busybox:1.36 --restart=Never -- nslookup kubernetes.default
- kubectl auth can-i get pods --all-namespaces
- kubectl top nodes
EOF
