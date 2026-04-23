# ADR-014 : Intégration de SonarQube pour les Quality Gates

**Date :** 2026-04-23 | **Statut :** Accepté

## Contexte
Le code d'infrastructure (Shell, Ansible, YAML) peut contenir des bugs, des vulnérabilités et de la dette technique. Sans analyse statique, ces problèmes ne sont détectés qu'en production.

## Décision
Intégration de SonarQube Community Edition dans le pipeline GitLab CI (stage `quality`). La Quality Gate bloque les fusions si le Security Rating descend en dessous de A.

## Conséquences
Les développeurs doivent corriger les problèmes signalés avant de fusionner. Cela augmente la qualité globale du code d'infrastructure.
