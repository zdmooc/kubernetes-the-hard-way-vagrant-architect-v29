# ADR-005 — Introduce a Bastion Access Layer

## Status
Accepted

## Context

The earlier versions of the repository used:
- one load balancer,
- three controllers,
- two workers.

That was enough for a pedagogical bootstrap, but not enough to illustrate a realistic administrative access model.

## Decision

Introduce a dedicated `bastion-0` node in the Vagrant topology.

## Consequences

### Positive
- better separation between API endpoint and operator access,
- more realistic enterprise posture,
- easier explanation of access boundaries,
- better support for future hardening and audit material.

### Negative
- one more VM to run locally,
- slightly more complex SSH flows,
- more documentation required.

## Why the load balancer is not enough

A load balancer provides a stable API endpoint.
It is not an operator access control point.
Those are different architecture concerns.
