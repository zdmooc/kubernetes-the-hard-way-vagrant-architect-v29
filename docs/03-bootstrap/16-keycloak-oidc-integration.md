# 16 — Keycloak OIDC Integration

## Goal
Deploy a dedicated Keycloak identity provider, configure the Kubernetes API server for OIDC, and validate human login end to end.

## Sequence
1. Boot the Vagrant topology including `keycloak-0`.
2. Install Podman or Docker on `keycloak-0`.
3. Place TLS certificate and key under `kubernetes/configs/keycloak/tls/`.
4. Start Keycloak with realm import.
5. Validate issuer metadata and JWKS endpoint.
6. Copy `apiserver-oidc.env` and OIDC CA to all controllers.
7. Install the kube-apiserver drop-in and restart the service.
8. Apply federated RBAC manifests.
9. Install `kubectl oidc-login` on the operator workstation.
10. Generate and test the OIDC kubeconfig.

## Validation checks
- discovery endpoint reachable,
- token obtained successfully,
- `kubectl auth whoami` returns an OIDC user,
- group-based RBAC decisions match expectations,
- audit logs show OIDC-authenticated subjects.
