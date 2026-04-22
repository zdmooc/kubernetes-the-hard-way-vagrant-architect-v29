# Runbook de diagnostic composant par composant

## kube-apiserver
### Questions
- l’API est-elle joignable ?
- le certificat est-il valide ?
- etcd répond-il ?
- l’API est-elle saturée ?

### Commandes
```bash
kubectl get --raw=/readyz?verbose
kubectl get --raw=/livez?verbose
kubectl cluster-info
```

## etcd
### Questions
- quorum intact ?
- latence ?
- corruption ?
- backup testé ?

### Commandes
```bash
sudo ETCDCTL_API=3 etcdctl endpoint health
sudo ETCDCTL_API=3 etcdctl member list
```

## kube-scheduler
### Questions
- Pod Pending pour quelles raisons ?
- requests/limits cohérents ?
- taints/tolerations ou affinity bloquants ?

### Commandes
```bash
kubectl get pods -A --field-selector=status.phase=Pending
kubectl describe pod <pod>
```

## kube-controller-manager
### Questions
- boucle de réconciliation active ?
- ReplicaSets / Deployments cohérents ?
- Nodes correctement suivis ?

## kubelet
### Questions
- le nœud remonte-t-il son état ?
- les probes cassent-elles le workload ?
- y a-t-il MemoryPressure / DiskPressure ?

### Commandes
```bash
kubectl describe node <node>
kubectl top node
```

## kube-proxy
### Questions
- les Services ont-ils des endpoints ?
- le trafic est-il correctement distribué ?
- la source IP attendue est-elle conservée ?

### Commandes
```bash
kubectl get svc,endpoints,endpointslices -A
```

## CoreDNS
### Questions
- les noms de service se résolvent-ils ?
- une NetworkPolicy bloque-t-elle le port 53 ?

### Commandes
```bash
kubectl exec -it <pod> -- nslookup kubernetes.default
kubectl -n kube-system logs deployment/coredns
```
