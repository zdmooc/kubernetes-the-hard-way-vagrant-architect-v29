# Validation Profiles

## Profile A — Fast syntax and structure
Checks:
- required folders exist
- required scripts exist
- markdown key files present
- YAML files parse structurally

## Profile B — Bootstrap readiness
Checks:
- versions.env present
- PKI folder populated
- kubeconfigs generated
- binaries downloaded
- HAProxy configuration rendered

## Profile C — Cluster health
Checks:
- API endpoint reachable
- nodes Ready
- CoreDNS healthy
- kube-system pods healthy
- smoke workload reachable

## Profile D — Identity and security
Checks:
- bastion reachable
- audit policy present
- RBAC manifests present
- Keycloak realm files present
- OIDC kubeconfig generated
