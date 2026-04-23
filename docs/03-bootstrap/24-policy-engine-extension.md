# Bootstrap Kyverno (V39)

Ce document décrit l'installation et la configuration de Kyverno sur le cluster.

## Prérequis
- Cluster Kubernetes opérationnel (V29+)
- `kubectl` configuré

## Installation
Exécutez le script `scripts/53-bootstrap-policy-engine.sh` qui installe Kyverno et applique les politiques baseline de `policy/policies/`.

## Vérification
Vérifiez que les ClusterPolicies sont actives : `kubectl get clusterpolicies`. Testez le blocage en déployant un pod avec l'image `nginx:latest` (doit être bloqué).

## Gestion des Exceptions
Pour créer une exception : `kubectl apply -f policy/exceptions/<nom>.yaml`.
