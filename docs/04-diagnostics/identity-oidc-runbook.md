# Identity and OIDC Runbook

## Symptoms
- user cannot authenticate,
- user authenticates but has no permissions,
- wrong groups seen by the API server,
- ServiceAccount token works unexpectedly too broadly,
- audit logs do not clearly identify the caller.

## Checks

### 1. kube-apiserver flags
Verify OIDC parameters are present and consistent:
- `--oidc-issuer-url`
- `--oidc-client-id`
- `--oidc-username-claim`
- `--oidc-groups-claim`
- CA bundle if required

### 2. RBAC bindings
Check bindings referencing external groups:
```bash
kubectl get clusterrolebindings,rolebindings -A
kubectl describe clusterrolebinding <name>
```

### 3. Effective rights
```bash
kubectl auth can-i get pods --as=<user>
kubectl auth can-i list secrets --as=<user>
```

### 4. ServiceAccount boundaries
```bash
kubectl get sa -A
kubectl describe sa <name> -n <ns>
```

### 5. Audit trail
Search audit events for:
- human username,
- group claims,
- ServiceAccount subject,
- forbidden operations.

## Root cause patterns
- wrong issuer URL,
- wrong audience / client ID,
- groups claim not present in tokens,
- RBAC bound to wrong group name,
- default ServiceAccount used accidentally.
