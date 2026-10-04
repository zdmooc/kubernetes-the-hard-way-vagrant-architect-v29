# D-095 — INFRA-2 Virtualisation / Linux / Ansible Replay Plan

**Status:** PREPARED / RUNTIME PENDING

## Goal

Promote the current Vagrant/Ansible material only after a fresh observed replay.

Target claim after success:

`LAB_RUNTIME_PROVEN_LINUX_ANSIBLE_VIRTUALIZATION`

## Scope

Topology:
- bastion-0;
- lb-0;
- controller-0..2;
- worker-0..1.

Evidence:
1. Vagrant/VirtualBox versions;
2. VM status and resources;
3. network/IP mapping;
4. Ansible inventory graph;
5. Ansible syntax checks;
6. Linux kernel/sysctl checks;
7. HAProxy status;
8. etcd/control-plane systemd status;
9. containerd/kubelet/kube-proxy status;
10. kubectl nodes;
11. smoke validation;
12. restart/recovery result;
13. evidence timestamp and Git commit.

## Truth boundary

Before replay:
- Ansible code = IMPLEMENTED;
- Vagrant topology = IMPLEMENTED;
- current runtime = NOT_PROVEN.

After replay, promote only the steps actually observed.
