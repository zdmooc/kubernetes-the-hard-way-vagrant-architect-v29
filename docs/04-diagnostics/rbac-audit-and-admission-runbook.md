# RBAC, Audit and Admission Runbook

## Symptom 1 — user gets Forbidden
Check:
```bash
kubectl auth can-i <verb> <resource> --as=<subject> -n <namespace>
kubectl get role,rolebinding,clusterrole,clusterrolebinding -A
```

## Symptom 2 — ServiceAccount behaves differently than expected
Check:
```bash
kubectl get sa -A
kubectl describe sa <name> -n <namespace>
kubectl get pod <pod> -n <namespace> -o yaml | grep -n automountServiceAccountToken
```

## Symptom 3 — workload blocked by policy
Check:
```bash
kubectl get validatingadmissionpolicy,validatingadmissionpolicybinding
kubectl describe validatingadmissionpolicy <name>
kubectl get events -A --sort-by=.lastTimestamp | tail -n 50
```

## Symptom 4 — audit events missing
Check:
- audit policy file exists on controllers,
- kube-apiserver is started with `--audit-policy-file` and `--audit-log-path`,
- audit log directory exists and is writable.

## Architect angle
A mature platform can explain why an action was denied, which policy denied it, and where the audit evidence is stored.
