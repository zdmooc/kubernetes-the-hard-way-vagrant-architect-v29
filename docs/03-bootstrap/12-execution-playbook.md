# Execution Playbook

Ce document décrit l'enchaînement conseillé pour exécuter le dépôt en local avec Vagrant.

## Séquence de build

1. Vérifier l'hôte : Vagrant, VirtualBox, ssh, scp, kubectl, openssl.
2. Démarrer les VMs.
3. Valider IPs, hostnames, résolution de noms et synchronisation horaire.
4. Générer la PKI et les kubeconfigs.
5. Bootstrapper etcd.
6. Bootstrapper le control plane.
7. Bootstrapper les workers.
8. Déployer les addons de base.
9. Exécuter les smoke tests.
10. Collecter les preuves.

## Commandes

```bash
./scripts/00-check-prereqs.sh
./scripts/01-vagrant-up.sh
./scripts/02-generate-pki.sh
./scripts/03-bootstrap-etcd.sh
./scripts/04-bootstrap-control-plane.sh
./scripts/05-bootstrap-workers.sh
./scripts/06-deploy-addons.sh
./scripts/07-smoke-tests.sh
./scripts/08-collect-evidence.sh
```

## Critères de succès minimaux

- `vagrant status` vert sur toutes les machines ;
- `etcdctl endpoint health` vert sur les contrôleurs ;
- `kubectl get componentstatuses` ou équivalents de santé API / scheduler / controller-manager ;
- `kubectl get nodes` : tous les nodes `Ready` ;
- `kubectl get pods -A` : CoreDNS et smoke app opérationnels.
