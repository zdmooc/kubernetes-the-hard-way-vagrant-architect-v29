# Audit checklist

## Architecture
- API HA ?
- etcd sauvegardé, isolé, chiffré ?
- version skew cohérent ?

## Nodes
- kubelet durci ?
- runtime standardisé ?
- ressources surveillées ?

## Workloads
- bon contrôleur ?
- probes définies ?
- requests/limits définies ?
- PDB sur apps critiques ?

## Networking
- CNI identifié ?
- Services correctement mappés ?
- DNS sain ?
- policies réseau actives ?

## Storage
- classes de stockage gouvernées ?
- stratégie backup/restore ?
- reclaim policy adaptée ?

## Security
- RBAC minimal ?
- ServiceAccounts bornés ?
- Secrets gouvernés ?
- contrôles d’admission en place ?
