# Matrice d’audit par composant

| Composant | À comprendre | À valider | À auditer | Risque fréquent |
|---|---|---|---|---|
| kube-apiserver | point d’entrée central | `/readyz`, endpoint LB | HA, certifs, authn/authz | indisponibilité API |
| etcd | source de vérité | endpoint health | backup, restore, chiffrement | perte de quorum |
| kube-scheduler | placement | Pods Pending | requests, affinity, topology | saturation / mauvais placement |
| controller-manager | réconciliation | Deployments / Nodes | leader election, stabilité | drift non corrigé |
| kubelet | agent node | nœud Ready | durcissement, pressure, versions | évictions / node NotReady |
| kube-proxy | dataplane Service | endpoints / traffic | mode, scaling, source IP | service cassé |
| CoreDNS | résolution DNS | nslookup | HA, latence, policies | app non joignable |
| CNI | réseau Pod | Pod-to-Pod | features, policy support | flux brisés |
| CSI | stockage | PV/PVC bind | snapshots, reclaim, PRA | perte de données |
