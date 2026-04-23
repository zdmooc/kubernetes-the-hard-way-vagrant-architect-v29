#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"

OUT="${REPO_ROOT}/evidence/command-outputs/$(date +%Y%m%d-%H%M%S)"
ensure_dir "$OUT"

kubectl get nodes -o wide > "${OUT}/nodes.txt" || true
kubectl get pods -A -o wide > "${OUT}/pods-all.txt" || true
kubectl get svc -A > "${OUT}/svc-all.txt" || true
kubectl get endpointslices -A > "${OUT}/endpointslices-all.txt" || true

for c in $(controllers); do
  ssh_node "$c" "sudo systemctl status etcd kube-apiserver kube-controller-manager kube-scheduler --no-pager" > "${OUT}/${c}-control-plane.txt" || true
done

for w in $(workers); do
  ssh_node "$w" "sudo systemctl status kubelet kube-proxy --no-pager" > "${OUT}/${w}-node-services.txt" || true
done

log "Éléments de preuve collectés dans ${OUT}"
