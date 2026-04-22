# ADR 011 : AWX comme Couche d'Orchestration

## Statut
Accepté (V32)

## Contexte
Avec l'introduction d'Ansible (V30) pour le déploiement et la gestion de la plateforme, le besoin d'une interface centralisée pour l'exécution, l'audit et la délégation des tâches est apparu.

## Décision
Nous adoptons AWX comme troisième parcours d'exploitation de la plateforme Kubernetes, s'ajoutant au parcours Shell (manuel) et au parcours Ansible CLI.

## Conséquences
- **Avantages** :
  - Interface utilisateur pour l'exécution des playbooks.
  - Gestion centralisée et sécurisée des identifiants (Credentials).
  - Historique d'exécution et auditabilité.
  - Planification des tâches (Day 2 operations).
- **Inconvénients** :
  - Complexité supplémentaire dans l'architecture de gestion.
  - Consommation de ressources accrue pour l'exécution d'AWX.

## Alternatives considérées
- **Ansible Tower** : Solution commerciale, écartée pour des raisons de coût et d'accessibilité dans un contexte de lab open source.
- **Rundeck / Jenkins** : Moins intégrés nativement avec l'écosystème Ansible qu'AWX.
