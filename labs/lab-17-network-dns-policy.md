# Lab 17 — DNS et NetworkPolicy

## Objectif
Montrer que le réseau ne se résume pas au fait “qu’un Pod ping un autre Pod”.

## Étapes
1. déployer le namespace smoke,
2. vérifier la résolution DNS,
3. appliquer la default deny,
4. constater les effets,
5. autoriser DNS,
6. revalider.

## Résultat attendu
Le lecteur comprend que :
- le DNS est critique,
- la policy egress peut casser le nommage,
- une politique réseau doit être testée et pas seulement appliquée.
