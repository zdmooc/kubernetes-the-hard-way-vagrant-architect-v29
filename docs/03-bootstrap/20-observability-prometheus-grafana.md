# Observabilité : Prometheus & Grafana

La V33 introduit une pile complète d'observabilité pour surveiller la plateforme Kubernetes et ses composants.

## Objectif

Mettre en place la collecte de métriques (Prometheus) et leur visualisation (Grafana) pour assurer la supervision proactive de l'infrastructure et des applications.

## Architecture

- **Prometheus** : Déployé dans le cluster pour scraper les métriques des nœuds (Node Exporter), des composants du Control Plane (API Server, etcd, etc.) et des pods applicatifs.
- **Grafana** : Connecté à Prometheus pour fournir des tableaux de bord interactifs.

## Déploiement

Le déploiement s'effectue via les manifests Kubernetes situés dans `kubernetes/manifests/observability/`.

1. Création du namespace `observability`.
2. Déploiement de Prometheus (ServiceAccount, ClusterRole, ConfigMap, Deployment, Service).
3. Déploiement de Grafana (ConfigMap pour les dashboards, Deployment, Service).

Les scripts `42-deploy-prometheus.sh` et `43-deploy-grafana.sh` automatisent ce processus.
