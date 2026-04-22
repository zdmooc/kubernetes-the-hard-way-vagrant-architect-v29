# Day-0 / Day-1 / Day-2 Operating Model

## Goal
Clarify what must be prepared before build, what belongs to cluster creation, and what belongs to recurrent platform operations.

## Day 0 — Foundation
- host prerequisites
- Vagrant / VirtualBox validation
- IP plan
- versions pinning
- PKI model
- identity and access model
- trust zones and bastion design

## Day 1 — Build
- create VMs
- generate PKI and kubeconfigs
- bootstrap etcd
- bootstrap control plane
- bootstrap workers and runtime
- configure load balancer and CNI
- deploy DNS and baseline add-ons
- run smoke tests

## Day 2 — Operate
- etcd backup / restore drills
- certificate lifecycle
- component health checks
- evidence collection
- cluster validation profiles
- OIDC validation and audit review
- rebuild / reset flows
- release packaging and handover

## Architect angle
A platform is not complete when it boots once. It becomes credible when it can be validated, observed, backed up, recovered, and rebuilt repeatedly.
