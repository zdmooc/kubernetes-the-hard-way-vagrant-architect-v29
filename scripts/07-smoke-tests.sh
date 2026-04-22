#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"

KCFG="$(kubeconfig_path)"
[[ -f "$KCFG" ]] || fail "Kubeconfig admin manquant: $KCFG"
export KUBECONFIG="$KCFG"

log "Smoke tests cluster"
kubectl get nodes -o wide
kubectl get pods -A -o wide
kubectl get svc -A

log "Tests applicatifs"
kubectl -n smoke get deploy,svc,pod
kubectl auth can-i get pods --as=system:serviceaccount:smoke:smoke-reader -n smoke
