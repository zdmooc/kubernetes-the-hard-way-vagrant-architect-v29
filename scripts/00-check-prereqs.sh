#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"

for cmd in vagrant curl tar sha256sum kubectl openssl awk; do
  require_cmd "$cmd"
done

if ! vagrant plugin list | grep -q '^scp '; then
  log "Plugin vagrant-scp absent : installer avec 'vagrant plugin install vagrant-scp'"
fi

log "Pré-requis locaux validés"
