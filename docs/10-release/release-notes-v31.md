# Release Notes V31

La V31 introduit l'intégration de GitLab CI pour automatiser les contrôles de qualité.

## Nouveautés

- **GitLab CI Pipeline** : Configuration `.gitlab-ci.yml` avec des stages pour le linting (shellcheck), la validation (ansible-playbook syntax-check) et le packaging.
- **Documentation** : Modèle opérationnel GitLab CI et guide du pipeline.
- **Lab** : Lab 30 pour expérimenter avec le pipeline localement.

## Bénéfices

- Détection précoce des erreurs de syntaxe dans les scripts shell et playbooks Ansible.
- Standardisation du processus de packaging des releases.
