# API flow

1. Le client envoie une requête à l’API Server.
2. L’API Server authentifie et autorise.
3. La chaîne d’admission valide ou modifie l’objet.
4. L’objet est persisté dans etcd.
5. Les contrôleurs et kubelets observent les changements via watch.
6. L’état réel converge progressivement vers l’état désiré.
