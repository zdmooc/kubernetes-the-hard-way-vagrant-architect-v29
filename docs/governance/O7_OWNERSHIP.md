# O7 — Ownership KTHW

## Rôle canonique

`kubernetes-the-hard-way-vagrant-architect-v29` explique et démontre les internals Kubernetes sur une topologie locale Vagrant.

Il est propriétaire pédagogique de : PKI, kubeconfigs, encryption-at-rest, etcd, control plane, kubelet/kube-proxy, runtime/CNI, DNS, RBAC/audit, systemd, smoke/diagnostics, backup/restore etcd et collecte d'evidence.

## Non-propriétés

| Capacité | Propriétaire canonique | Statut ici |
|---|---|---|
| cluster factory / lifecycle / Day-2 industriel | `k8s-openshift-cluster-factory` | REFERENCE_ONLY |
| shared observability / quality / IAM contracts | `shared-platform-services-openshift` | LEGACY_REFERENCE |
| Argo CD / OpenShift GitOps | `argocd-expert-pack` | LEGACY_REFERENCE |
| Keycloak / IAM profond | `keycloak-enterprise-roadmap-v7` | LEGACY_REFERENCE |
| cloud/provider portability | `kubernetes-the-hard-way-multicloud` | CONSUME / LINK |

Le dépôt ne doit pas redevenir une seconde Cluster Factory ni une plateforme de services communs.
