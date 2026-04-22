#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/lib.sh"

banner "Configuring kube-apiserver OIDC integration"

require_file "$ROOT_DIR/kubernetes/configs/apiserver-oidc.env"
require_file "$ROOT_DIR/kubernetes/systemd/kube-apiserver.service.d/10-oidc.conf"

cat <<'MSG'
Controller actions to perform on each control-plane node:
  sudo mkdir -p /etc/kubernetes /etc/systemd/system/kube-apiserver.service.d
  sudo cp /vagrant/../kubernetes/configs/apiserver-oidc.env /etc/kubernetes/apiserver-oidc.env
  sudo cp /vagrant/../kubernetes/systemd/kube-apiserver.service.d/10-oidc.conf /etc/systemd/system/kube-apiserver.service.d/10-oidc.conf
  sudo cp /vagrant/../kubernetes/configs/keycloak/tls/server.crt /etc/kubernetes/pki/oidc-ca.crt
  sudo systemctl daemon-reload
  sudo systemctl restart kube-apiserver
  sudo systemctl status kube-apiserver --no-pager

Post-checks:
  kubectl get --raw /.well-known/openid-configuration || true
  sudo journalctl -u kube-apiserver -n 100 --no-pager | grep -i oidc || true
MSG
