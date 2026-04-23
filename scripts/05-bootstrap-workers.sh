#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=scripts/lib.sh
source "$(dirname "$0")/lib.sh"

BIN_DIR_REMOTE="/usr/local/bin"
LOCAL_BIN_DIR="${REPO_ROOT}/artifacts/bin"
LOCAL_CFG_DIR="${REPO_ROOT}/kubernetes/configs"
LOCAL_KCFG_DIR="${REPO_ROOT}/kubernetes/kubeconfigs/generated"
LOCAL_PKI_DIR="${REPO_ROOT}/kubernetes/pki"

for w in $(workers); do
  log "Bootstrap worker ${w}"
  ssh_node "$w" "sudo mkdir -p /etc/containerd /var/lib/kubelet /var/lib/kube-proxy /etc/kubernetes/config /opt/cni/bin /usr/local/bin /etc/cni/net.d /etc/kubernetes/pki"
  ssh_node "$w" "sudo apt-get update && sudo apt-get install -y containerd"

  for bin in kubelet kube-proxy kubectl runc; do
    [[ -f "${LOCAL_BIN_DIR}/${bin}" ]] || fail "Binaire manquant: ${LOCAL_BIN_DIR}/${bin}"
    scp_to_node "${LOCAL_BIN_DIR}/${bin}" "$w" "/tmp/${bin}"
    ssh_node "$w" "sudo mv /tmp/${bin} ${BIN_DIR_REMOTE}/${bin} && sudo chmod +x ${BIN_DIR_REMOTE}/${bin}"
  done

  [[ -d "${LOCAL_BIN_DIR}/cni-plugins" ]] || fail "Plugins CNI manquants dans ${LOCAL_BIN_DIR}/cni-plugins"
  for plugin in bridge host-local loopback; do
    [[ -f "${LOCAL_BIN_DIR}/cni-plugins/${plugin}" ]] || fail "Plugin CNI manquant: ${plugin}"
    scp_to_node "${LOCAL_BIN_DIR}/cni-plugins/${plugin}" "$w" "/tmp/${plugin}"
    ssh_node "$w" "sudo mv /tmp/${plugin} /opt/cni/bin/${plugin} && sudo chmod +x /opt/cni/bin/${plugin}"
  done

  scp_to_node "${LOCAL_CFG_DIR}/containerd-config.toml" "$w" "/tmp/config.toml"
  scp_to_node "${LOCAL_CFG_DIR}/10-bridge.conf" "$w" "/tmp/10-bridge.conf"
  scp_to_node "${LOCAL_CFG_DIR}/99-loopback.conf" "$w" "/tmp/99-loopback.conf"
  ssh_node "$w" "sudo mv /tmp/config.toml /etc/containerd/config.toml && sudo mv /tmp/10-bridge.conf /etc/cni/net.d/10-bridge.conf && sudo mv /tmp/99-loopback.conf /etc/cni/net.d/99-loopback.conf"

  for unit in kubelet.service kube-proxy.service; do
    scp_to_node "${REPO_ROOT}/kubernetes/systemd/${unit}" "$w" "/tmp/${unit}"
    ssh_node "$w" "sudo mv /tmp/${unit} /etc/systemd/system/${unit}"
  done

  for cfg in kubelet-config.yaml kube-proxy-config.yaml; do
    scp_to_node "${LOCAL_CFG_DIR}/${cfg}" "$w" "/tmp/${cfg}"
    ssh_node "$w" "sudo mv /tmp/${cfg} /etc/kubernetes/config/${cfg}"
  done

  [[ -f "${LOCAL_KCFG_DIR}/${w}.kubeconfig" ]] || fail "Kubeconfig worker manquant"
  [[ -f "${LOCAL_KCFG_DIR}/kube-proxy.kubeconfig" ]] || fail "Kubeconfig kube-proxy manquant"
  scp_to_node "${LOCAL_KCFG_DIR}/${w}.kubeconfig" "$w" "/tmp/kubeconfig"
  scp_to_node "${LOCAL_KCFG_DIR}/kube-proxy.kubeconfig" "$w" "/tmp/kube-proxy.kubeconfig"
  ssh_node "$w" "sudo mv /tmp/kubeconfig /var/lib/kubelet/kubeconfig && sudo mv /tmp/kube-proxy.kubeconfig /var/lib/kube-proxy/kubeconfig"

  for crt in ca.pem ${w}.pem ${w}-key.pem; do
    scp_to_node "${LOCAL_PKI_DIR}/${crt}" "$w" "/tmp/${crt}"
    ssh_node "$w" "sudo mv /tmp/${crt} /etc/kubernetes/pki/${crt}"
  done

  ssh_node "$w" "sudo systemctl daemon-reload && sudo systemctl enable containerd kubelet kube-proxy && sudo systemctl restart containerd kubelet kube-proxy"
  ssh_node "$w" "sudo systemctl is-active containerd kubelet kube-proxy"
done

log "Workers configurés avec containerd + CNI bridge local"
