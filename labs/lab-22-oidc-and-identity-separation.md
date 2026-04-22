# Lab 21 — OIDC and Identity Separation

## Goal
Understand how to separate:
- human platform access,
- workload access,
- break-glass administration.

## Expected outcome
By the end of the lab, you should be able to explain:
1. why humans should not share a kubeconfig,
2. why workloads should use ServiceAccounts,
3. how OIDC maps external groups to RBAC,
4. how audit logs differentiate callers,
5. what a least-privilege design looks like.

## Exercises
- Review the OIDC template for kube-apiserver.
- Review RBAC bindings for human-readonly and platform-auditors.
- Review ServiceAccount examples for CI deployment.
- Simulate permission checks with `kubectl auth can-i`.

## Architect angle
A mature platform does not only secure network flows. It secures identity flows.
