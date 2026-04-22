#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/lib.sh"

banner "Generating OIDC kubeconfig template"

mkdir -p "$ROOT_DIR/evidence/identity"
cp "$ROOT_DIR/kubernetes/kubeconfigs/oidc-user.kubeconfig.example" "$ROOT_DIR/evidence/identity/oidc-user.kubeconfig"

cat <<'MSG'
Next steps:
  1. Install kubelogin plugin:
       kubectl krew install oidc-login
  2. Copy the cluster CA certificate next to the kubeconfig as ca.pem
  3. Export KUBECONFIG to the generated file
  4. Run:
       kubectl oidc-login get-token          --oidc-issuer-url=https://192.168.56.14:8443/realms/kubernetes          --oidc-client-id=kubernetes          --oidc-extra-scope=groups          --oidc-extra-scope=profile          --oidc-extra-scope=email
MSG
