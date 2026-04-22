# Session Command Order

Ordre de travail recommandé dans une session terminal :

1. `./scripts/00-check-prereqs.sh`
2. `./scripts/01-vagrant-up.sh`
3. `./scripts/02-generate-pki.sh`
4. `./scripts/03-bootstrap-etcd.sh`
5. `./scripts/04-bootstrap-control-plane.sh`
6. `./scripts/05-bootstrap-workers.sh`
7. `./scripts/06-deploy-addons.sh`
8. `./scripts/07-smoke-tests.sh`
9. `./scripts/08-collect-evidence.sh`
10. `./scripts/09-validate-cluster.sh`
11. `./scripts/11-render-report.sh`
