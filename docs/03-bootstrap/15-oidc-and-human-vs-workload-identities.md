# OIDC and Human vs Workload Identities

## Purpose
This chapter adds an enterprise identity layer to the repository design. It does not aim to fully deploy Keycloak in V15, but it prepares the platform for OIDC-backed authentication and cleaner identity boundaries.

## Scope in V15
- prepare kube-apiserver OIDC flags as templates,
- provide RBAC examples for federated groups,
- separate human access examples from ServiceAccount access examples,
- document validation steps.

## Bootstrap intent
The objective is to move from:
- static local admin access,

to:
- federated human authentication,
- RBAC based on external groups,
- ServiceAccount-based workload access.

## Recommended sequence
1. Prepare OIDC issuer and client on the IdP side.
2. Configure kube-apiserver OIDC parameters.
3. Create ClusterRoleBindings and RoleBindings mapped to external groups.
4. Validate human login.
5. Validate ServiceAccount access boundaries.
6. Confirm audit logs differentiate both identity classes.

## Validation goals
- a human identity can authenticate through OIDC,
- the human receives only the expected RBAC rights,
- a workload ServiceAccount cannot exceed its namespace scope,
- API audit logs show distinct usernames/groups for both paths.
