# Bastion hardening checklist

## Access
- Bastion is the documented SSH entry point.
- Password authentication is disabled.
- Root login is disabled.
- Access is key-based only.

## Network controls
- Inbound default deny is enforced on the bastion.
- Only SSH is exposed.
- Source CIDR is restricted when possible.

## Logging and traceability
- SSH logs are persistent.
- auditd is enabled.
- fail2ban is enabled or an equivalent brute-force protection exists.
- Evidence can be collected on demand.

## Operations
- Recovery path is documented.
- ProxyJump configuration is versioned.
- Bastion hardening baseline is reproducible.
