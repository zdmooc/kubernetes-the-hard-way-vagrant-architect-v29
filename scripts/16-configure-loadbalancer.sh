#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib.sh"

LB="lb-0"
CFG_LOCAL="${REPO_ROOT}/kubernetes/configs/haproxy.cfg"

log "Configuration du load balancer ${LB}"
ssh_node "$LB" "sudo apt-get update && sudo apt-get install -y haproxy"
scp_to_node "$CFG_LOCAL" "$LB" "/tmp/haproxy.cfg"
ssh_node "$LB" "sudo mv /tmp/haproxy.cfg /etc/haproxy/haproxy.cfg && sudo systemctl enable haproxy && sudo systemctl restart haproxy && sudo systemctl is-active haproxy"
log "haproxy actif sur ${LB}"
