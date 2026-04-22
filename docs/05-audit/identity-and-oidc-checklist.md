# Identity and OIDC Checklist

## Human identities
- External IdP selected and documented?
- MFA and identity lifecycle handled outside Kubernetes?
- Shared admin credentials prohibited?
- External groups mapped to explicit RBAC roles?

## Workload identities
- Dedicated ServiceAccounts used for sensitive workloads?
- `automountServiceAccountToken` disabled by default when not needed?
- Namespace scoping respected?
- Cluster-wide rights avoided for workloads?

## Federation quality
- OIDC issuer/client documented?
- Username and groups claims stable?
- API server trust chain controlled?
- Break-glass local admin access clearly governed?

## Auditability
- Audit logs distinguish humans vs ServiceAccounts?
- Forbidden events monitored?
- Role bindings periodically reviewed?
