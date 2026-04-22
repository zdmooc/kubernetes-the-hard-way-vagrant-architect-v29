# Validation Matrix

| Domaine | Contrôle | Commande | Résultat attendu |
|---|---|---|---|
| Vagrant | État des VMs | `vagrant status` | Toutes les VMs `running` |
| etcd | Santé des endpoints | `etcdctl endpoint health` | Tous les endpoints `healthy` |
| API | Santé API | `kubectl get --raw=/readyz` | `ok` |
| Scheduler | Pod schedulé | `kubectl get pods -A -o wide` | Pods répartis sur les workers |
| Workers | Nœuds prêts | `kubectl get nodes` | `Ready` |
| DNS | Résolution Service | `nslookup kubernetes.default` | résolution OK |
| Réseau | Service | `curl http://<svc>` | réponse OK |
| Sécurité | RBAC lecture | `kubectl auth can-i` | cohérent |
