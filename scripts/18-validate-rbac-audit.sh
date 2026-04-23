#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/lib.sh"

log "Checking RBAC and admission resources"
kubectl get ns smoke platform-system
kubectl get sa -n smoke
kubectl get role,rolebinding -n smoke
kubectl get validatingadmissionpolicy,validatingadmissionpolicybinding

log "Testing permissions"
kubectl auth can-i get pods --as=system:serviceaccount:smoke:viewer -n smoke || true
kubectl auth can-i create deployments --as=system:serviceaccount:smoke:viewer -n smoke || true

log "Testing compliant pod"
kubectl apply -f "$ROOT_DIR/kubernetes/manifests/policies/compliant-pod-example.yaml" || true

log "Testing violating pod (expected to fail once admission policy is active)"
kubectl apply -f "$ROOT_DIR/kubernetes/manifests/policies/violating-pod-example.yaml" || true
