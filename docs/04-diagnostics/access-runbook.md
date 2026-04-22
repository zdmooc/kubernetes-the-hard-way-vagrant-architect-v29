# Access Runbook

## Objective

Diagnose administrative access issues in the bastion-based topology.

## Symptoms

- cannot SSH to `bastion-0`
- cannot reach a controller through ProxyJump
- `kubectl` reaches the API but SSH access to nodes is broken
- file transfers fail

## Diagnostic steps

### 1. Validate bastion VM

```bash
cd vagrant
vagrant status
vagrant ssh bastion-0 -c "hostname && ip -4 a"
```

### 2. Validate bastion private routing

```bash
vagrant ssh bastion-0 -c "ping -c 1 192.168.56.10"
vagrant ssh bastion-0 -c "ping -c 1 192.168.56.11"
vagrant ssh bastion-0 -c "ping -c 1 192.168.56.21"
```

### 3. Validate generated SSH config

```bash
./scripts/13-generate-ssh-config.sh
ssh -F evidence/ssh/ssh_config.generated controller-0 hostname
```

### 4. Distinguish API access from node access

- API may still work through `lb-0`
- Node admin access may still fail if bastion is down

## Audit angle

A mature platform should document:
- how operators enter,
- what the bastion exposes,
- how access is logged,
- how keys are rotated,
- what happens if bastion access is unavailable.
