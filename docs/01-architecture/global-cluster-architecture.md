# Global Cluster Architecture

## Vue d’ensemble

Le cluster est structuré en quatre couches :
- accès client,
- control plane,
- workers,
- services de plateforme.

## Couches

### 1. Client / API access
Les utilisateurs, `kubectl`, les pipelines et les outils d’automatisation parlent à un **endpoint API stable** placé derrière un load balancer.

### 2. Control plane
Le control plane contient :
- `kube-apiserver`,
- `etcd`,
- `kube-scheduler`,
- `kube-controller-manager`.

### 3. Worker layer
Les workers exécutent :
- `kubelet`,
- le runtime conteneur,
- `kube-proxy`,
- les Pods.

### 4. Platform services
Le cluster inclut ensuite des services transverses :
- `CoreDNS`,
- le plugin CNI,
- le stockage,
- l’ingress éventuel,
- l’observabilité.

## Flux clés

### API flow
Client → Load Balancer → kube-apiserver → etcd

### Scheduling flow
Manifest → API → Scheduler → Node → kubelet → runtime → conteneurs

### Reconciliation flow
Desired state → API → Controllers → actions correctives → status mis à jour

### Service networking flow
Pod client → Service → EndpointSlice / kube-proxy → Pod backend

## Ce qu’un architecte doit voir

- centralité de l’API,
- dépendance critique à etcd,
- séparation nette entre décision et exécution,
- importance du DNS et du réseau de service,
- nécessité d’une chaîne de diagnostic structurée.
