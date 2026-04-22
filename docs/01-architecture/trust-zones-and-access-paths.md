# Trust zones and access paths

## Goal
Document the security zones of the lab and make the access model explicit.

## Trust zones
- **Operator zone**: the engineer workstation.
- **Bastion zone**: the controlled SSH entry point for administration.
- **Control plane zone**: API, scheduler, controller-manager and etcd.
- **Worker zone**: application execution boundary.

## Access model
- Human SSH access should terminate on `bastion-0` first.
- Admin traffic to nodes should flow through `ProxyJump`.
- Kubernetes API traffic should traverse `lb-0` instead of directly targeting controllers.
- Worker nodes should not expose administration services publicly.

## Security intent
This topology separates **operator access** from **platform traffic**:
- bastion = access control and traceability,
- load balancer = API availability,
- controllers = orchestration,
- workers = workload execution.

## Audit points
- Can operators bypass the bastion?
- Is SSH key-based only?
- Are bastion logs retained?
- Is the network policy between zones documented?
- Is the access path reproducible and reviewable?
