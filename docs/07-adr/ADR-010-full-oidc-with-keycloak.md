# ADR-010 — Full OIDC with Keycloak

## Status
Accepted

## Context
The repository already separated human and workload identities but did not yet provide a working identity provider and end-to-end login path.

## Decision
Add a dedicated `keycloak-0` node and full OIDC integration assets:
- Keycloak realm import,
- kube-apiserver OIDC configuration,
- federated RBAC group bindings,
- kubectl OIDC kubeconfig example,
- validation and troubleshooting runbooks.

## Consequences
### Positive
- realistic platform identity model,
- stronger mission/client credibility,
- demonstrable authentication and authorization flow.

### Negative
- more moving parts,
- TLS and certificate handling complexity,
- dependency on operator workstation plugin.
