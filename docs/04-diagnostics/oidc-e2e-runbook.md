# OIDC End-to-End Runbook

## Symptoms
- browser login succeeds but API access fails,
- `kubectl oidc-login` loops or times out,
- `invalid bearer token` in kube-apiserver logs,
- `You must be logged in to the server` from kubectl,
- groups are missing from RBAC decisions.

## Quick checks
1. Confirm Keycloak is reachable:
   `curl -k https://192.168.56.14:8443/realms/kubernetes/.well-known/openid-configuration`
2. Confirm JWKS endpoint:
   `curl -k https://192.168.56.14:8443/realms/kubernetes/protocol/openid-connect/certs`
3. Confirm kube-apiserver OIDC flags:
   `systemctl cat kube-apiserver | grep oidc`
4. Confirm CA file presence:
   `ls -l /etc/kubernetes/pki/oidc-ca.crt`
5. Decode the token and inspect claims:
   `jq -R 'split(".") | .[1] | @base64d | fromjson' <<<"$ID_TOKEN"`

## Common causes
- issuer URL mismatch,
- wrong client ID,
- API server cannot trust Keycloak CA,
- missing `groups` claim,
- wrong RBAC prefixes,
- clock skew between nodes.

## Evidence to collect
- discovery document,
- APIServer drop-in,
- audit log sample,
- output of `kubectl auth whoami`,
- output of `kubectl auth can-i`.
