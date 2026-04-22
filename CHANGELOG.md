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
