# etcd Backup / Restore Runbook

## Backup
```bash
bash scripts/27-backup-etcd.sh
```

## Restore drill
```bash
bash scripts/28-restore-etcd.sh /path/to/snapshot.db
```

## Validation after restore
- etcd endpoint health
- member list
- kube-apiserver health
- kubectl get nodes
- kubectl get pods -A

## Risks
- restoring to the wrong controller
- restoring with wrong certificates
- stale manifests or mismatched member names
