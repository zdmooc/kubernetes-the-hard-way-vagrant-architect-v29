# Kubernetes The Hard Way with Vagrant — Architect Edition V39

La **V39** est l'aboutissement cumulatif de toutes les versions précédentes. Elle conserve intégralement le socle d'architecture, d'audit, de sécurité, de bastion, de segmentation réseau et d'OIDC (V17-V29), et y ajoute des couches d'industrialisation complètes pour une exploitation d'entreprise.

Le dépôt sert donc à la fois à :
- **construire Kubernetes à la main avec Vagrant**, composant par composant (approche "Hard Way") ;
- **expliquer l’architecture**, les flux, le diagnostic, l'audit et les arbitrages ;
- **industrialiser le déploiement** via Ansible, GitLab CI et AWX ;
- **opérer la plateforme (Day 2)** avec Observabilité (Prometheus/Grafana), Logging (Loki/Promtail) et Gouvernance (Kyverno, SonarQube, ArgoCD).

## Topologie cible

- `bastion-0`
- `lb-0`
- `keycloak-0`
- `controller-0`
- `controller-1`
- `controller-2`
- `worker-0`
- `worker-1`

Cette topologie met en évidence :
- HA API et quorum etcd,
- séparation stricte accès / identité / control plane / workers,
- flux north-south et east-west,
- modèle d’accès plateforme réaliste d'une architecture entreprise.

## Parcours disponibles en V39

| Parcours | Description | Répertoire principal |
| :--- | :--- | :--- |
| **Shell** | Construction manuelle composant par composant (KTHW original) | `scripts/` |
| **Ansible** | Déploiement déclaratif et idempotent de l'infrastructure | `ansible/` |
| **AWX** | Orchestration d'entreprise avec interface web | `awx/` |
| **GitLab CI** | Pipeline de lint, validation et packaging | `.gitlab-ci.yml`, `gitlab/ci/` |
| **Observability** | Prometheus + Grafana (métriques) | `kubernetes/manifests/observability/` |
| **Logging** | Loki + Promtail (logs centralisés) | `kubernetes/manifests/logging/` |
| **Quality** | SonarQube + Quality Gates | `sonarqube/` |
| **OpenShift** | Mapping d'architecture K8s vanilla → OpenShift/OKD | `openshift/` |
| **GitOps** | Argo CD + pattern App-of-Apps | `gitops/` |
| **Policy** | Kyverno (gouvernance et sécurité à l'admission) | `policy/` |

## Démarrage recommandé

### Parcours Shell (KTHW classique)

```bash
./scripts/00-check-prereqs.sh
./scripts/01-vagrant-up.sh
./scripts/26-build-platform.sh
```

### Parcours Ansible (Industrialisation)

```bash
cd ansible
ansible-playbook -i inventories/vagrant/hosts.ini playbooks/build-platform.yml
```

## Carte du dépôt V39

- `docs/00-vision` : vision, executive summary, carte du dépôt
- `docs/01-architecture` : architecture globale, OpenShift mapping
- `docs/02-concepts` : synthèses par domaine, K8s vs OpenShift
- `docs/03-bootstrap` : guides de construction (shell, ansible, AWX, CI, observability, logging, quality, gitops, policy)
- `docs/04-diagnostics` : runbooks
- `docs/05-audit` : checklists, matrices, audit final
- `docs/06-diagrams` : schémas Mermaid
- `docs/07-adr` : Décisions d'architecture (ADR 001 à 017)
- `docs/08-operations` : modèles opérationnels par couche (Day 2)
- `docs/10-release` : release notes V17 → V39
- `ansible/` : inventaires, group_vars, rôles, playbooks
- `awx/` : job templates, workflow templates, inventaires AWX
- `gitlab/ci/` : stages CI par couche
- `observability/` : dashboards Grafana JSON
- `sonarqube/` : configuration SonarQube
- `openshift/` : mappings d'architecture K8s → OpenShift
- `gitops/` : manifests Argo CD
- `policy/` : politiques Kyverno
- `kubernetes/` : manifests, kubeconfigs, systemd, PKI
- `scripts/` : scripts d'orchestration technique (00 à 54)
- `labs/` : exercices pratiques guidés (01 à 38)
- `vagrant/` : topologie Vagrant
- `evidence/` : preuves et validations

## Limites assumées

Ce dépôt vise à fournir une **plateforme locale réaliste**, mais nécessite d'être adapté aux contraintes du poste local (VirtualBox/Vagrant, ressources CPU/RAM suffisantes).
Il s'agit d'un référentiel d'architecture complet (Architect Edition) conçu pour l'apprentissage, l'audit et la démonstration d'expertise.
