# Changelog

## V17
- Consolidation finale de cohérence : README, ADR, labs, notes de release et scripts cœur renforcés.
- Renumérotation des ADR et des labs pour supprimer les doublons.
- Ajout des index ADR / labs et d’une matrice composant → artefacts.

## V15
- Added identity federation and OIDC preparation assets.
- Added human vs workload identity separation material.
- Added RBAC manifests for federated groups and CI deployer service account.

## V9
- finition éditoriale ;
- cartes de lecture ;
- documentation portefeuille.

## V8
- exploitation, incidents, sécurité, readiness mission.

## V7
- automation des artefacts et catalogue de commandes.

## V6
- playbook d'exécution, validation, rapport d'audit exemple.

## V11
- Added bastion-0 to the Vagrant topology.
- Added ProxyJump-based SSH access model and generator script.
- Added access architecture, diagnostics, audit checklist and ADR.
- Added Lab 18 focused on bastion and access boundaries.

## V12
- Added bastion hardening baseline (SSH, nftables, journald, sudo model).
- Added access logging collection script and bastion evidence folder.
- Added architecture, bootstrap, operations, diagnostics and audit docs for bastion hardening.
- Added ADR-006 and lab-19 focused on access security and logging.

## V16
- Added a dedicated `keycloak-0` identity node to the Vagrant topology.
- Added end-to-end OIDC assets: Keycloak realm import, kube-apiserver OIDC flags, federated RBAC manifests and kubectl exec kubeconfig example.
- Added deployment, validation and troubleshooting scripts for full OIDC integration.
- Added architecture, bootstrap, audit, ADR and lab content for real OIDC login flow.

## V29
- Added day-2 operations assets: backup/restore, observability, validation, reset/destroy/rebuild.
- Added release engineering helpers and local CI entrypoint.
- Added labs 24-28 and operations / validation documentation.

## V30

Ajout du parcours Ansible en parallèle du parcours shell. Structure complète de rôles, inventaires et playbooks créée. Documentation comparative Shell vs Ansible et modèle opérationnel Ansible ajoutés.

## V31

Intégration de GitLab CI avec un pipeline complet (stages lint, validate, package). Fichier `.gitlab-ci.yml` et configurations de stages dans `gitlab/ci/`. Scripts 38 et 39 ajoutés.

## V32

Ajout d'AWX comme troisième parcours d'orchestration. Structure complète avec Job Templates, Workflow Templates, Inventories et Credentials. ADR-011 et scripts 40-41 ajoutés.

## V33

Déploiement de la pile d'observabilité Prometheus + Grafana. Manifests Kubernetes, rôle Ansible, Job Template AWX, stage GitLab CI. Scripts 42-44 ajoutés.

## V34

Centralisation des logs avec Loki + Promtail. Manifests Kubernetes, rôle Ansible, playbook dédié, Job Template AWX, stage GitLab CI. Scripts 45-47 ajoutés.

## V35

Ajout de SonarQube et des Quality Gates. Configuration sonar-project.properties, rôle Ansible, stage quality dans GitLab CI, Job et Workflow Templates AWX. ADR-014 et scripts 48-49 ajoutés.

## V36

Version Enterprise Edition finale. Consolidation de la documentation : executive summary, carte du dépôt finale, checklist d'audit final, matrice globale des assets, modèle opérationnel plateforme, scénario de démo. Script 50 et lab 35 ajoutés.

## V37

Extension OpenShift/OKD Mapping. Répertoire openshift/ avec mappings des composants. Documentation comparative K8s vanilla vs OpenShift. ADR-015 et lab 36 ajoutés.

## V38

Extension GitOps avec Argo CD. Répertoire gitops/ avec structure App-of-Apps. Documentation, rôle Ansible gitops, Job Template AWX. ADR-016 et lab 37 ajoutés. Scripts 51-52 ajoutés.

## V39

Extension Policy Engine avec Kyverno. Répertoire policy/ avec politiques de base. Documentation, rôle Ansible policy, Job Template AWX, stage GitLab CI. ADR-017 et lab 38 ajoutés. Scripts 53-54 ajoutés.
