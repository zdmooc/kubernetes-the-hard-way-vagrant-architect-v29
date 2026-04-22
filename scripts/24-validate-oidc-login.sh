#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/lib.sh"

banner "Validating end-to-end OIDC login and RBAC"

cat <<'MSG'
Expected validation sequence:
  # As alice (groups: dev, ops)
  kubectl auth whoami
  kubectl auth can-i get pods -A
  kubectl auth can-i create deployment -n smoke

  # As bob (groups: ops, auditors)
  kubectl auth whoami
  kubectl auth can-i get secrets -A
  kubectl auth can-i patch deployment -n smoke

  # As carol (groups: platform-admins, auditors)
  kubectl auth whoami
  kubectl auth can-i '*' '*' --all-namespaces

Expected outcomes:
  alice -> read + edit namespace-scoped workloads through view/edit bindings
  bob   -> edit-level rights where bound, read-only elsewhere
  carol -> cluster-admin via oidc:platform-admins
MSG
