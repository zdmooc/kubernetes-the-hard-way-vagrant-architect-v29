# Artifact Generation

## Objectif
Préparer proprement les artefacts nécessaires au cluster :
- binaires,
- certificats,
- kubeconfigs,
- fichiers de configuration,
- unités systemd.

## Principe
Séparer :
1. ce qui est généré localement ;
2. ce qui est copié vers les nœuds ;
3. ce qui est activé côté systemd ;
4. ce qui est validé à la fin.
