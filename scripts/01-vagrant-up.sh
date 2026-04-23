#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=scripts/lib.sh
source "$(dirname "$0")/lib.sh"

log "Démarrage des VM Vagrant"
cd "${VAGRANT_DIR}"
vagrant up

log "Vérification rapide des hôtes"
for h in $(inventory_hosts); do
  printf '\n### %s ###\n' "$h"
  vagrant ssh "$h" -c "hostname && ip -4 a | grep inet | sed -n '1,6p'" || true
done
