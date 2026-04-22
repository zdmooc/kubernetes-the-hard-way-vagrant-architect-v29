# Release Notes V32

La V32 ajoute AWX comme couche d'orchestration d'entreprise au-dessus d'Ansible.

## Nouveautés

- **AWX** : Ajout d'une structure pour la configuration d'AWX (Job Templates, Workflow Templates, Inventories).
- **Scripts** : Scripts d'amorçage (`40-bootstrap-awx.sh`) et de validation (`41-validate-awx-assets.sh`).
- **Documentation** : Modèle opérationnel AWX, Checklist de gouvernance et ADR 011.
- **Lab** : Lab 31 pour la prise en main d'AWX.

## Bénéfices

- Interface graphique pour l'exécution des playbooks Ansible.
- Gestion centralisée des identifiants et des exécutions.
- Orchestration des tâches d'exploitation (Day 2).
