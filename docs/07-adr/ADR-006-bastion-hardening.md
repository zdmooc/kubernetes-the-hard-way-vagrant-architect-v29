# ADR-006 — Harden the bastion as an access control boundary

## Context
V11 introduced a bastion to separate operator access from load balancing. The next step is to make that bastion meaningful from a security perspective.

## Decision
The bastion is hardened with:
- SSH keys only,
- no root login,
- nftables default deny inbound policy,
- persistent journald logs,
- auditd and fail2ban enabled.

## Consequences
Benefits:
- stronger administrative boundary,
- better auditability,
- more enterprise-like platform narrative.

Trade-offs:
- more bootstrap complexity,
- potential lockout risk if firewall and SSH settings are misapplied,
- need for explicit recovery guidance.
