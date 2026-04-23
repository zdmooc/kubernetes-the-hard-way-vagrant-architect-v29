# Configuration des Credentials AWX

Pour qu'AWX puisse exécuter des playbooks sur les nœuds Vagrant, vous devez configurer un "Machine Credential" dans l'interface web.

## Machine Credential (Vagrant)

1. Allez dans **Credentials** > **Add**.
2. Nom : `Vagrant Machine Credential`
3. Type : `Machine`
4. Username : `vagrant`
5. SSH Private Key : Copiez le contenu de la clé privée générée par Vagrant (ex: `.vagrant/machines/bastion-0/virtualbox/private_key`).
6. Privilege Escalation Method : `sudo`

## Source Control Credential (GitHub)

Pour importer ce dépôt dans AWX :
1. Allez dans **Credentials** > **Add**.
2. Nom : `GitHub Repo Credential`
3. Type : `Source Control`
4. Renseignez votre Personal Access Token ou votre clé SSH si le dépôt est privé.
