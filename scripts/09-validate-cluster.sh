#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"

require_cmd kubectl
KCFG="$(kubeconfig_path)"
[[ -f "$KCFG" ]] || fail "Kubeconfig admin manquant: $KCFG"
export KUBECONFIG="$KCFG"

log "Validation du cluster"
kubectl get nodes -o wide
kubectl get pods -A -o wide
kubectl get svc -A
kubectl get endpointslices.discovery.k8s.io -A
log "Validation V18 terminée"
