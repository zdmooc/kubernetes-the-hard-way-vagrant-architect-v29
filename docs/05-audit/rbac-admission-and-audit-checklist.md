# RBAC, Admission and Audit Checklist

## Identity
- Separate human and workload identities?
- Bastion access mapped to named operators?
- ServiceAccounts explicitly declared?

## Authorization
- Cluster-admin limited to a small set of operators?
- Read-only audit role available?
- Namespace-scoped roles used where possible?
- Wildcard permissions reviewed?

## Admission
- Pod Security Admission labels applied?
- Privileged workloads intentionally isolated?
- Validation policies tested with failure cases?

## Audit
- kube-apiserver audit policy configured?
- audit log path documented?
- retention and collection process described?
- evidence samples stored for review?
