#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"

BIN_DIR_REMOTE="/usr/local/bin"
SYSTEMD_DIR="/etc/systemd/system"
CONFIG_DIR="/etc/etcd"
DATA_DIR="/var/lib/etcd"
LOCAL_BIN_DIR="${REPO_ROOT}/artifacts/bin"
LOCAL_PKI_DIR="${REPO_ROOT}/kubernetes/pki"

log "Bootstrap etcd sur les contrôleurs"
for c in $(controllers); do
  IP="$(node_ip "$c")"
  ssh_node "$c" "sudo mkdir -p ${CONFIG_DIR} ${DATA_DIR} /etc/kubernetes/pki ${BIN_DIR_REMOTE}"

  for b in etcd etcdctl; do
    [[ -f "${LOCAL_BIN_DIR}/${b}" ]] || fail "Binaire manquant: ${LOCAL_BIN_DIR}/${b}"
    scp_to_node "${LOCAL_BIN_DIR}/${b}" "$c" "/tmp/${b}"
    ssh_node "$c" "sudo mv /tmp/${b} ${BIN_DIR_REMOTE}/${b} && sudo chmod +x ${BIN_DIR_REMOTE}/${b}"
  done

  for crt in ca.pem kubernetes-key.pem kubernetes.pem; do
    [[ -f "${LOCAL_PKI_DIR}/${crt}" ]] || fail "Certificat manquant: ${LOCAL_PKI_DIR}/${crt}"
    scp_to_node "${LOCAL_PKI_DIR}/${crt}" "$c" "/tmp/${crt}"
    ssh_node "$c" "sudo mv /tmp/${crt} /etc/kubernetes/pki/${crt}"
  done

  scp_to_node "${REPO_ROOT}/kubernetes/systemd/etcd.service" "$c" "/tmp/etcd.service"
  ssh_node "$c" "sudo mv /tmp/etcd.service ${SYSTEMD_DIR}/etcd.service"

  cat > /tmp/${c}-etcd.env <<EOF
ETCD_NAME=${c}
ETCD_DATA_DIR=${DATA_DIR}
ETCD_INITIAL_CLUSTER=controller-0=https://192.168.56.11:2380,controller-1=https://192.168.56.12:2380,controller-2=https://192.168.56.13:2380
ETCD_INITIAL_CLUSTER_STATE=new
ETCD_INITIAL_CLUSTER_TOKEN=etcd-cluster-0
ETCD_LISTEN_PEER_URLS=https://${IP}:2380
ETCD_LISTEN_CLIENT_URLS=https://127.0.0.1:2379,https://${IP}:2379
ETCD_ADVERTISE_CLIENT_URLS=https://${IP}:2379
ETCD_INITIAL_ADVERTISE_PEER_URLS=https://${IP}:2380
EOF
  scp_to_node /tmp/${c}-etcd.env "$c" "/tmp/etcd.env"
  ssh_node "$c" "sudo mv /tmp/etcd.env /etc/etcd/etcd.env && sudo systemctl daemon-reload && sudo systemctl enable etcd && sudo systemctl restart etcd && sudo systemctl is-active etcd"
  rm -f /tmp/${c}-etcd.env

done

for c in $(controllers); do
  ssh_node "$c" "sudo ETCDCTL_API=3 /usr/local/bin/etcdctl     --cacert=/etc/kubernetes/pki/ca.pem     --cert=/etc/kubernetes/pki/kubernetes.pem     --key=/etc/kubernetes/pki/kubernetes-key.pem     --endpoints=https://127.0.0.1:2379 endpoint health"
done

log "etcd démarré et validé sur les contrôleurs"
