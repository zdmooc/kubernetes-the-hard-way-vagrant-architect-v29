# Lab 29 : Ansible Baseline

Ce lab introduit le parcours Ansible comme alternative au déploiement manuel via scripts shell.

## Objectifs
- Comprendre la structure de l'inventaire Ansible pour la topologie Vagrant.
- Exécuter les playbooks pour configurer le bastion, le load balancer, l'identity provider, le control plane et les workers.
- Valider le déploiement.

## Pré-requis
- Les machines virtuelles Vagrant doivent être démarrées (`vagrant up`).
- Ansible doit être installé sur la machine hôte.

## Instructions détaillées

1. **Vérifier l'inventaire**
   Assurez-vous que l'inventaire `ansible/inventories/vagrant/hosts.ini` correspond à votre environnement.

2. **Exécuter le playbook de build**
   ```bash
   cd ansible
   ansible-playbook -i inventories/vagrant/hosts.ini playbooks/build-platform.yml
   ```

3. **Valider le déploiement**
   ```bash
   ansible-playbook -i inventories/vagrant/hosts.ini playbooks/validate-platform.yml
   ```

## Conclusion
Le déploiement via Ansible offre une approche déclarative et idempotente, facilitant la gestion continue (Day 2 operations) de la plateforme.
