# Security Hardening Baseline

## Control plane
- accès API chiffrés ;
- certificats maîtrisés ;
- RBAC moindre privilège ;
- chiffrement des secrets ;
- audits logs si possible.

## Workers
- kubelet durci ;
- accès SSH limités ;
- images contrôlées ;
- namespaces de démonstration séparés.
