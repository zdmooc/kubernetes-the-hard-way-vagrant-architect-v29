# Extension OpenShift / OKD Mapping

La V37 introduit une extension conceptuelle majeure : le mapping entre notre plateforme Kubernetes "Vanilla" construite à la main et une distribution d'entreprise comme Red Hat OpenShift (ou sa version communautaire OKD).

## Objectif de cette extension

L'objectif n'est pas de déployer OpenShift via Vagrant (ce qui nécessiterait des ressources matérielles considérables et des outils spécifiques comme `openshift-install`), mais de démontrer que l'architecture fondamentale comprise et construite dans ce dépôt s'applique directement à OpenShift.

Ce répertoire et les documents associés servent de pont ("mapping") pour un architecte devant justifier ses choix ou passer d'un environnement Vanilla à un environnement OpenShift.

## Architecture Cible OpenShift vs KTHW

Dans notre topologie KTHW, nous avons séparé manuellement les rôles (Bastion, LoadBalancer, Identity, Controller, Worker). OpenShift automatise et encadre ces concepts.

### 1. Control Plane (Controllers)
- **KTHW** : Nœuds `controller-0,1,2` avec etcd, kube-apiserver, kube-controller-manager, kube-scheduler gérés par systemd.
- **OpenShift** : Nœuds "Master" (Control Plane). Les composants Kubernetes tournent sous forme de pods statiques gérés par le Machine Config Operator (MCO) et le Cluster Version Operator (CVO). etcd a son propre opérateur (`cluster-etcd-operator`).

### 2. Nœuds d'exécution (Workers)
- **KTHW** : Nœuds `worker-0,1` avec containerd et kubelet.
- **OpenShift** : Nœuds "Worker" (Compute). OpenShift utilise CRI-O au lieu de containerd, et CoreOS (RHCOS) au lieu d'Ubuntu. Le kubelet est géré via Machine Config.

### 3. Réseau (CNI)
- **KTHW** : CNI basique (WeaveNet ou Calico).
- **OpenShift** : OpenShift SDN ou OVN-Kubernetes (par défaut depuis OCP 4.12). Intégration native des NetworkPolicies et du routage Egress.

### 4. Routage Externe (Ingress vs Route)
- **KTHW** : Nœud `lb-0` avec HAProxy devant les API, et NodePorts pour les applications.
- **OpenShift** : Le routeur OpenShift (basé sur HAProxy) est déployé nativement via l'Ingress Operator. Il introduit le concept de `Route` (spécifique à OpenShift) en plus de l'`Ingress` standard.

### 5. Identité et Sécurité (RBAC & OIDC)
- **KTHW** : Nœud `keycloak-0` déployé manuellement, drapeaux OIDC configurés sur le `kube-apiserver`, RBAC basique.
- **OpenShift** : Authentification gérée par le composant `OAuth` intégré. OpenShift se connecte facilement à des fournisseurs externes (LDAP, OIDC, Active Directory). OpenShift introduit également les Security Context Constraints (SCC) historiquement, bien que les Pod Security Admissions (PSA) soient désormais le standard.

## Différences Clés et Ajouts OpenShift

OpenShift n'est pas juste Kubernetes, c'est une plateforme PaaS complète. Voici les ajouts majeurs par rapport à notre KTHW :

1. **Opérateurs partout** : Dans OpenShift, tout est géré par des opérateurs (le réseau, le stockage, l'authentification, le registre d'images, la console web).
2. **Image Registry intégré** : OpenShift fournit un registre de conteneurs interne sécurisé.
3. **Builds et ImageStreams** : OpenShift peut construire des images depuis le code source (S2I - Source to Image) et gère les versions via des ImageStreams.
4. **Console Web** : Une interface d'administration riche, là où KTHW se repose sur `kubectl` et AWX.
5. **Machine API** : OpenShift peut provisionner dynamiquement de nouveaux nœuds sur des fournisseurs cloud ou vSphere via la Machine API.

## Comment utiliser cette extension en mission client

Si vous intervenez sur une mission OpenShift, utilisez ce répertoire comme référence pour :
- **Audit** : Comparer la configuration OpenShift du client avec les bonnes pratiques fondamentales de KTHW.
- **Troubleshooting** : Si un composant OpenShift échoue (ex: API Server), la connaissance acquise dans KTHW permet de comprendre les logs et l'interaction avec etcd.
- **Sécurité** : Traduire les exigences de sécurité (hardening bastion, RBAC strict) dans le paradigme OpenShift.

Consultez `docs/05-audit/openshift-platform-mapping-checklist.md` pour une liste de contrôle détaillée lors d'un audit OpenShift.
