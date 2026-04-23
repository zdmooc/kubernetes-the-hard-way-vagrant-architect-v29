# Modèle Opérationnel Qualité (SonarQube)

Ce document décrit la stratégie de gouvernance de la qualité du code d'infrastructure (Shell, Ansible, YAML, Markdown) via SonarQube.

## Stratégie de Qualité

La plateforme Kubernetes The Hard Way V35+ intègre une analyse statique de code (SAST) systématique. L'objectif n'est pas seulement de construire un cluster, mais de s'assurer que le code qui le construit est maintenable, sécurisé et exempt de dette technique.

## Déploiement et Exécution

SonarQube est déployé via le script `48-bootstrap-sonarqube.sh` (qui utilise Docker ou Kubernetes).
L'analyse est déclenchée automatiquement par GitLab CI (stage `quality`) à chaque push sur la branche principale ou lors d'une Merge Request.

## Configuration (sonar-project.properties)

Le projet est configuré pour analyser :
- `scripts/` (Shell)
- `ansible/` (YAML, Jinja2)
- `kubernetes/manifests/` (YAML)

## Quality Gate

Une "Quality Gate" est un ensemble de conditions booléennes basées sur des métriques. Si une condition n'est pas remplie, la Quality Gate échoue, bloquant potentiellement le pipeline CI.

### Seuils par défaut (Baseline)

- **Security Rating** : A (0 vulnérabilité)
- **Reliability Rating** : A (0 bug)
- **Maintainability Rating** : A (dette technique < 5%)
- **Security Hotspots Reviewed** : 100%
- **Duplicated Lines (%)** : < 3%

### Traitement des alertes

1. **Bugs et Vulnérabilités** : Doivent être corrigés immédiatement.
2. **Code Smells** : Doivent être évalués. Si c'est un faux positif (fréquent en bash complexe), il doit être marqué comme tel dans l'interface SonarQube.
3. **Security Hotspots** : Nécessitent une revue humaine pour confirmer s'il y a un risque réel.

## Intégration AWX

Le Workflow Template `quality-governance.yml` permet de déclencher une analyse complète à la demande depuis l'interface AWX, générant un rapport d'audit qualité avant toute mise en production.
