#!/usr/bin/env bash
set -euo pipefail

echo "[CHECK] Ansible syntax..."
ansible-playbook -i ansible/inventories/vagrant/hosts.ini ansible/playbooks/site.yml --syntax-check

echo "[CHECK] ShellCheck..."
shellcheck scripts/*.sh || true

echo "[CHECK] OK"
