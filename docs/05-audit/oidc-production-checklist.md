# OIDC Production Checklist

## Identity provider
- highly available provider?
- TLS enabled and trusted?
- realm export under source control?
- backup and restore defined?

## kube-apiserver
- issuer URL correct?
- client ID correct?
- CA file lifecycle managed?
- username and group claims explicit?
- prefixes used to avoid collisions?

## RBAC
- groups mapped to least privilege roles?
- platform-admin binding tightly controlled?
- break-glass path documented?

## Workstation / operator flow
- supported `kubectl oidc-login` version?
- no shared local browser sessions for admin users?
- kubeconfig templates versioned?

## Auditability
- audit logs capture OIDC-authenticated usernames?
- identity provider logs retained?
- correlation between IdP and API requests possible?
