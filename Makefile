.PHONY: prereqs up binaries pki kubeconfigs lb etcd control-plane workers addons smoke validate evidence oidc oidc-validate build-all

prereqs:
	./scripts/00-check-prereqs.sh

up:
	./scripts/01-vagrant-up.sh

binaries:
	./scripts/10-download-binaries.sh

pki:
	./scripts/02-generate-pki.sh

kubeconfigs:
	./scripts/12-generate-kubeconfigs.sh

lb:
	./scripts/16-configure-loadbalancer.sh

etcd:
	./scripts/03-bootstrap-etcd.sh

control-plane:
	./scripts/04-bootstrap-control-plane.sh

workers:
	./scripts/05-bootstrap-workers.sh

addons:
	./scripts/06-deploy-addons.sh

smoke:
	./scripts/07-smoke-tests.sh

validate:
	./scripts/09-validate-cluster.sh

build-all:
	./scripts/26-build-platform.sh

evidence:
	./scripts/08-collect-evidence.sh

oidc:
	./scripts/21-deploy-keycloak.sh
	./scripts/22-configure-apiserver-oidc.sh
	./scripts/23-generate-oidc-kubeconfig.sh

oidc-validate:
	./scripts/24-validate-oidc-login.sh
