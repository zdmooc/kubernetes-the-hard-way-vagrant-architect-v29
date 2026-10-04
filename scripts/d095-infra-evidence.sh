#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

TS="$(date +%Y%m%dT%H%M%S)"
OUT="evidence/d095/${TS}"
mkdir -p "$OUT"

{
  echo "D095_INFRA_EVIDENCE_TIMESTAMP=$TS"
  echo "GIT_HEAD=$(git rev-parse HEAD 2>/dev/null || echo unknown)"
  echo "HOST=$(hostname 2>/dev/null || echo unknown)"
} | tee "$OUT/context.txt"

for cmd in vagrant ansible ansible-playbook ansible-inventory; do
  if command -v "$cmd" >/dev/null 2>&1; then
    "$cmd" --version > "$OUT/${cmd}-version.txt" 2>&1 || true
  else
    echo "MISSING: $cmd" | tee "$OUT/${cmd}-missing.txt"
  fi
done

if command -v vagrant >/dev/null 2>&1; then
  (cd vagrant && vagrant status) | tee "$OUT/vagrant-status.txt" || true
  (cd vagrant && vagrant ssh-config) > "$OUT/vagrant-ssh-config.txt" 2>&1 || true
fi

if command -v ansible-inventory >/dev/null 2>&1; then
  ansible-inventory -i ansible/inventories/vagrant/hosts.ini --graph     | tee "$OUT/ansible-inventory-graph.txt"
fi

if command -v ansible-playbook >/dev/null 2>&1; then
  for playbook in build-platform.yml validate-platform.yml day2-operations.yml; do
    ansible-playbook -i ansible/inventories/vagrant/hosts.ini       --syntax-check "ansible/playbooks/$playbook"       | tee "$OUT/ansible-syntax-${playbook%.yml}.txt"
  done
fi

cat <<'EOF' | tee "$OUT/NEXT_RUNTIME_CHECKS.txt"
Static/preflight evidence captured.

Runtime promotion still requires an observed running topology and checks for:
- VM resources/IPs
- Linux sysctl/modules
- HAProxy
- etcd/control-plane services
- containerd/kubelet/kube-proxy
- kubectl get nodes
- smoke tests
- bounded restart/recovery

Do not promote the runtime claim from this preflight alone.
EOF

echo "D095_INFRA_PREFLIGHT_EVIDENCE_CAPTURED=PASS"
echo "EVIDENCE_DIR=$OUT"
