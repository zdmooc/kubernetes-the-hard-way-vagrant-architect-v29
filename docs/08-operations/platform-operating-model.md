# Modèle Opérationnel de la Plateforme (V39)

L'exploitation d'une plateforme Kubernetes ne se limite pas à sa construction initiale. Ce document définit les procédures standard (SOP) pour maintenir la plateforme saine, sécurisée et conforme (Day 2 Operations).

## Gouvernance et Exécution

1. **Orchestration (AWX)** : Toutes les opérations Day 2 doivent être déclenchées via les Workflow Templates AWX (`awx/workflow-templates/full-day2.yml`). L'exécution manuelle via les scripts shell est réservée au débogage (break-glass).
2. **GitOps (Argo CD)** : La configuration des applications et des addons Kubernetes est gérée via le dépôt Git. Les modifications directes (`kubectl edit`) sont proscrites et seront écrasées par la boucle de réconciliation.
3. **Quality Gates (SonarQube)** : Toute modification de l'infrastructure as code (Ansible, Manifests) doit passer l'analyse SonarQube via GitLab CI avant d'être fusionnée.

## Gestion des Incidents (Observabilité et Logging)

### Alerting (Prometheus/Grafana)

- **Seuils critiques** : Utilisation CPU > 85%, RAM > 90%, Disque > 85% sur les nœuds du Control Plane.
- **Disponibilité API** : Temps de réponse > 500ms ou taux d'erreur 5xx > 1%.
- **Santé etcd** : Perte de quorum ou latence fsync > 50ms.

### Diagnostic (Loki/Promtail)

En cas d'alerte, l'opérateur doit :
1. Consulter le dashboard Grafana correspondant (`observability/dashboards/cluster.json`).
2. Corréler l'alerte avec les logs via LogQL dans l'interface Explore de Grafana.
3. Filtrer par namespace, pod ou container (ex: `{job="kubernetes-apiservers"} |= "error"`).

## Maintien en Condition de Sécurité (MCS)

### Politiques (Kyverno)

- Les politiques Kyverno (`policy/policies/*.yaml`) bloquent les déploiements non conformes (ex: images `latest`, pods privilégiés sans exception explicite).
- L'audit des violations de politiques est consultable via `kubectl get policyreports -A`.

### Gestion des Accès (OIDC/Keycloak)

- La rotation des secrets Keycloak et des certificats PKI est effectuée annuellement.
- Les accès au bastion sont tracés via `auditd` et centralisés (voir `15-collect-access-logs.sh`).

## Sauvegarde et Restauration (etcd)

- **Sauvegarde** : Déclenchée quotidiennement via cron job AWX (script `27-backup-etcd.sh`). Les snapshots sont chiffrés et stockés hors site.
- **Restauration** : Procédure documentée dans `docs/04-diagnostics/etcd-backup-restore-runbook.md` et automatisée via `28-restore-etcd.sh`.
- **Test** : Un exercice de restauration (Disaster Recovery Drill) est exécuté trimestriellement.

## Cycle de Vie (Upgrades)

Les mises à jour mineures (ex: v1.29.x) sont appliquées via Ansible (`day2-operations.yml`). Les mises à jour majeures nécessitent une nouvelle branche Git, une validation complète CI/CD et un déploiement blue/green de la plateforme.
