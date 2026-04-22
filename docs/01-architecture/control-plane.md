# Control Plane

## Définition
Le control plane est le cœur décisionnel de Kubernetes.

## Composants
- kube-apiserver
- etcd
- kube-scheduler
- kube-controller-manager

## kube-apiserver
Point d’entrée central.

Fonctions :
- validation,
- authentication,
- authorization,
- admission,
- persistance dans etcd,
- publication des objets et watches.

## etcd
Base clé/valeur distribuée, source de vérité.

Points critiques :
- quorum,
- sauvegardes,
- restauration,
- latence,
- certificats,
- chiffrement des secrets.

## kube-scheduler
Décide sur quel nœud placer les Pods.

Il prend en compte :
- requests/limits,
- taints/tolerations,
- affinity/anti-affinity,
- topology spread,
- état des nœuds.

## kube-controller-manager
Exécute les boucles de réconciliation.

Exemples :
- Deployment controller,
- ReplicaSet controller,
- Node controller,
- Job controller,
- Namespace controller.

## Symptômes typiques
- API inaccessible,
- Pods bloqués en `Pending`,
- objets qui ne convergent pas,
- erreurs leader election,
- etcd unhealthy.
