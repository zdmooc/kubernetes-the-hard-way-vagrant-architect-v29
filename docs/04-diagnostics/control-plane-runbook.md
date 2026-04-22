# Runbook — Control plane

## Démarche
1. Vérifier l’endpoint API.
2. Vérifier les unités systemd.
3. Vérifier les certificats.
4. Vérifier etcd.
5. Vérifier scheduler / controller-manager.
6. Corréler avec les logs.

## Commandes
```bash
kubectl get componentstatuses || true
systemctl status kube-apiserver
systemctl status kube-scheduler
systemctl status kube-controller-manager
ETCDCTL_API=3 etcdctl endpoint health --cluster
journalctl -u kube-apiserver -n 200 --no-pager
```
