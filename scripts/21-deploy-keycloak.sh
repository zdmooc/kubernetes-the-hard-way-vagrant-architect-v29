#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/lib.sh"

banner "Keycloak OIDC extension — LEGACY_REFERENCE"

cat <<'MSG'
This extension is retained only to explain Kubernetes OIDC integration.
Canonical Keycloak/IAM ownership belongs to:
  zdmooc/keycloak-enterprise-roadmap-v7

Before a local replay:
- provide TLS files locally under kubernetes/configs/keycloak/tls/;
- export KC_BOOTSTRAP_ADMIN_USERNAME;
- export KC_BOOTSTRAP_ADMIN_PASSWORD;
- create any demo-user credentials at runtime through Keycloak;
- never store or print those values in Git evidence.

No current Keycloak runtime proof is claimed by this repository.
MSG
