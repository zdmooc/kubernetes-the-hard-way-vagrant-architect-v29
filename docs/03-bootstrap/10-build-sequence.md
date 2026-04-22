# Séquence de build V5

## Vue synthétique

L’ordre retenu dans cette V5 est :

1. prérequis,
2. topologie Vagrant,
3. PKI,
4. etcd,
5. control plane,
6. workers,
7. addons,
8. smoke tests,
9. collecte de preuves.

## Pourquoi cet ordre

Cet ordre suit la logique réelle de Kubernetes :

- sans PKI fiable, le plan de contrôle n’est pas sain ;
- sans etcd, l’API Server n’a pas de source de vérité ;
- sans API Server, le scheduler et les contrôleurs ne servent à rien ;
- sans workers, les workloads ne peuvent pas tourner ;
- sans DNS, réseau et manifests de test, on ne valide pas réellement le cluster.

## Ce que l’on cherche à montrer

Cette séquence ne sert pas qu’à “avoir un cluster qui démarre”.
Elle sert à rendre visible :

- la centralité de l’API,
- le rôle d’etcd,
- la séparation control plane / data plane,
- la boucle de réconciliation,
- la chaîne de validation,
- la chaîne de diagnostic.
