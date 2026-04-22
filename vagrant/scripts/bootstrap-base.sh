#!/usr/bin/env bash
set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y \
  curl wget vim jq socat conntrack ipset iptables arptables ebtables \
  ca-certificates gnupg lsb-release apt-transport-https \
  nfs-common dnsutils net-tools

swapoff -a || true
sed -ri '/\sswap\s/s/^#?/#/' /etc/fstab || true

cat <<EOF >/etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

modprobe overlay || true
modprobe br_netfilter || true

cat <<EOF >/etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF
sysctl --system || true

mkdir -p /etc/kubernetes /etc/containerd /opt/cni/bin
