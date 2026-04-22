# Release Notes V35

La V35 introduit SonarQube et les Quality Gates pour l'analyse continue du code d'infrastructure.

## Nouveautés

- **SonarQube** : Configuration du projet (`sonar-project.properties`) et scripts de déploiement (`48-bootstrap-sonarqube.sh`, `49-validate-sonarqube-assets.sh`).
- **GitLab CI** : Ajout d'un stage `quality` dans le pipeline pour l'analyse automatique.
- **AWX** : Ajout de Job et Workflow Templates pour le déploiement et la gouvernance qualité.
- **Documentation** : Modèle opérationnel qualité, Checklist d'audit et ADR 014.
- **Lab** : Lab 34 pour analyser le dépôt localement avec SonarQube.

## Bénéfices

- Détection précoce des vulnérabilités (Security Hotspots) et des mauvaises pratiques.
- Maintien d'une base de code propre et maintenable pour l'infrastructure as code.
