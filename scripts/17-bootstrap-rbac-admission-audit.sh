#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/lib.sh"

log "Applying namespaces and Pod Security labels"
kubectl apply -f "$ROOT_DIR/kubernetes/manifests/namespaces/platform-system.yaml"

log "Applying RBAC examples"
kubectl apply -f "$ROOT_DIR/kubernetes/manifests/rbac/namespace-auditor.yaml"
kubectl apply -f "$ROOT_DIR/kubernetes/manifests/rbac/platform-admin.yaml" || true
kubectl apply -f "$ROOT_DIR/kubernetes/manifests/rbac/serviceaccount-samples.yaml"

log "Applying sample admission policies"
kubectl apply -f "$ROOT_DIR/kubernetes/manifests/policies/require-non-root-vap.yaml"

log "Reminder: copy audit policy to controller nodes and wire kube-apiserver with --audit-policy-file and --audit-log-path"
log "Suggested target: /etc/kubernetes/audit-policy.yaml and /var/log/kubernetes/audit.log"
