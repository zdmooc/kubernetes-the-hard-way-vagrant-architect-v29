# Release Notes V33

La V33 ajoute la couche d'observabilité Prometheus et Grafana.

## Nouveautés

- **Prometheus** : Déploiement pour la collecte des métriques du cluster.
- **Grafana** : Déploiement avec des tableaux de bord préconfigurés.
- **Manifests** : Fichiers Kubernetes pour le namespace `observability`.
- **Scripts** : `42-deploy-prometheus.sh`, `43-deploy-grafana.sh`, `44-validate-observability.sh`.
- **Documentation** : Guide de déploiement et modèle opérationnel.
- **Lab** : Lab 32 pour explorer les tableaux de bord Grafana.

## Bénéfices

- Visibilité sur l'état de santé du cluster et des nœuds.
- Surveillance proactive des composants clés.
