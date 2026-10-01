# Kubernetes The Hard Way with Vagrant — Architect Edition

## Statut O7

**KUBERNETES INTERNALS / ON-PREM LEARNING SPECIALIST — HARDENING O7**

Rôle canonique :

> Comprendre Kubernetes sous le capot en construisant et diagnostiquant ses composants sur des VM locales.

Ce dépôt porte principalement le bootstrap manuel Vagrant/shell, PKI, kubeconfigs, encryption-at-rest, etcd, control plane, kubelet, kube-proxy, container runtime, CNI, DNS, RBAC/audit, systemd, smoke tests, diagnostic, backup/restore etcd et collecte d'evidence.

Il ne remplace pas :
- `k8s-openshift-cluster-factory` pour provisioning/lifecycle/Day-2 industriel ;
- `shared-platform-services-openshift` pour les services techniques communs ;
- `argocd-expert-pack` pour Argo CD / OpenShift GitOps ;
- `keycloak-enterprise-roadmap-v7` pour Keycloak/IAM.

Les anciens assets Ansible/AWX/Keycloak/GitOps/observabilité/qualité sont conservés comme patrimoine pédagogique mais ne sont plus propriétaires de ces capacités.

## Frontière de preuve

```text
README / docs / manifests        = REFERENCE ou IMPLEMENTED
static CI                        = STATIC_VALIDATED seulement après run vert observé
Vagrant Kubernetes runtime       = NOT_PROVEN tant qu'un replay actuel n'est pas observé
HA / failover / DR               = NOT_PROVEN
OpenShift / RKE2 / cloud         = NOT_CLAIMED dans ce dépôt
Production                       = NOT_CLAIMED
```

Un manifest présent dans Git n'est jamais assimilé à une preuve runtime.

## Topologie pédagogique

- `bastion-0`
- `lb-0`
- `controller-0..2`
- `worker-0..1`

`keycloak-0` reste une extension historique de démonstration OIDC ; l'expertise Keycloak canonique appartient au dépôt spécialiste.

## Parcours cœur

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
./scripts/08-collect-evidence.sh
```

Le raccourci `./scripts/26-build-platform.sh` orchestre le même parcours.

## Versions et evidence

La baseline présente dans `scripts/versions.env` est historique et doit être requalifiée avant toute nouvelle preuve runtime.

Voir :
- `docs/governance/O7_OWNERSHIP.md`
- `docs/governance/CURRENT_BASELINE_2026-10-01.md`
- `evidence/CLAIM_EVIDENCE_MATRIX.md`
- `SECURITY.md`
