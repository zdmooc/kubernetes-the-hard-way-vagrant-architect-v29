# Conformance-lite

## Goal
This repository does not ship official upstream conformance, but it includes a lightweight validation profile to confirm that core platform capabilities are working.

## Included checks
- kubectl version and API reachability
- node readiness
- DNS lookup from a pod
- service-to-pod reachability
- deployment rollout
- RBAC can-i checks
- OIDC login presence checks

## Not included
- full Sonobuoy upstream certification run
- CSI certification tests
- CNI vendor certification tests
