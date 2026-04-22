# Lab 22 — Full OIDC End to End

## Goal
Authenticate human users against Keycloak and authorize them in Kubernetes through federated RBAC.

## Tasks
1. Boot `keycloak-0`.
2. Deploy Keycloak with the provided realm.
3. Configure `kube-apiserver` OIDC flags.
4. Apply OIDC group RBAC manifests.
5. Install `kubectl oidc-login`.
6. Login as `alice`, `bob`, then `carol`.
7. Compare `kubectl auth can-i` results.

## Expected learning
- OIDC authentication path,
- token validation by the API server,
- group claim usage in RBAC,
- distinction between authentication and authorization.
