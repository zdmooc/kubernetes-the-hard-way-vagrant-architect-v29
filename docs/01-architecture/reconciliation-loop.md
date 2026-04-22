# Reconciliation loop

Le modèle Kubernetes repose sur une boucle simple :
- observer,
- comparer,
- agir,
- réobserver.

Les contrôleurs ne poussent pas de scripts impératifs complexes ; ils rapprochent en permanence l’état réel de l’état désiré.
