#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "$ROOT_DIR/scripts/lib.sh"
OUT_DIR="$ROOT_DIR/evidence/access"
mkdir -p "$OUT_DIR"
TARGET="${1:-bastion-0}"

log "Collecting bastion access evidence from ${TARGET}"
ssh_to "$TARGET" "sudo journalctl -u ssh --no-pager -n 200" > "$OUT_DIR/ssh-journal.txt" || true
ssh_to "$TARGET" "sudo nft list ruleset" > "$OUT_DIR/nftables-ruleset.txt" || true
ssh_to "$TARGET" "sudo fail2ban-client status" > "$OUT_DIR/fail2ban-status.txt" || true
ssh_to "$TARGET" "sudo auditctl -s" > "$OUT_DIR/audit-status.txt" || true
ssh_to "$TARGET" "sudo ss -tulpn" > "$OUT_DIR/listening-sockets.txt" || true

cat > "$OUT_DIR/README.md" <<'DOC'
# Bastion access evidence

This folder contains SSH, nftables, auditd and fail2ban evidence collected from bastion-0.
Use it during reviews to demonstrate that access controls, listening ports and logging baselines are active.
DOC

log "Access evidence collected into ${OUT_DIR}"
