# SonarQube & Quality Gates

La V35 introduit SonarQube pour l'analyse continue de la qualité du code (scripts shell, playbooks Ansible, manifests Kubernetes).

## Objectif

Garantir que le code d'infrastructure respecte les bonnes pratiques, est exempt de vulnérabilités (Security Hotspots) et maintient une dette technique faible.

## Intégration

SonarQube s'intègre avec le pipeline GitLab CI (mis en place en V31) via un nouveau stage `quality`. Un scanner analyse le dépôt et envoie les résultats au serveur SonarQube.

## Déploiement

Le serveur SonarQube peut être déployé en tant que conteneur Docker ou pod Kubernetes. Le script `48-bootstrap-sonarqube.sh` automatise ce déploiement, et `49-validate-sonarqube-assets.sh` vérifie son bon fonctionnement.

## Quality Gates

Les Quality Gates définissent les critères d'acceptation pour qu'une release soit considérée comme valide (par exemple : pas de bugs bloquants, couverture de code suffisante si applicable).
