# Runbook — Workloads

## Démarche
1. `kubectl get pods -A -o wide`
2. `kubectl describe pod`
3. `kubectl logs`
4. vérifier probes, resources, events
5. valider selector / endpoints / DNS selon le symptôme
