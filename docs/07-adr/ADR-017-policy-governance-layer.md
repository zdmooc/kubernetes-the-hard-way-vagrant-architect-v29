# ADR-017 : Adoption de Kyverno comme Policy Engine

**Date :** 2026-04-23 | **Statut :** Accepté

## Contexte
Sans politique de sécurité au niveau du cluster, les équipes peuvent déployer des workloads non conformes (images latest, pods root, pas de resource limits).

## Décision
Adoption de Kyverno comme moteur de politique. Les politiques baseline (labels, requests/limits, non-root, no-latest) sont appliquées en mode Enforce.

## Conséquences
Les déploiements non conformes sont bloqués à l'admission. Les équipes doivent adapter leurs manifests. Un processus d'exception est mis en place pour les cas légitimes.
