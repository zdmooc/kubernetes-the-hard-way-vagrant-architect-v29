# V18 — Local Platform Completion

Cette étape ferme les principaux écarts identifiés en V17 pour se rapprocher d’une **plateforme locale réellement construite** :

- téléchargement réel des binaires critiques ;
- génération réelle des kubeconfigs ;
- configuration du load balancer API ;
- configuration containerd + CNI sur les workers ;
- script one-shot d’enchaînement.

## Objectif
Passer d’un dépôt **ready-to-deploy** à un dépôt **much more executable locally**.
