# Checklist de validation V5

## Infrastructure
- [ ] toutes les VM sont démarrées
- [ ] les IPs sont stables
- [ ] les hostnames sont corrects
- [ ] l’accès SSH fonctionne

## PKI
- [ ] CA générée
- [ ] certificats serveurs générés
- [ ] certificats clients générés
- [ ] arborescence `kubernetes/pki/generated/` cohérente

## etcd
- [ ] service systemd présent sur les 3 contrôleurs
- [ ] endpoints etcd joignables
- [ ] état de santé vérifié
- [ ] procédure de backup documentée

## API / Control Plane
- [ ] kube-apiserver présent
- [ ] kube-controller-manager présent
- [ ] kube-scheduler présent
- [ ] `/readyz` valide
- [ ] kubeconfigs déposés

## Workers
- [ ] kubelet présent
- [ ] kube-proxy présent
- [ ] runtime installé
- [ ] plugins CNI présents
- [ ] nœuds enregistrés

## Addons
- [ ] CoreDNS déployé
- [ ] namespace smoke créé
- [ ] déploiement smoke prêt
- [ ] RBAC de lecture audit appliqué

## Exploitation
- [ ] `kubectl get nodes` OK
- [ ] `kubectl get pods -A` OK
- [ ] collecte de preuves réalisée
