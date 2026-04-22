# Final Component Matrix

| Composant | Rôle | Validation | Panne typique | Angle audit |
|---|---|---|---|---|
| kube-apiserver | entrée API | `/readyz` | timeout / certs | HA, authn/z |
| etcd | source de vérité | endpoint health | quorum perdu | backup / restore |
| scheduler | placement | Pods schedulés | Pods Pending | requests, affinities |
| controller-manager | réconciliation | contrôleurs actifs | drift non corrigé | robustesse loops |
| kubelet | agent nœud | node Ready | crashloop / NotReady | durcissement |
| kube-proxy | service dataplane | service reachable | service noir | mode iptables/IPVS |
| CoreDNS | résolution | nslookup OK | DNS KO | résilience DNS |
| CNI | réseau Pod | Pod to Pod OK | no route | policy, chiffrement |
