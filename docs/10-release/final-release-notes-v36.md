# Release Notes historiques — V36 Enterprise Edition

**Date historique :** 2026-04-23  
**Classification O7 :** `LEGACY_REFERENCE / REQUALIFICATION_REQUIRED / NOT_RUNTIME_PROVEN`

Cette note est conservée comme historique. Les anciennes formulations de maturité entreprise ne constituent pas une preuve actuelle et ne doivent plus être reprises comme claim.

La V36 regroupait Ansible, CI/CD, AWX, observabilité, logging et qualité autour du laboratoire KTHW. Depuis la rationalisation O1→O9, ces capacités ont des propriétaires canoniques distincts et restent ici comme contexte pédagogique.

## Baseline historique V36

- Kubernetes v1.29.0
- etcd v3.5.10
- containerd 1.7.13
- runc v1.1.12
- CNI Plugins v1.4.0
- Keycloak 23.0.4
- Prometheus v2.45.0
- Grafana 10.0.3
- Loki / Promtail 2.8.2

Ces versions ne définissent pas une baseline actuelle supportée.

## Frontière actuelle

Le cœur canonique du dépôt est l'apprentissage des internals Kubernetes : PKI, kubeconfigs, encryption-at-rest, etcd, control plane, workers, réseau, DNS, RBAC, systemd, diagnostic et evidence.
