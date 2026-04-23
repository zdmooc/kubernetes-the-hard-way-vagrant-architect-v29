# Release Notes V39 - Policy Engine Extension

**Date :** 2026-04-23 | **Statut :** Stable

La V39 introduit Kyverno comme moteur de politique. Quatre politiques baseline sont déployées dans `policy/policies/`. Le script `53-bootstrap-policy-engine.sh` automatise le déploiement. L'ADR-017 documente la décision.

## Nouveautés

- **Kyverno Policy Engine** : Installation de Kyverno en tant que webhook d'admission.
- **Politique `require-labels`** : Force la présence du label `app.kubernetes.io/name` sur tous les pods (Mode Enforce).
- **Politique `require-requests-limits`** : Exige des limites et requêtes CPU/Mémoire pour chaque conteneur (Mode Enforce).
- **Politique `disallow-latest-tag`** : Interdit l'utilisation du tag `latest` pour les images Docker (Mode Enforce).
- **Politique `require-run-as-non-root`** : Empêche l'exécution de conteneurs en tant que root (Mode Enforce).
- **Modèle Opérationnel** : Documentation des processus de gestion des exceptions et de l'audit des rapports de politiques (`docs/08-operations/policy-operating-model.md`).

## Validation

Un script de validation dédié `scripts/54-validate-policy-assets.sh` permet de vérifier que le moteur est actif et que les politiques sont bien appliquées sur le cluster.
