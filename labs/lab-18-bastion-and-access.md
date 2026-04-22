# Lab 18 — Bastion and Access Model

## Goal

Understand why the load balancer and bastion do not serve the same purpose.

## Questions

1. What problem does `lb-0` solve?
2. What problem does `bastion-0` solve?
3. Why can a platform have a healthy API and still a broken operator access path?
4. Why is ProxyJump useful in an enterprise-like topology?

## Validation

```bash
cd vagrant
vagrant ssh bastion-0 -c "hostname"
../scripts/13-generate-ssh-config.sh
ssh -F ../evidence/ssh/ssh_config.generated controller-0 hostname
```

## Deliverable

Write a short note explaining the difference between:
- API endpoint,
- bastion,
- control plane,
- worker node access.
