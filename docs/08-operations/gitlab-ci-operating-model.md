# Modèle Opérationnel GitLab CI

L'intégration de GitLab CI dans le projet vise à garantir la qualité et la stabilité des configurations.

## Gestion des Runners

Les GitLab Runners doivent être configurés avec les tags `shell` et `vagrant` pour pouvoir exécuter les tests localement sur l'infrastructure Vagrant.

## Cycle de vie des branches

1. **Feature branches** : Linting et validation syntaxique.
2. **Main branch** : Linting, validation et packaging de la release.

## Résolution des erreurs

En cas d'échec du pipeline :
- Vérifier les logs du job GitLab CI.
- Exécuter les commandes localement pour reproduire l'erreur.
- Corriger les erreurs de syntaxe (Shellcheck, Ansible lint).
