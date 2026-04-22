# Command Catalog

## Vagrant
- `vagrant up`
- `vagrant halt`
- `vagrant destroy -f`
- `vagrant ssh <node>`
- `vagrant status`

## Kubernetes
- `kubectl get nodes -o wide`
- `kubectl get pods -A -o wide`
- `kubectl get svc -A`
- `kubectl get endpointslices.discovery.k8s.io -A`
- `kubectl describe node <node>`
- `kubectl logs -n kube-system <pod>`

## etcd
- `etcdctl endpoint health`
- `etcdctl member list`
- `etcdctl snapshot save snapshot.db`
