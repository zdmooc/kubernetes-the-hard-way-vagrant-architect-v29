#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"
REPORT_DIR="${REPO_ROOT}/evidence/reports"
ensure_dir "$REPORT_DIR"
REPORT_FILE="${REPORT_DIR}/execution-summary.md"

cat > "$REPORT_FILE" <<EOF
# Execution Summary

Generated: $(date -Iseconds)

## Expected attachments
- vagrant-status.txt
- nodes.txt
- pods-all.txt
- readyz.txt
- etcd-endpoint-health.txt

## Commentaire
Ce rapport est volontairement simple. Il sert de base pour une industrialisation CI/CD ou portfolio.
EOF

log "Rapport généré: $REPORT_FILE"
