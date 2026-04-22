#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

"${ROOT}/scripts/00-check-prereqs.sh"
"${ROOT}/scripts/01-vagrant-up.sh"
"${ROOT}/scripts/10-download-binaries.sh"
"${ROOT}/scripts/02-generate-pki.sh"
"${ROOT}/scripts/12-generate-kubeconfigs.sh"
"${ROOT}/scripts/16-configure-loadbalancer.sh"
"${ROOT}/scripts/03-bootstrap-etcd.sh"
"${ROOT}/scripts/04-bootstrap-control-plane.sh"
"${ROOT}/scripts/05-bootstrap-workers.sh"
"${ROOT}/scripts/06-deploy-addons.sh"
"${ROOT}/scripts/07-smoke-tests.sh"
"${ROOT}/scripts/09-validate-cluster.sh"
