# Intégration AWX

La V32 introduit AWX (la version open source d'Ansible Tower) comme troisième parcours pour la gestion de la plateforme Kubernetes.

## Objectif

Fournir une interface graphique centralisée, une gestion des accès basée sur les rôles (RBAC) et une planification des tâches pour l'exécution des playbooks Ansible.

## Architecture

AWX est déployé en tant que composant d'orchestration au-dessus de l'infrastructure Ansible existante. Il s'interface avec le dépôt Git pour récupérer les playbooks et avec l'inventaire Vagrant pour cibler les nœuds.

## Parcours

- **Shell** : Exécution manuelle et apprentissage (KTHW).
- **Ansible CLI** : Exécution en ligne de commande pour l'automatisation.
- **AWX** : Orchestration d'entreprise avec interface web, historique des exécutions et délégation des droits.

## Déploiement

Le déploiement d'AWX s'effectue via les scripts `40-bootstrap-awx.sh` et la validation via `41-validate-awx-assets.sh`.
