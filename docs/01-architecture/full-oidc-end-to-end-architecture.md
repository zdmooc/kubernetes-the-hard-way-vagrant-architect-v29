# Full OIDC End-to-End Architecture

## Purpose
This document describes the complete identity flow for human access to the Kubernetes API using Keycloak as the OpenID Connect provider.

## Components
- `keycloak-0`: identity provider node
- `kube-apiserver`: validates ID tokens against the issuer
- federated RBAC bindings: authorize groups coming from OIDC claims
- `kubectl` + `oidc-login`: obtains a token and calls the Kubernetes API through the load balancer

## End-to-end flow
1. The user starts the OIDC login flow from `kubectl oidc-login`.
2. Keycloak authenticates the user and issues tokens for client `kubernetes`.
3. The ID token contains `preferred_username` and `groups` claims.
4. `kubectl` presents the token to the Kubernetes API.
5. `kube-apiserver` validates the issuer, client ID, CA, signature and claims.
6. RBAC evaluates group membership such as `oidc:dev`, `oidc:ops`, `oidc:platform-admins`.
7. The API allows or denies the action.

## Security boundaries
- Human identities come only from OIDC.
- Workload identities come only from ServiceAccounts.
- The API server remains the single authorization point.

## What this lab makes visible
- identity federation,
- externalized authentication,
- group-based authorization,
- the difference between authentication and authorization,
- operational dependencies between API availability and identity availability.
