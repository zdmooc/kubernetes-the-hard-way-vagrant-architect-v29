# Checklist de Gouvernance AWX et Ansible

Ce document détaille les points de contrôle pour l'audit de l'automatisation via AWX et Ansible.

## Sécurité des identifiants

- Les clés privées SSH sont-elles stockées de manière sécurisée dans AWX (Credentials) ?
- Les accès aux Job Templates sont-ils restreints via le RBAC d'AWX ?
- L'historique des exécutions est-il conservé et auditable ?

## Qualité du code Ansible

- Les playbooks respectent-ils les bonnes pratiques de développement (Ansible Lint) ?
- Les variables sensibles sont-elles chiffrées via Ansible Vault (hors environnement Vagrant) ?
- Les rôles sont-ils idempotents et modulaires ?

## Continuité de service

- Les Workflow Templates gèrent-ils correctement les échecs (rollback ou alerte) ?
- La validation post-déploiement est-elle systématiquement exécutée ?
