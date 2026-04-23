#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=scripts/lib.sh
source "$(dirname "$0")/lib.sh"
# shellcheck source=scripts/versions.env
source "$(dirname "$0")/versions.env"

require_cmd curl
require_cmd tar
require_cmd sha256sum

OUT_DIR="${REPO_ROOT}/artifacts/bin"
TMP_DIR="${REPO_ROOT}/artifacts/tmp"
ensure_dir "$OUT_DIR"
ensure_dir "$TMP_DIR"

OS=linux
ARCH=amd64
K8S_BASE="https://dl.k8s.io/release/${KUBERNETES_VERSION}/bin/${OS}/${ARCH}"
ETCD_ARCHIVE="etcd-${ETCD_VERSION}-${OS}-${ARCH}.tar.gz"
ETCD_URL="https://github.com/etcd-io/etcd/releases/download/${ETCD_VERSION}/${ETCD_ARCHIVE}"
RUNC_URL="https://github.com/opencontainers/runc/releases/download/v${RUNC_VERSION}/runc.${ARCH}"
CNI_ARCHIVE="cni-plugins-${OS}-${ARCH}-${CNI_PLUGINS_VERSION}.tgz"
CNI_URL="https://github.com/containernetworking/plugins/releases/download/${CNI_PLUGINS_VERSION}/${CNI_ARCHIVE}"
CRICTL_VERSION="${RUNC_VERSION}"
CRICTL_ARCHIVE="crictl-${CRICTL_VERSION}-${OS}-${ARCH}.tar.gz"
CRICTL_URL="https://github.com/kubernetes-sigs/cri-tools/releases/download/v${CRICTL_VERSION}/${CRICTL_ARCHIVE}"

fetch() {
  local url="$1"
  local out="$2"
  log "Téléchargement $(basename "$out")"
  curl -fsSL "$url" -o "$out"
}

fetch_with_checksum() {
  local url="$1"
  local sha_url="$2"
  local out="$3"
  fetch "$url" "$out"
  curl -fsSL "$sha_url" -o "${out}.sha256"
  (cd "$(dirname "$out")" && echo "$(cat "${out}.sha256")  $(basename "$out")" | sha256sum -c -)
}

fetch_with_checksum "${K8S_BASE}/kubectl" "${K8S_BASE}/kubectl.sha256" "${OUT_DIR}/kubectl"
fetch_with_checksum "${K8S_BASE}/kube-apiserver" "${K8S_BASE}/kube-apiserver.sha256" "${OUT_DIR}/kube-apiserver"
fetch_with_checksum "${K8S_BASE}/kube-controller-manager" "${K8S_BASE}/kube-controller-manager.sha256" "${OUT_DIR}/kube-controller-manager"
fetch_with_checksum "${K8S_BASE}/kube-scheduler" "${K8S_BASE}/kube-scheduler.sha256" "${OUT_DIR}/kube-scheduler"
fetch_with_checksum "${K8S_BASE}/kubelet" "${K8S_BASE}/kubelet.sha256" "${OUT_DIR}/kubelet"
fetch_with_checksum "${K8S_BASE}/kube-proxy" "${K8S_BASE}/kube-proxy.sha256" "${OUT_DIR}/kube-proxy"

fetch "${ETCD_URL}" "${TMP_DIR}/${ETCD_ARCHIVE}"
tar -xzf "${TMP_DIR}/${ETCD_ARCHIVE}" -C "$TMP_DIR"
cp "${TMP_DIR}/etcd-${ETCD_VERSION}-${OS}-${ARCH}/etcd" "${OUT_DIR}/etcd"
cp "${TMP_DIR}/etcd-${ETCD_VERSION}-${OS}-${ARCH}/etcdctl" "${OUT_DIR}/etcdctl"

fetch "${RUNC_URL}" "${OUT_DIR}/runc"
chmod +x "${OUT_DIR}/runc"

fetch "${CNI_URL}" "${TMP_DIR}/${CNI_ARCHIVE}"
mkdir -p "${OUT_DIR}/cni-plugins"
tar -xzf "${TMP_DIR}/${CNI_ARCHIVE}" -C "${OUT_DIR}/cni-plugins"

fetch "${CRICTL_URL}" "${TMP_DIR}/${CRICTL_ARCHIVE}"
tar -xzf "${TMP_DIR}/${CRICTL_ARCHIVE}" -C "${OUT_DIR}"
chmod +x "${OUT_DIR}/crictl"

# containerd est fourni par paquet Debian dans la V18 pour simplifier le build local.
cat > "${OUT_DIR}/README.md" <<EOF
Téléchargements V18 réalisés :
- kubectl
- kube-apiserver
- kube-controller-manager
- kube-scheduler
- kubelet
- kube-proxy
- etcd / etcdctl
- runc
- CNI plugins

Décision V18 : containerd est installé via APT sur les workers pour réduire la complexité locale Vagrant.
EOF

chmod +x "${OUT_DIR}"/* || true
log "Binaires disponibles dans ${OUT_DIR}"
