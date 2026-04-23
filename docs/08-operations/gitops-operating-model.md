# Modèle Opérationnel GitOps (Argo CD)

La V38 introduit Argo CD comme moteur de réconciliation GitOps. Ce document décrit le modèle opérationnel associé.

## Principe GitOps

Le GitOps est une pratique qui consiste à utiliser Git comme source de vérité unique pour l'état déclaratif de l'infrastructure et des applications. Argo CD surveille en permanence ce dépôt et s'assure que l'état réel du cluster correspond à l'état déclaré dans Git.

## Pattern App-of-Apps

La V38 utilise le pattern "App-of-Apps" : une Application ArgoCD (`cluster-addons`) pointe vers le répertoire `gitops/applications/`, qui contient lui-même des définitions d'autres Applications. Cela permet de gérer l'ensemble des addons du cluster depuis un seul point d'entrée.

## Flux de Travail

1. Un opérateur modifie un manifest dans `kubernetes/manifests/` et crée une Merge Request.
2. GitLab CI valide la syntaxe et exécute les linters.
3. Après fusion, Argo CD détecte la divergence et synchronise automatiquement (si `automated.selfHeal: true`).
4. L'état du déploiement est visible dans l'interface web Argo CD (NodePort 30080).

## Règles Opérationnelles

Les modifications directes via `kubectl edit` ou `kubectl apply` sont proscrites en production. Toute modification doit passer par Git. Argo CD écrasera les modifications directes lors de la prochaine synchronisation.
