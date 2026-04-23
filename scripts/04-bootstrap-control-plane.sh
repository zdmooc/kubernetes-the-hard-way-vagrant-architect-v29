#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"

BIN_DIR_REMOTE="/usr/local/bin"
CONFIG_DIR="/etc/kubernetes/config"
STATE_DIR="/var/lib/kubernetes"
PKI_DIR="/etc/kubernetes/pki"
LOCAL_BIN_DIR="${REPO_ROOT}/artifacts/bin"
LOCAL_CFG_DIR="${REPO_ROOT}/kubernetes/configs"
LOCAL_KCFG_DIR="${REPO_ROOT}/kubernetes/kubeconfigs/generated"
LOCAL_PKI_DIR="${REPO_ROOT}/kubernetes/pki"

for c in $(controllers); do
  log "Bootstrap control plane ${c}"
  ssh_node "$c" "sudo mkdir -p ${CONFIG_DIR} ${STATE_DIR} ${PKI_DIR} /var/log/kubernetes ${BIN_DIR_REMOTE}"

  for bin in kube-apiserver kube-controller-manager kube-scheduler kubectl; do
    [[ -f "${LOCAL_BIN_DIR}/${bin}" ]] || fail "Binaire manquant: ${LOCAL_BIN_DIR}/${bin}"
    scp_to_node "${LOCAL_BIN_DIR}/${bin}" "$c" "/tmp/${bin}"
    ssh_node "$c" "sudo mv /tmp/${bin} ${BIN_DIR_REMOTE}/${bin} && sudo chmod +x ${BIN_DIR_REMOTE}/${bin}"
  done

  for unit in kube-apiserver.service kube-controller-manager.service kube-scheduler.service; do
    scp_to_node "${REPO_ROOT}/kubernetes/systemd/${unit}" "$c" "/tmp/${unit}"
    ssh_node "$c" "sudo mv /tmp/${unit} /etc/systemd/system/${unit}"
  done

  for cfg in kube-scheduler.yaml audit-policy.yaml; do
    [[ -f "${LOCAL_CFG_DIR}/${cfg}" ]] || fail "Config manquante: ${LOCAL_CFG_DIR}/${cfg}"
    scp_to_node "${LOCAL_CFG_DIR}/${cfg}" "$c" "/tmp/${cfg}"
    ssh_node "$c" "sudo mv /tmp/${cfg} ${CONFIG_DIR}/${cfg}"
  done

  for file in kube-controller-manager.kubeconfig kube-scheduler.kubeconfig admin.kubeconfig; do
    [[ -f "${LOCAL_KCFG_DIR}/${file}" ]] || fail "Kubeconfig manquant: ${LOCAL_KCFG_DIR}/${file}"
    scp_to_node "${LOCAL_KCFG_DIR}/${file}" "$c" "/tmp/${file}"
    ssh_node "$c" "sudo mv /tmp/${file} ${STATE_DIR}/${file}"
  done

  for crt in ca.pem ca-key.pem kubernetes.pem kubernetes-key.pem service-account.pem service-account-key.pem; do
    [[ -f "${LOCAL_PKI_DIR}/${crt}" ]] || fail "Certificat manquant: ${LOCAL_PKI_DIR}/${crt}"
    scp_to_node "${LOCAL_PKI_DIR}/${crt}" "$c" "/tmp/${crt}"
    ssh_node "$c" "sudo mv /tmp/${crt} ${PKI_DIR}/${crt}"
  done

  if [[ -f "${REPO_ROOT}/kubernetes/systemd/kube-apiserver.service.d/10-oidc.conf" ]]; then
    ssh_node "$c" "sudo mkdir -p /etc/systemd/system/kube-apiserver.service.d"
    scp_to_node "${REPO_ROOT}/kubernetes/systemd/kube-apiserver.service.d/10-oidc.conf" "$c" "/tmp/10-oidc.conf"
    ssh_node "$c" "sudo mv /tmp/10-oidc.conf /etc/systemd/system/kube-apiserver.service.d/10-oidc.conf"
  fi

  ssh_node "$c" "sudo systemctl daemon-reload && sudo systemctl enable kube-apiserver kube-controller-manager kube-scheduler && sudo systemctl restart kube-apiserver kube-controller-manager kube-scheduler"
  ssh_node "$c" "sudo systemctl is-active kube-apiserver kube-controller-manager kube-scheduler"
done

log "Validation du control plane"
ssh_node controller-0 "curl -k https://127.0.0.1:6443/readyz && echo"
