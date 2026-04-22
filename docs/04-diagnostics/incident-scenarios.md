# Incident Scenarios

## Scénario 1 — API indisponible
Symptômes : `kubectl` timeouts, `/readyz` KO.

Vérifier :
- load balancer ;
- certificats API ;
- service kube-apiserver ;
- etcd ;
- journaux système.

## Scénario 2 — Pod en Pending
Vérifier :
- requests trop élevées ;
- taints/tolerations ;
- CNI ;
- PVC en attente ;
- scheduler logs.

## Scénario 3 — DNS cassé
Vérifier :
- CoreDNS ;
- kube-system ;
- NetworkPolicy ;
- service kube-dns ;
- `/etc/resolv.conf` dans le Pod.
