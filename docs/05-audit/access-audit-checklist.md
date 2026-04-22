# Access Audit Checklist

## Administrative Access

- Is there a defined administrative entry point?
- Is node access separated from API access?
- Are direct node exposures minimized?
- Are SSH keys scoped and rotated?
- Is ProxyJump or an equivalent pattern documented?

## Bastion Hardening

- Is the bastion role explicit?
- Are unnecessary services disabled?
- Are operator actions auditable?
- Is the bastion monitored?
- Is file transfer usage controlled?

## Architecture

- Does the load balancer only solve API exposure?
- Is the bastion clearly identified as an operator gateway?
- Is the topology understandable for an auditor in under five minutes?
