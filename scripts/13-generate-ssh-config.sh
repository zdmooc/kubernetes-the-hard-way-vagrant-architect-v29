#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"

ensure_dir "${REPO_ROOT}/evidence/ssh"
out="${REPO_ROOT}/evidence/ssh/ssh_config.generated"

cat > "${out}" <<'CFG'
Host bastion-0
  HostName 127.0.0.1
  Port 2222
  User vagrant
  IdentityFile .vagrant/machines/bastion-0/virtualbox/private_key
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null

Host lb-0
  HostName 192.168.56.10
  User vagrant
  ProxyJump bastion-0
  IdentityFile .vagrant/machines/lb-0/virtualbox/private_key
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null

Host controller-0
  HostName 192.168.56.11
  User vagrant
  ProxyJump bastion-0
  IdentityFile .vagrant/machines/controller-0/virtualbox/private_key
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null

Host controller-1
  HostName 192.168.56.12
  User vagrant
  ProxyJump bastion-0
  IdentityFile .vagrant/machines/controller-1/virtualbox/private_key
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null

Host controller-2
  HostName 192.168.56.13
  User vagrant
  ProxyJump bastion-0
  IdentityFile .vagrant/machines/controller-2/virtualbox/private_key
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null

Host worker-0
  HostName 192.168.56.21
  User vagrant
  ProxyJump bastion-0
  IdentityFile .vagrant/machines/worker-0/virtualbox/private_key
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null

Host worker-1
  HostName 192.168.56.22
  User vagrant
  ProxyJump bastion-0
  IdentityFile .vagrant/machines/worker-1/virtualbox/private_key
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null
CFG

log "SSH config bastion généré: ${out}"
