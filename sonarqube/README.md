# SonarQube - Analyse de Qualité du Code d'Infrastructure

La V35 intègre SonarQube pour l'analyse statique du code d'infrastructure (Shell, Ansible, YAML).

## Déploiement
Exécutez `scripts/48-bootstrap-sonarqube.sh` pour démarrer SonarQube via Docker.

## Configuration
Le fichier `sonar-project.properties` configure les sources à analyser et les exclusions.

## Intégration CI
Le job `quality-scan` dans `gitlab/ci/quality.yml` déclenche automatiquement l'analyse à chaque push.

## Accès
Interface web disponible sur `http://localhost:9000` (admin/admin par défaut).
