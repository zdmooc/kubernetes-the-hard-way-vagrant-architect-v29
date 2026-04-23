# Modèle Opérationnel Ansible

Ce document décrit comment Ansible est utilisé pour gérer la plateforme Kubernetes au quotidien (Day 2 operations).

## Principes

1. **Inventaire Dynamique / Statique** : Utilisation de l'inventaire Vagrant comme source de vérité.
2. **Idempotence** : Les playbooks doivent pouvoir être exécutés plusieurs fois sans modifier l'état si la cible est déjà conforme.
3. **Séparation des préoccupations** : Les rôles sont découpés par composant (bastion, loadbalancer, control plane, workers).

## Playbooks clés

- `build-platform.yml` : Déploiement initial.
- `validate-platform.yml` : Vérification de l'état de la plateforme.
- `day2-operations.yml` : Mises à jour OS, rotation de certificats, gestion des logs.

## Gestion des secrets

Les secrets (certificats, clés) doivent être gérés via Ansible Vault en environnement de production, bien que pour ce lab Vagrant, ils soient stockés en clair ou générés dynamiquement.
