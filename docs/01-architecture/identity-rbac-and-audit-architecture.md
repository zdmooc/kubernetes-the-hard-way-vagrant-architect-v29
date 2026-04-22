# Identity, RBAC and Audit Architecture

## Purpose
This document explains how authentication, authorization and API auditability fit into the lab architecture.

## Security chain
A Kubernetes API request follows this path:
1. client reaches the API endpoint through the load balancer,
2. kube-apiserver authenticates the caller,
3. authorization evaluates the requested verb/resource/scope,
4. admission validates or mutates the request,
5. the action is written to storage and optionally to audit logs.

## Identity layers in this repository
- **human administrators**: access from workstation through bastion, then use kubeconfig certificates or future OIDC integration,
- **platform operators**: distinct RBAC groups for read-only audit, namespace admin and cluster admin,
- **workloads**: ServiceAccounts instead of node or human credentials.

## Core design principles
- no shared admin identity for day-to-day operations,
- least privilege RBAC,
- namespace-scoped privileges preferred over cluster-wide privileges,
- ServiceAccount tokens mounted only when required,
- API requests logged through audit policy.

## Admission baseline in V14
V14 adds:
- namespace labels for Pod Security Admission,
- a sample ValidatingAdmissionPolicy using CEL,
- a deny-by-default mindset for privileged workloads.

## What an architect should assess
- is human access separated from workload identity?
- are cluster-admin rights minimized?
- are ServiceAccounts explicitly governed?
- are audit logs enabled, retained and reviewable?
- are policy controls preventative or only documentary?
