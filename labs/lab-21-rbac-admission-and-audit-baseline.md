# Lab 21 — RBAC, Admission and Audit

## Goal
Understand how Kubernetes controls who can do what, which workloads are allowed, and how actions are traced.

## Exercises
1. Apply namespaces and Pod Security labels.
2. Create a read-only auditor binding.
3. Test `kubectl auth can-i` with allowed and denied actions.
4. Apply the sample ValidatingAdmissionPolicy.
5. Try to create a violating workload and observe the denial.
6. Locate audit log output on a controller node.

## Expected outcome
You should be able to explain:
- authentication vs authorization vs admission,
- why ServiceAccounts must be governed,
- how audit logging supports investigations and compliance.
