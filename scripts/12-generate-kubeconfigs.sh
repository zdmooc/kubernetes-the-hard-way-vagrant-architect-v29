#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=scripts/lib.sh
source "$(dirname "$0")/lib.sh"

require_cmd kubectl

OUT="${REPO_ROOT}/kubernetes/kubeconfigs/generated"
PKI="${REPO_ROOT}/kubernetes/pki"
LB_IP="$(node_ip lb-0)"
CLUSTER_NAME="kubernetes-the-hard-way"
API_SERVER="https://${LB_IP}:6443"
ensure_dir "$OUT"

make_kcfg() {
  local name="$1"
  local cert="$2"
  local key="$3"
  local server="${4:-$API_SERVER}"
  local out="$OUT/${name}.kubeconfig"

  kubectl config set-cluster "$CLUSTER_NAME"     --certificate-authority="$PKI/ca.pem"     --embed-certs=true     --server="$server"     --kubeconfig="$out" >/dev/null

  kubectl config set-credentials "$name"     --client-certificate="$cert"     --client-key="$key"     --embed-certs=true     --kubeconfig="$out" >/dev/null

  kubectl config set-context default     --cluster="$CLUSTER_NAME"     --user="$name"     --kubeconfig="$out" >/dev/null

  kubectl config use-context default --kubeconfig="$out" >/dev/null
}

make_kcfg admin "$PKI/admin.pem" "$PKI/admin-key.pem"
make_kcfg controller-manager "$PKI/controller-manager.pem" "$PKI/controller-manager-key.pem"
make_kcfg scheduler "$PKI/scheduler.pem" "$PKI/scheduler-key.pem" "https://127.0.0.1:6443"
make_kcfg kube-proxy "$PKI/kube-proxy.pem" "$PKI/kube-proxy-key.pem"
make_kcfg worker-0 "$PKI/worker-0.pem" "$PKI/worker-0-key.pem"
make_kcfg worker-1 "$PKI/worker-1.pem" "$PKI/worker-1-key.pem"

cp "$OUT/controller-manager.kubeconfig" "$OUT/kube-controller-manager.kubeconfig"
cp "$OUT/scheduler.kubeconfig" "$OUT/kube-scheduler.kubeconfig"

log "Kubeconfigs générés dans $OUT"
ls -1 "$OUT"
