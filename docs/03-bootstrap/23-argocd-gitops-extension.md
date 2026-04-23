# Bootstrap ArgoCD (V38)

Ce document décrit l'installation et la configuration d'Argo CD sur le cluster.

## Prérequis
- Cluster Kubernetes opérationnel (V29+)
- `kubectl` configuré

## Installation
Exécutez le script `scripts/51-bootstrap-argocd.sh` qui applique les manifests `gitops/argocd/installation.yaml`.

## Vérification
Après déploiement, accédez à l'interface web via `http://<worker-ip>:30080`. Le mot de passe initial admin est généré automatiquement : `kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath='{.data.password}' | base64 -d`.

## App-of-Apps
Appliquez `gitops/argocd/app-of-apps.yaml` pour activer la synchronisation automatique de tous les addons.
