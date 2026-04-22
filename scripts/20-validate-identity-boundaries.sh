#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/lib.sh"

banner "Validating identity boundaries"
mkdir -p "$ROOT_DIR/evidence/identity"
{
  echo "== Identity manifests =="
  find "$ROOT_DIR/kubernetes/manifests/identity" -maxdepth 1 -type f | sort
  echo
  echo "== Human RBAC manifests =="
  find "$ROOT_DIR/kubernetes/manifests/rbac" -maxdepth 1 -type f | sort | grep -E 'human|auditor|platform' || true
  echo
  echo "== OIDC config template =="
  sed -n '1,120p' "$ROOT_DIR/kubernetes/configs/apiserver-oidc.env.example"
} > "$ROOT_DIR/evidence/identity/identity-boundaries.txt"

echo "Identity evidence written to evidence/identity/identity-boundaries.txt"
