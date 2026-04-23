# Modèle Opérationnel Policy Engine (Kyverno)

La V39 introduit Kyverno comme moteur de politique de sécurité. Ce document décrit le modèle opérationnel associé.

## Rôle de Kyverno

Kyverno est un moteur de politique natif Kubernetes. Il opère comme un Admission Webhook : chaque ressource soumise à l'API Server est évaluée par Kyverno avant d'être acceptée ou rejetée. Il peut également muter les ressources (ajouter des labels, des annotations, des valeurs par défaut) et générer de nouvelles ressources.

## Politiques Déployées (Baseline)

| Politique | Mode | Description |
| :--- | :--- | :--- |
| `require-labels` | Enforce | Exige le label `app.kubernetes.io/name` sur tous les Pods |
| `require-requests-limits` | Enforce | Exige des `requests` et `limits` CPU/mémoire sur tous les conteneurs |
| `disallow-latest-tag` | Enforce | Interdit l'utilisation du tag `latest` pour les images |
| `require-run-as-non-root` | Enforce | Interdit l'exécution de conteneurs en tant que root |

## Gestion des Exceptions

Si une exception est nécessaire (ex: un pod système qui doit tourner en root), il faut :
1. Créer une `PolicyException` Kyverno dans le namespace concerné.
2. Documenter la raison de l'exception dans le commentaire de la PR Git.
3. Faire valider l'exception par le responsable sécurité.

## Audit et Reporting

En mode `Audit` (non `Enforce`), Kyverno génère des `PolicyReport` et `ClusterPolicyReport` qui listent les violations sans les bloquer. Ces rapports sont consultables via `kubectl get policyreports -A`.
