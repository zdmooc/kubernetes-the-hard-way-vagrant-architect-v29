# Current baseline review — 2026-10-01

## Baseline présente dans le parcours Vagrant

- Kubernetes 1.30.0 ;
- etcd 3.5.13 ;
- CoreDNS 1.11.1 ;
- CNI plugins 1.4.1 ;
- containerd 1.7.15 ;
- runc 1.1.12.

Classification : **REFERENCE / REQUALIFICATION_REQUIRED**.

Le parcours ne doit plus être présenté comme courant ou production-ready sans replay.

## Baselines upstream observées au 2026-10-01

Candidats de requalification :
- Kubernetes 1.37.0 ;
- etcd 3.7.2 ;
- CoreDNS 1.14.7 ;
- CNI plugins 1.9.1 ;
- cri-tools 1.37.0 ;
- runc 1.5.2 ;
- containerd 2.3.6 comme candidat LTS à étudier.

Ces versions ne sont pas promues automatiquement : les configs systemd, runtime, CNI et addons doivent être revalidées ensemble.

## Gate de promotion

Avant toute promotion runtime :
1. static CI verte ;
2. boot Vagrant complet ;
3. santé etcd ;
4. readiness du control plane ;
5. workers Ready ;
6. smoke workload/réseau/DNS ;
7. collecte d'evidence ;
8. aucun secret généré dans Git.

Jusqu'à ce replay : **NOT_PROVEN**.
