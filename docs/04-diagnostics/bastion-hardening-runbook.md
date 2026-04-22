# Bastion hardening runbook

## Symptoms
- SSH connection refused or intermittent
- `ProxyJump` works inconsistently
- unauthorized retries not visible in logs
- bastion exposes more ports than expected

## Checks
```bash
ssh -F ./evidence/ssh/ssh_config.generated controller-0 hostname
sudo systemctl status ssh nftables auditd fail2ban
sudo nft list ruleset
sudo ss -tulpn
sudo journalctl -u ssh --since today
```

## Expected state
- inbound default policy = drop
- only port 22 open on bastion
- persistent SSH logs available
- root login disabled
- password authentication disabled

## Recovery
1. Validate `/etc/ssh/sshd_config` syntax with `sshd -t`.
2. Temporarily rollback nftables if the bastion is locked out.
3. Re-enable journald persistence and restart services.
4. Re-collect evidence and archive it.
