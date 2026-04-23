# Scénario de Démonstration (V39)

Ce document décrit le scénario de démonstration à utiliser lors d'une présentation client.

## Durée : 30 minutes

### Acte 1 : Accès et Sécurité (5 min)
Connexion via le bastion, démonstration du hardening SSH, vérification des logs auditd.

### Acte 2 : Santé du Cluster (5 min)
`kubectl get nodes`, `kubectl get pods -A`, vérification de l'état etcd.

### Acte 3 : Observabilité (10 min)
Ouverture de Grafana (NodePort 30000), navigation dans les dashboards cluster et nœuds, démonstration de LogQL dans Loki.

### Acte 4 : Automatisation (5 min)
Déclenchement d'un Workflow AWX `platform-lifecycle`, suivi de l'exécution en temps réel.

### Acte 5 : Gouvernance (5 min)
Tentative de déploiement d'un pod non conforme (image latest), démonstration du blocage par Kyverno, consultation des PolicyReports.

Utilisez le script `scripts/50-demo-walkthrough.sh` pour automatiser les étapes de vérification.
