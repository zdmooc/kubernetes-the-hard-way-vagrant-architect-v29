# Security policy

Ce dépôt est public.

Ne jamais commiter de credential réel, token OAuth/OIDC, client secret, clé privée, kubeconfig généré, cloud credential, fichier PKI généré, fichier d'environnement runtime ou sortie d'evidence contenant des secrets.

Les credentials de démonstration doivent être injectés au runtime depuis l'environnement local ou un secret store.

Si une valeur sensible a été commitée historiquement, sa suppression de `main` n'efface pas l'historique Git. Toute valeur ayant pu être réellement utilisée doit être considérée compromise et révoquée/rotatée.
