# Modèle Opérationnel AWX

AWX centralise l'exécution des tâches d'exploitation (Day 2) sur la plateforme Kubernetes.

## Job Templates

Les Job Templates encapsulent les playbooks Ansible avec des paramètres prédéfinis :
- `build-platform.yml` : Re-déploiement de la plateforme ou d'une partie.
- `day2-operations.yml` : Exécution des mises à jour, gestion des logs.
- `validate-platform.yml` : Validation périodique de l'état du cluster.

## Workflow Templates

Les Workflow Templates permettent d'enchaîner des Job Templates :
- `platform-lifecycle.yml` : Cycle de vie complet, du déploiement à la validation.
- `full-day2.yml` : Opérations complètes d'exploitation avec rapport d'audit.

## Credentials

Les identifiants SSH pour l'accès aux nœuds Vagrant sont stockés de manière sécurisée dans AWX, permettant une délégation sans partage de clés privées.
