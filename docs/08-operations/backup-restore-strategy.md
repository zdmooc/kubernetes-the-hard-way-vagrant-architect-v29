# Backup and Restore Strategy

## Scope
This repository focuses first on control plane recoverability, especially etcd.

## Minimum expected capabilities
- scheduled etcd snapshot creation
- snapshot integrity checks
- documented restore procedure
- secure storage of snapshots outside the VM being protected
- regular recovery drills

## What must be backed up
- etcd snapshots
- PKI directory
- kubeconfigs
- systemd units and rendered manifests
- Keycloak realm export for OIDC scenario
- evidence folder for audit trails

## Minimum recovery objectives
- RPO target declared
- RTO target declared
- recovery owner known
- validation test after restore defined
