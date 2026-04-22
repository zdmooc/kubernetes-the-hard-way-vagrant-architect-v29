#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/lib.sh"

banner "Preparing OIDC / Keycloak integration assets"
require_file "$ROOT_DIR/kubernetes/configs/apiserver-oidc.env.example"
mkdir -p "$ROOT_DIR/evidence/identity"
cp "$ROOT_DIR/kubernetes/configs/apiserver-oidc.env.example" "$ROOT_DIR/evidence/identity/apiserver-oidc.env.example.captured"
cat <<MSG
OIDC preparation assets are available.
Next manual steps:
- define issuer and client in Keycloak,
- copy CA bundle if required,
- inject OIDC flags into kube-apiserver unit or static pod manifest,
- apply RBAC manifests for external groups.
MSG
