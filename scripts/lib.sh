#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VAGRANT_DIR="${REPO_ROOT}/vagrant"
INVENTORY_FILE="${VAGRANT_DIR}/inventory.ini"

log() {
  printf '
[%s] %s
' "$(date +'%H:%M:%S')" "$*"
}

fail() {
  echo "ERROR: $*" >&2
  exit 1
}

require_cmd() {
  local cmd="$1"
  command -v "$cmd" >/dev/null 2>&1 || fail "Commande introuvable: $cmd"
}

node_ip() {
  local node="$1"
  awk -v n="$node" '$1 == n { for (i=1;i<=NF;i++) if ($i ~ /^ansible_host=/) { split($i,a,"="); print a[2]; exit } }' "${INVENTORY_FILE}"
}

ssh_node() {
  local node="$1"
  shift
  (cd "${VAGRANT_DIR}" && vagrant ssh "$node" -c "$*")
}

scp_to_node() {
  local src="$1"
  local node="$2"
  local dest="$3"
  (cd "${VAGRANT_DIR}" && vagrant scp "$src" "${node}:${dest}")
}

controllers() {
  printf '%s
' controller-0 controller-1 controller-2
}

workers() {
  printf '%s
' worker-0 worker-1
}

ensure_dir() {
  mkdir -p "$1"
}

kubeconfig_path() {
  printf '%s
' "${REPO_ROOT}/kubernetes/kubeconfigs/generated/admin.kubeconfig"
}
