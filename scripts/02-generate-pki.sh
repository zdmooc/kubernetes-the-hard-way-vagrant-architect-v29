#!/usr/bin/env bash
set -euo pipefail
# shellcheck source=scripts/lib.sh
source "$(dirname "$0")/lib.sh"

PKI_DIR="${REPO_ROOT}/kubernetes/pki"
ensure_dir "${PKI_DIR}"

log "Génération de la PKI locale dans ${PKI_DIR}"

OPENSSL_CNF="${PKI_DIR}/openssl-k8s.cnf"
cat > "${OPENSSL_CNF}" <<'EOF'
[ req ]
distinguished_name = req_distinguished_name
x509_extensions = v3_ca
prompt = no

[ req_distinguished_name ]
CN = kubernetes-ca

[ v3_ca ]
basicConstraints = critical,CA:TRUE,pathlen:1
keyUsage = critical,keyCertSign,cRLSign,digitalSignature
subjectKeyIdentifier = hash

[ server_cert ]
basicConstraints = CA:FALSE
keyUsage = critical,digitalSignature,keyEncipherment
extendedKeyUsage = serverAuth,clientAuth
subjectAltName = @alt_names

[ client_cert ]
basicConstraints = CA:FALSE
keyUsage = critical,digitalSignature,keyEncipherment
extendedKeyUsage = clientAuth

[ alt_names ]
DNS.1 = kubernetes
DNS.2 = kubernetes.default
DNS.3 = kubernetes.default.svc
DNS.4 = kubernetes.default.svc.cluster.local
DNS.5 = localhost
IP.1 = 127.0.0.1
IP.2 = 10.32.0.1
IP.3 = 192.168.56.10
IP.4 = 192.168.56.11
IP.5 = 192.168.56.12
IP.6 = 192.168.56.13
EOF

if [[ ! -f "${PKI_DIR}/ca-key.pem" ]]; then
  openssl genrsa -out "${PKI_DIR}/ca-key.pem" 4096 >/dev/null 2>&1
  openssl req -x509 -new -nodes -key "${PKI_DIR}/ca-key.pem" -days 3650     -out "${PKI_DIR}/ca.pem" -config "${OPENSSL_CNF}" >/dev/null 2>&1
fi

gen_server_cert() {
  local name="$1"
  openssl genrsa -out "${PKI_DIR}/${name}-key.pem" 2048 >/dev/null 2>&1
  openssl req -new -key "${PKI_DIR}/${name}-key.pem" -out "${PKI_DIR}/${name}.csr" -subj "/CN=${name}" >/dev/null 2>&1
  openssl x509 -req -in "${PKI_DIR}/${name}.csr" -CA "${PKI_DIR}/ca.pem" -CAkey "${PKI_DIR}/ca-key.pem" -CAcreateserial     -out "${PKI_DIR}/${name}.pem" -days 3650 -extensions server_cert -extfile "${OPENSSL_CNF}" >/dev/null 2>&1
}

gen_client_cert() {
  local name="$1"
  local cn="$2"
  openssl genrsa -out "${PKI_DIR}/${name}-key.pem" 2048 >/dev/null 2>&1
  openssl req -new -key "${PKI_DIR}/${name}-key.pem" -out "${PKI_DIR}/${name}.csr" -subj "/CN=${cn}" >/dev/null 2>&1
  openssl x509 -req -in "${PKI_DIR}/${name}.csr" -CA "${PKI_DIR}/ca.pem" -CAkey "${PKI_DIR}/ca-key.pem" -CAcreateserial     -out "${PKI_DIR}/${name}.pem" -days 3650 -extensions client_cert -extfile "${OPENSSL_CNF}" >/dev/null 2>&1
}

for name in kubernetes controller-0 controller-1 controller-2 worker-0 worker-1; do
  [[ -f "${PKI_DIR}/${name}.pem" ]] || gen_server_cert "${name}"
done

[[ -f "${PKI_DIR}/admin.pem" ]] || gen_client_cert admin admin
[[ -f "${PKI_DIR}/controller-manager.pem" ]] || gen_client_cert controller-manager system:kube-controller-manager
[[ -f "${PKI_DIR}/scheduler.pem" ]] || gen_client_cert scheduler system:kube-scheduler
[[ -f "${PKI_DIR}/kube-proxy.pem" ]] || gen_client_cert kube-proxy system:kube-proxy
[[ -f "${PKI_DIR}/service-account.pem" ]] || gen_client_cert service-account service-accounts

log "PKI prête dans ${PKI_DIR}"
find "${PKI_DIR}" -maxdepth 1 -type f -printf ' - %f\n'
