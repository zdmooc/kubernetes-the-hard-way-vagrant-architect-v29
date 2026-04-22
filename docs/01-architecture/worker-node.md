# Worker Node

## Rôle
Le worker node est le lieu où les workloads deviennent des processus réels.

## Composants
- kubelet
- container runtime
- kube-proxy
- Pods

## kubelet
Fonctions :
- enregistrement du nœud,
- surveillance des PodSpecs,
- démarrage des conteneurs,
- gestion des probes,
- remontée de status.

## Runtime
Choix retenu ici : `containerd`.

## kube-proxy
Met en place les règles permettant aux Services d’atteindre les Pods.

## Risques principaux
- pression mémoire/disque,
- evictions,
- kubelet mal configuré,
- runtime incohérent,
- problèmes CNI.
