# Pipeline GitLab CI

La V31 introduit l'intégration continue avec GitLab CI.

## Objectif

Automatiser les vérifications de qualité (linting), la validation des configurations (Ansible syntax check) et le packaging des releases.

## Étapes du pipeline

1. **Lint** : Vérification de la syntaxe des scripts shell via `shellcheck`.
2. **Validate** : Vérification de la syntaxe des playbooks Ansible.
3. **Package** : Exécution du script de packaging pour générer les artefacts de release.

## Exécution locale

Vous pouvez tester le pipeline localement en utilisant GitLab Runner en mode exec ou en exécutant les scripts directement.
