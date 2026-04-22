# Release Notes V18

## Objectif
Rendre le dépôt V17 plus exécutable en local avec Vagrant.

## Ajouts principaux
- script réel de téléchargement des binaires ;
- génération des kubeconfigs via `kubectl config` ;
- configuration `haproxy` pour l’API Server ;
- configuration `containerd` et CNI bridge ;
- script `26-build-platform.sh` pour enchaîner le build ;
- documentation V18 dédiée.

## Limite connue
Le CNI utilisé dans la V18 est un **bridge local pédagogique** et non un plugin de production multi-nœuds complet comme Calico ou Cilium.
