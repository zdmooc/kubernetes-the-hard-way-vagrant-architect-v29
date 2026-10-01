# O7 — Claim / Evidence Matrix

| Claim | Niveau actuel | Evidence |
|---|---|---|
| architecture pédagogique KTHW | IMPLEMENTED | docs, scripts, systemd, manifests |
| shell/YAML/JSON/Vagrant syntax | PENDING_STATIC_CI | workflow O7 à exécuter |
| secret hygiene active tree | PENDING_STATIC_CI | security guard O7 |
| Vagrant topology boots | NOT_PROVEN | aucun replay actuel observé |
| PKI end-to-end | NOT_PROVEN | scripts présents |
| etcd 3-node healthy | NOT_PROVEN | scripts présents |
| control plane ready | NOT_PROVEN | scripts présents |
| workers Ready | NOT_PROVEN | scripts présents |
| pod networking / DNS | NOT_PROVEN | smoke scripts présents |
| etcd backup/restore | REFERENCE / NOT_PROVEN | scripts/runbooks sans preuve actuelle |
| HA/failover | NOT_PROVEN | topologie seule != test de panne |
| OpenShift | NOT_CLAIMED | autre dépôt |
| production | NOT_CLAIMED | aucune preuve production |

Une future promotion exige un run observé et archivé ; la présence d'un manifest ne suffit pas.
