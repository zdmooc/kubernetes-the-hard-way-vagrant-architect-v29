#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/lib.sh"

banner "Deploying Keycloak on keycloak-0"

cat <<'MSG'
This script assumes:
- Vagrant VM keycloak-0 exists and is reachable from bastion-0 or the host.
- Podman or Docker will be installed on keycloak-0.
- TLS files are available under kubernetes/configs/keycloak/tls/.
- Realm import file is available under kubernetes/configs/keycloak/realm-export.json.

Recommended sequence on keycloak-0:
  sudo apt-get update
  sudo apt-get install -y podman openssl
  sudo mkdir -p /opt/kthw-identity
  sudo cp -r /vagrant/../kubernetes /opt/kthw-identity/
  cd /opt/kthw-identity/manifests/identity
  sudo podman compose -f keycloak-compose.yaml up -d

Validation:
  curl -k https://192.168.56.14:8443/realms/kubernetes/.well-known/openid-configuration | jq .
  curl -k https://192.168.56.14:8443/realms/kubernetes/protocol/openid-connect/certs | jq .

Users:
  alice / ChangeMe!123
  bob   / ChangeMe!123
  carol / ChangeMe!123
MSG

mkdir -p "$ROOT_DIR/evidence/identity"
cp "$ROOT_DIR/kubernetes/configs/keycloak/realm-export.json" "$ROOT_DIR/evidence/identity/realm-export.captured.json"
