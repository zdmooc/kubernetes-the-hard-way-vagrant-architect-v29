# Access logging baseline

## Goal
Define the minimum evidence expected around bastion-mediated administration.

## Evidence to retain
- SSH daemon journal entries
- nftables ruleset snapshot
- fail2ban status
- auditd status
- listening sockets inventory

## Collection
Use `scripts/15-collect-access-logs.sh` after hardening or before an audit review.

## Interpretation
The baseline is acceptable when:
- only expected ports listen,
- SSH events are retained,
- brute-force protection is active,
- bastion firewall intent is explicit and reproducible.
