# Bastion hardening

## Goal
Move from a simple bastion presence to a bastion security baseline.

## Minimum baseline
- SSH key authentication only
- no root login
- persistent journald logs
- nftables policy with default deny on inbound traffic
- fail2ban enabled
- auditd enabled

## Execution sequence
1. Generate the SSH config and validate `ProxyJump`.
2. Apply `scripts/14-harden-bastion.sh`.
3. Validate `sshd -t`, `nft list ruleset`, `systemctl status auditd fail2ban`.
4. Collect evidence with `scripts/15-collect-access-logs.sh`.

## Why it matters
A bastion without hardening is only a relay. A bastion with hardening becomes a controlled administrative boundary.
