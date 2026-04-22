# Lab 19 — Bastion hardening and access evidence

## Goal
Harden the bastion and prove that administration now flows through a controlled and auditable boundary.

## Tasks
1. Generate the SSH config with `ProxyJump`.
2. Apply bastion hardening.
3. Validate access to `controller-0` through the bastion.
4. Verify `nftables`, `auditd` and `fail2ban` on `bastion-0`.
5. Collect evidence and store it under `evidence/access/`.

## Expected outcome
You should be able to explain not only how access works, but why the bastion is now part of the security architecture rather than a simple convenience host.
