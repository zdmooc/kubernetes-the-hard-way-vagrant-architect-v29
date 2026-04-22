# Release Notes V34

La V34 ajoute la couche de logging centralisé avec Loki et Promtail.

## Nouveautés

- **Loki** : Moteur de stockage et d'indexation des logs.
- **Promtail** : Agent de collecte déployé sur chaque nœud du cluster.
- **Manifests** : Fichiers Kubernetes pour le namespace `logging`.
- **Scripts** : `45-deploy-loki.sh`, `46-deploy-promtail.sh`, `47-validate-logging.sh`.
- **Documentation** : Guide de déploiement et modèle opérationnel pour les logs.
- **Lab** : Lab 33 pour explorer les requêtes LogQL dans Grafana.

## Bénéfices

- Centralisation des logs applicatifs et systèmes.
- Recherche unifiée via l'interface Grafana existante.
- Diagnostic facilité par la corrélation métriques/logs.
