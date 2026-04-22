# Observability Baseline Runbook

## Goal
Deploy and validate a minimum visibility stack for local operations.

## Baseline
- metrics-server
- kube-state and node visibility via kubectl top
- logs collection from control plane and worker services

## Commands
```bash
bash scripts/29-deploy-metrics-server.sh
bash scripts/30-deploy-observability-baseline.sh
bash scripts/31-collect-control-plane-logs.sh
```
