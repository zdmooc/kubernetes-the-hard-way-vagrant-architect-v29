# Logging Centralisé : Loki & Promtail

La V34 complète l'observabilité avec la centralisation des logs via la stack Grafana Loki.

## Objectif

Collecter, indexer et visualiser les logs de tous les composants de la plateforme et des applications dans une interface unique (Grafana).

## Architecture

- **Promtail** : Déployé en tant que DaemonSet sur chaque nœud (workers et controllers) pour collecter les logs des conteneurs et du système (journald).
- **Loki** : Moteur d'indexation et de stockage des logs, conçu pour être léger et efficace.
- **Grafana** : Interface de visualisation, déjà déployée dans la V33, qui se connecte à Loki comme source de données.

## Déploiement

Le déploiement s'effectue via les manifests Kubernetes situés dans `kubernetes/manifests/logging/`.

1. Déploiement de Loki (StatefulSet, Service, ConfigMap).
2. Déploiement de Promtail (DaemonSet, ServiceAccount, ClusterRole, ConfigMap).

Les scripts `45-deploy-loki.sh` et `46-deploy-promtail.sh` automatisent ce processus.
