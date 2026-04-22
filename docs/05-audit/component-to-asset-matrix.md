# Component to Asset Matrix

| Composant | Architecture | Bootstrap | Script | Manifest / Config | Lab | Runbook | Audit |
|---|---|---|---|---|---|---|---|
| kube-apiserver | `docs/01-architecture/control-plane.md` | `docs/03-bootstrap/05-control-plane.md` | `scripts/04-bootstrap-control-plane.sh` | `kubernetes/systemd/kube-apiserver.service` | `labs/lab-04-api-server.md` | `docs/04-diagnostics/control-plane-runbook.md` | `docs/05-audit/audit-checklist.md` |
| etcd | `docs/01-architecture/control-plane.md` | `docs/03-bootstrap/04-etcd.md` | `scripts/03-bootstrap-etcd.sh` | `kubernetes/systemd/etcd.service` | `labs/lab-03-etcd.md` | `docs/04-diagnostics/control-plane-runbook.md` | `docs/05-audit/component-audit-matrix.md` |
| kubelet | `docs/01-architecture/worker-node.md` | `docs/03-bootstrap/06-workers.md` | `scripts/05-bootstrap-workers.sh` | `kubernetes/systemd/kubelet.service` | `labs/lab-06-kubelet-and-runtime.md` | `docs/04-diagnostics/workload-runbook.md` | `docs/05-audit/component-audit-matrix.md` |
| Networking | `docs/01-architecture/global-cluster-architecture.md` | `docs/03-bootstrap/07-networking.md` | `scripts/06-deploy-addons.sh` | `kubernetes/manifests/default-deny.yaml` | `labs/lab-17-network-dns-policy.md` | `docs/04-diagnostics/network-runbook.md` | `docs/05-audit/audit-checklist.md` |
| OIDC / Keycloak | `docs/01-architecture/full-oidc-end-to-end-architecture.md` | `docs/03-bootstrap/16-keycloak-oidc-integration.md` | `scripts/21-deploy-keycloak.sh` | `kubernetes/configs/keycloak/realm-export.json` | `labs/lab-23-full-oidc-e2e.md` | `docs/04-diagnostics/oidc-e2e-runbook.md` | `docs/05-audit/oidc-production-checklist.md` |
