# ADR-009 — Identity Federation and Workload Separation

## Status
Accepted

## Context
By V14, the repository already includes RBAC, admission baseline and audit policy. However, the identity model still needs a more explicit separation between human users and workloads.

## Decision
The repository adopts the following direction:
- human users should move toward OIDC-backed federation,
- workloads should authenticate only via dedicated ServiceAccounts,
- RBAC should be bound to external groups for humans and to explicit ServiceAccounts for workloads,
- auditability should distinguish both identity classes clearly.

## Consequences
### Positive
- more realistic enterprise posture,
- cleaner access model,
- easier RBAC review,
- better audit interpretation.

### Trade-offs
- more moving parts,
- IdP dependency,
- extra documentation and troubleshooting complexity.
