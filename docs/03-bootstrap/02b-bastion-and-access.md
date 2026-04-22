# Bastion and Access Bootstrap

## Goal

Prepare a realistic access pattern before bootstrapping the cluster.

## Bastion role

The bastion is the entry point for:
- SSH administration,
- log collection,
- operational troubleshooting,
- controlled file transfers,
- future hardening and access logging.

## Validation targets

- `bastion-0` is reachable from the workstation
- private network can reach `lb-0`, controllers and workers
- SSH ProxyJump works
- bastion hostname and routing are stable

## Example flow

```bash
ssh -J vagrant@127.0.0.1:2222 vagrant@192.168.56.11
```

## Why this matters

Without a bastion, the lab remains valid technically.
With a bastion, the lab becomes closer to a real platform architecture.
