# AWX - Orchestration d'Entreprise

La V32 introduit AWX (la version open source d'Ansible Tower) comme troisième parcours pour la gestion de la plateforme Kubernetes.

## Objectif

L'objectif de cette couche est de fournir une interface graphique centralisée, une gestion des accès basée sur les rôles (RBAC) et une planification des tâches pour l'exécution des playbooks Ansible. AWX permet de passer d'une exécution en ligne de commande (Ansible CLI) à une orchestration d'entreprise, facilitant la délégation et l'auditabilité.

## Architecture et Intégration

AWX s'intègre au-dessus de l'infrastructure Ansible existante :
- **Source de vérité** : AWX se connecte à ce dépôt Git pour récupérer les rôles et playbooks.
- **Inventaire** : AWX utilise l'inventaire Vagrant (`awx/inventories/vagrant-inventory.yml`) pour cibler les nœuds.
- **Credentials** : Les clés SSH privées générées par Vagrant sont stockées de manière sécurisée dans AWX.

## Composants AWX

Ce répertoire contient les définitions as-code des ressources AWX :

### 1. Job Templates (`awx/job-templates/`)
Les Job Templates encapsulent l'exécution d'un playbook spécifique avec son inventaire et ses identifiants.
- `build-platform.yml` : Déploie la plateforme complète.
- `validate-platform.yml` : Vérifie l'état du cluster.
- `day2-operations.yml` : Exécute les tâches de maintenance courantes.
- `deploy-observability.yml` : Installe Prometheus et Grafana.
- `deploy-logging.yml` : Installe Loki et Promtail.
- `deploy-quality.yml` : Installe SonarQube.
- `deploy-gitops.yml` : Installe Argo CD.
- `deploy-policy.yml` : Installe Kyverno.

### 2. Workflow Templates (`awx/workflow-templates/`)
Les Workflow Templates permettent d'enchaîner plusieurs Job Templates avec des conditions de succès/échec.
- `platform-lifecycle.yml` : Enchaîne le build, la validation et les opérations Day 2.
- `quality-governance.yml` : Enchaîne le déploiement de SonarQube et l'analyse du code.
- `full-day2.yml` : Enchaîne toutes les tâches de maintenance (logging, observability, policy).

### 3. Inventaires (`awx/inventories/`)
Définit la structure des hôtes cibles pour AWX, en reprenant la topologie Vagrant (bastion, loadbalancer, controllers, workers, identity).

### 4. Credentials (`awx/credentials/`)
Explique comment configurer les Machine Credentials dans AWX pour accéder aux VMs Vagrant.

## Comment utiliser cette couche

1. **Déploiement d'AWX** : Exécutez le script `scripts/40-bootstrap-awx.sh` pour installer AWX sur le cluster Kubernetes (nécessite le cluster opérationnel).
2. **Configuration** : Utilisez l'interface web d'AWX ou l'outil `awx-cli` pour importer les ressources définies dans ce répertoire.
3. **Exécution** : Lancez les Job Templates ou Workflow Templates depuis l'interface web d'AWX.

## Modèle Opérationnel

Pour plus de détails sur l'utilisation d'AWX en exploitation, consultez le document `docs/08-operations/awx-operating-model.md`. L'audit de cette couche est décrit dans `docs/05-audit/awx-and-ansible-governance-checklist.md`.
