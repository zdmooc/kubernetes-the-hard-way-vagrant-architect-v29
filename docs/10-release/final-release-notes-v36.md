# Release Notes Finales - V36 Enterprise Edition

**Date de publication :** 2026-04-23  
**Statut :** Stable / Enterprise Ready

La V36 marque une étape majeure dans l'évolution du projet "Kubernetes The Hard Way - Architect Edition". Elle consolide l'ensemble des couches d'industrialisation (Ansible, CI/CD, AWX), d'observabilité (Prometheus, Grafana, Loki) et de qualité (SonarQube) pour offrir une plateforme prête pour la production.

## Nouveautés Majeures (V30 - V36)

- **Parcours Ansible (V30)** : Déploiement déclaratif et idempotent de l'infrastructure via une structure de rôles complète.
- **GitLab CI (V31)** : Intégration continue pour le linting (Shellcheck, Yamllint), la validation syntaxique (Ansible, Kubeval) et le packaging.
- **AWX Orchestration (V32)** : Gestion centralisée des exécutions Ansible avec Job Templates et Workflow Templates.
- **Observability (V33)** : Stack Prometheus + Grafana pour la supervision des métriques cluster et nœuds.
- **Logging Centralisé (V34)** : Stack Loki + Promtail pour la collecte et l'analyse des logs.
- **Quality Gates (V35)** : Analyse statique du code d'infrastructure via SonarQube.
- **Documentation Enterprise (V36)** : Executive summary, matrice globale des assets, modèle opérationnel plateforme et scénario de démo complet.

## Composants Mises à Jour

- Kubernetes v1.29.0
- etcd v3.5.10
- containerd 1.7.13
- runc v1.1.12
- CNI Plugins v1.4.0
- Keycloak 23.0.4
- Prometheus v2.45.0
- Grafana 10.0.3
- Loki / Promtail 2.8.2

## Scénario de Démonstration (Demo Walkthrough)

La V36 introduit un script interactif `scripts/50-demo-walkthrough.sh` permettant de dérouler une démonstration complète de la plateforme devant un client ou une équipe d'architecture. Ce scénario couvre :
1. L'accès sécurisé via le Bastion.
2. L'authentification OIDC via Keycloak.
3. La vérification de la santé du cluster (etcd, control plane, workers).
4. La démonstration de l'observabilité (Grafana) et du logging (Loki).
5. L'exécution d'un workflow AWX.

## Prochaines Étapes (Extensions V37+)

Les prochaines versions (V37 à V39) ajouteront des extensions spécifiques pour des cas d'usage avancés : mapping OpenShift, GitOps (Argo CD) et Policy Engine (Kyverno).
