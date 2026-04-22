#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "$ROOT_DIR/scripts/lib.sh"
TARGET="${1:-bastion-0}"
TARGET_DIR="/tmp/kthw-bastion-hardening"

log "Preparing bastion hardening assets for ${TARGET}"
ssh_to "$TARGET" "sudo apt-get update && sudo apt-get install -y nftables rsyslog auditd fail2ban"
scp_to "$ROOT_DIR/scripts/templates/sshd_config.bastion" "$TARGET:$TARGET_DIR/sshd_config"
scp_to "$ROOT_DIR/scripts/templates/nftables-bastion.conf" "$TARGET:$TARGET_DIR/nftables.conf"
scp_to "$ROOT_DIR/scripts/templates/journald-bastion.conf" "$TARGET:$TARGET_DIR/journald.conf"

ssh_to "$TARGET" "sudo mkdir -p $TARGET_DIR && sudo cp $TARGET_DIR/sshd_config /etc/ssh/sshd_config && sudo cp $TARGET_DIR/nftables.conf /etc/nftables.conf && sudo mkdir -p /etc/systemd/journald.conf.d && sudo cp $TARGET_DIR/journald.conf /etc/systemd/journald.conf.d/kthw-bastion.conf && sudo systemctl enable nftables auditd fail2ban && sudo systemctl restart systemd-journald ssh nftables auditd fail2ban"

log "Bastion hardening applied on ${TARGET}"
