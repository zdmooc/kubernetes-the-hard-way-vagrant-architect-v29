# ADR-016 : Adoption du pattern GitOps avec Argo CD

**Date :** 2026-04-23 | **Statut :** Accepté

## Contexte
La gestion manuelle des manifests Kubernetes (kubectl apply) est sujette aux erreurs et ne garantit pas la cohérence entre l'état Git et l'état du cluster.

## Décision
Adoption du pattern GitOps avec Argo CD. Tous les manifests Kubernetes sont gérés via Git. Argo CD assure la réconciliation continue entre Git et le cluster.

## Conséquences
Les modifications directes via kubectl sont proscrites. Le temps de déploiement augmente légèrement mais la fiabilité et l'auditabilité s'améliorent considérablement.
