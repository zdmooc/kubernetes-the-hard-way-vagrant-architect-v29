# Kubernetes The Hard Way with Vagrant — Architect Edition V29

## Positionnement

La **V29** est la continuité cumulative de la V17. Elle conserve tout le socle d’architecture, d’audit, de sécurité, de bastion, de segmentation réseau et d’OIDC, puis ajoute une couche **beaucoup plus exécutable** pour construire la plateforme en local avec Vagrant.

Le dépôt sert donc à la fois à :
- **construire Kubernetes à la main avec Vagrant**, composant par composant ;
- **expliquer l’architecture**, les flux, le diagnostic, l’audit et les arbitrages ;
- **industrialiser le build local** : binaires, kubeconfigs, load balancer, runtime, CNI, addons, validations.

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
- HA API,
- quorum etcd,
- séparation accès / identité / control plane / workers,
- flux north-south et east-west,
- diagnostic réaliste,
- modèle d’accès plateforme plus proche d’une vraie architecture entreprise.

## Ce que contient désormais la V29

### 1. Tout le contenu V17
- architecture, concepts, runbooks, audit, ADR, labs ;
- bastion, segmentation, hardening, RBAC, admission, audit policy ;
- préparation puis intégration OIDC / Keycloak.

### 2. Une couche d’exécution renforcée
- **téléchargement réel des binaires** Kubernetes / etcd / runc / CNI ;
- **génération réelle des kubeconfigs** via `kubectl config` ;
- **configuration du load balancer** (`haproxy`) ;
- **configuration containerd + CNI** sur les workers ;
- **script one-shot** de build local ;
- **validation plus stricte** de l’enchaînement.

### 3. Une base locale plus proche d’une vraie plateforme construite
- fichiers de configuration pour `haproxy`, `containerd`, CNI bridge/loopback ;
- scripts additionnels pour fermer les derniers trous majeurs du build local ;
- documentation V29 dédiée aux écarts entre dépôt “portfolio” et dépôt “plateforme locale montable”.

## Démarrage recommandé

### Parcours étape par étape

```bash
./scripts/00-check-prereqs.sh
./scripts/01-vagrant-up.sh
./scripts/10-download-binaries.sh
./scripts/02-generate-pki.sh
./scripts/12-generate-kubeconfigs.sh
./scripts/16-configure-loadbalancer.sh
./scripts/03-bootstrap-etcd.sh
./scripts/04-bootstrap-control-plane.sh
./scripts/05-bootstrap-workers.sh
./scripts/06-deploy-addons.sh
./scripts/07-smoke-tests.sh
./scripts/09-validate-cluster.sh
```

### Parcours one-shot

```bash
./scripts/26-build-platform.sh
```

## Carte du dépôt

- `docs/00-vision` : intention pédagogique et parcours
- `docs/01-architecture` : architecture globale, control plane, workers, accès, identité
- `docs/02-concepts` : synthèses par domaine
- `docs/03-bootstrap` : guide de construction du cluster
- `docs/04-diagnostics` : runbooks
- `docs/05-audit` : checklist, anti-patterns, recommandations
- `docs/06-diagrams` : schémas Mermaid
- `docs/07-adr` : décisions d’architecture
- `docs/08-reference` : commandes et séquences
- `docs/09-operations` : exploitation et preuves
- `docs/10-release` : release notes
- `vagrant/` : topologie Vagrant
- `kubernetes/` : manifests, kubeconfigs, unités systemd, configs
- `scripts/` : orchestration technique
- `evidence/` : preuves et validations

## Limites encore assumées

La V29 vise une **plateforme locale beaucoup plus construisible**, mais elle reste un dépôt à adapter aux contraintes exactes du poste local :
- VirtualBox / Vagrant réellement installés ;
- plugin `vagrant-scp` si nécessaire ;
- ressources CPU/RAM suffisantes ;
- éventuels ajustements DNS, certificats et options noyau selon l’OS hôte.

Elle est donc plus proche d’un **build local de bout en bout**, sans prétendre qu’il a été exécuté ici sur de vraies VMs.


## V29 additions

This cumulative V29 extends V18 with day-2 operations and release engineering:
- etcd backup and restore scripts
- observability baseline deployment
- local validation and conformance-lite checks
- reset / destroy / rebuild scripts
- release packaging and local CI helper
- operational readiness and recovery documentation
