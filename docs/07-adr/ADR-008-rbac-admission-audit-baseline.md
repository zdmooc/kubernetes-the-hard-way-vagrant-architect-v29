# ADR-008 — RBAC, Admission and Audit Baseline

## Status
Accepted

## Context
The repository already demonstrates cluster construction, bastion access and hardening. It now needs a stronger governance layer to reflect enterprise expectations around authorization, policy enforcement and traceability.

## Decision
Adopt a V14 baseline composed of:
- least-privilege RBAC examples,
- Pod Security Admission labels,
- sample ValidatingAdmissionPolicy with CEL,
- kube-apiserver audit policy file,
- ServiceAccount usage patterns.

## Consequences
### Positive
- stronger enterprise credibility,
- better audit posture,
- clearer distinction between access, authorization and policy.

### Trade-offs
- more moving parts to explain,
- policy examples remain educational rather than exhaustive.
