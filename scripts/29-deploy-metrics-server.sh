#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MANIFEST_DIR="$ROOT_DIR/kubernetes/manifests/addons/metrics-server"
mkdir -p "$MANIFEST_DIR"
cat > "$MANIFEST_DIR/README.md" <<'EOF'
Place the metrics-server upstream manifest or kustomization here.
Then apply it with:
kubectl apply -f kubernetes/manifests/addons/metrics-server/
EOF
cat <<EOF
[INFO] Metrics Server baseline prepared in $MANIFEST_DIR
Next steps:
- download official metrics-server manifest
- patch args if needed for local lab certificates
- apply and validate with 'kubectl top nodes'
EOF
