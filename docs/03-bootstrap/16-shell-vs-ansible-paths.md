# Parcours Shell vs Ansible

La V30 introduit une approche déclarative avec Ansible en parallèle du parcours shell existant.

## Objectif

L'objectif n'est pas de remplacer les scripts shell, mais d'offrir une alternative industrielle pour le déploiement et la gestion continue de la plateforme Kubernetes.

## Comparaison

| Caractéristique | Parcours Shell | Parcours Ansible |
| :--- | :--- | :--- |
| Approche | Impérative | Déclarative |
| Idempotence | Limitée | Forte |
| Complexité | Faible (scripts simples) | Moyenne (structure rôles/playbooks) |
| Gestion continue (Day 2) | Difficile | Facilitée |
| Compréhension | Excellente (étape par étape) | Abstraite (via les modules) |

## Choix du parcours

- **Apprentissage / Debugging** : Privilégier le parcours shell pour comprendre chaque étape de l'installation (Kubernetes The Hard Way).
- **Industrialisation / Production** : Privilégier Ansible pour garantir la cohérence et la répétabilité du déploiement.
