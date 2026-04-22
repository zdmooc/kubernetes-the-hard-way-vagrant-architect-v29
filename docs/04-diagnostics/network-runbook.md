# Runbook — Network

## Démarche
- vérifier Pods,
- vérifier Service,
- vérifier Endpoints/EndpointSlices,
- vérifier DNS,
- vérifier NetworkPolicies,
- vérifier CNI / kube-proxy.

## Commandes
```bash
kubectl get svc,endpoints,endpointslices -A
kubectl exec -it <pod> -- nslookup kubernetes.default
kubectl exec -it <pod> -- wget -qO- http://<service>:<port>
```
