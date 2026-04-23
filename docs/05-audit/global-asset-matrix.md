# Matrice Globale des Assets (V39)

Ce document répertorie tous les composants de la plateforme et leurs implémentations à travers les différentes couches (Shell, Ansible, Manifests).

| Composant | Script Shell | Rôle Ansible | Manifest Kubernetes / Autre |
| :--- | :--- | :--- | :--- |
| **Infrastructure Base** | `00-check-prereqs.sh`, `01-vagrant-up.sh` | `common` | Vagrantfile, inventory.ini |
| **PKI & Certificats** | `02-generate-pki.sh` | N/A (généré via shell) | `kubernetes/pki/` |
| **Bastion & Accès** | `13-generate-ssh-config.sh`, `14-harden-bastion.sh` | `bastion` | `scripts/templates/sshd_config.bastion`, `nftables.conf` |
| **Load Balancer** | `16-configure-loadbalancer.sh` | `loadbalancer` | HAProxy config (via Ansible) |
| **etcd Cluster** | `03-bootstrap-etcd.sh` | `controller` | `kubernetes/systemd/etcd.service` |
| **Control Plane** | `04-bootstrap-control-plane.sh` | `controller` | `kube-apiserver.service`, `kube-controller-manager.service`, `kube-scheduler.service` |
| **Workers & Runtime** | `05-bootstrap-workers.sh` | `worker` | `containerd/config.toml`, `kubelet.service`, `kube-proxy.service` |
| **Réseau (CNI)** | `06-deploy-addons.sh` | `worker` | WeaveNet / Calico manifests |
| **DNS (CoreDNS)** | `06-deploy-addons.sh` | `worker` | `kubernetes/manifests/coredns.yaml` |
| **Identité (OIDC)** | `19-prepare-oidc-keycloak.sh`, `21-deploy-keycloak.sh` | `identity` | Keycloak Docker Compose, Realm export |
| **RBAC & Audit** | `17-bootstrap-rbac-admission-audit.sh` | N/A | `kubernetes/manifests/rbac-audit-readonly.yaml`, Audit Policy |
| **GitLab CI** | `38-bootstrap-gitlab-ci.sh` | N/A | `.gitlab-ci.yml`, `gitlab/ci/*.yml` |
| **AWX** | `40-bootstrap-awx.sh` | N/A | `awx/job-templates/*.yml`, `awx/workflow-templates/*.yml` |
| **Observability** | `42-deploy-prometheus.sh`, `43-deploy-grafana.sh` | `observability` | `kubernetes/manifests/observability/*.yaml`, `observability/dashboards/*.json` |
| **Logging** | `45-deploy-loki.sh`, `46-deploy-promtail.sh` | `logging` | `kubernetes/manifests/logging/loki/*.yaml`, `promtail/*.yaml` |
| **Quality (Sonar)** | `48-bootstrap-sonarqube.sh` | `quality` | `sonarqube/sonar-project.properties` |
| **GitOps (ArgoCD)** | `51-bootstrap-argocd.sh` | `gitops` | `gitops/argocd/*.yaml` |
| **Policy (Kyverno)** | `53-bootstrap-policy-engine.sh` | `policy` | `policy/policies/*.yaml` |

## Validation des Assets

Chaque composant dispose de son script de validation associé (ex: `09-validate-cluster.sh`, `18-validate-rbac-audit.sh`, `44-validate-observability.sh`). Ces validations sont intégrées dans le Workflow AWX `platform-lifecycle.yml`.
