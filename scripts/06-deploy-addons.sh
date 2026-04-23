#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=scripts/lib.sh
source "$(dirname "$0")/lib.sh"

require_cmd kubectl
KCFG="$(kubeconfig_path)"
[[ -f "$KCFG" ]] || fail "Kubeconfig admin manquant: $KCFG"
export KUBECONFIG="$KCFG"

MANIFEST_DIR="${REPO_ROOT}/kubernetes/manifests"
for f in   "${MANIFEST_DIR}/namespaces/platform-system.yaml"   "${MANIFEST_DIR}/smoke-namespace.yaml"   "${MANIFEST_DIR}/rbac-audit-readonly.yaml"   "${MANIFEST_DIR}/default-deny.yaml"   "${MANIFEST_DIR}/allow-dns.yaml"   "${MANIFEST_DIR}/coredns.yaml"   "${MANIFEST_DIR}/nginx-smoke.yaml"; do
  [[ -f "$f" ]] || continue
  log "Application $(basename "$f")"
  kubectl apply -f "$f"
done
