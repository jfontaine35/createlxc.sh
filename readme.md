# Proxmox LXC Container Creation Script
==========================


## Description

Ce projet propose un script bash permettant de créer automatiquement des conteneurs LXC sous Proxmox VE. Il est conçu pour simplifier le déploiement de nouvelles machines virtuelles en fournissant une configuration paramétrable.

## Fonctionnalités

- **Paramétrage complet** : Configuration facile des caractéristiques du conteneur (VMID, hostname, réseau, stockage, mémoire, etc.)
- **Robustesse** : Vérification des prérequis et gestion des erreurs pour éviter les conflits
- **Optimisation système** : Support des fonctionnalités avancées LXC comme le nesting

## Prérequis

- Proxmox VE installé et configuré
- Accès SSH au serveur Proxmox
- Commande `pct` disponible

## Installation et Utilisation

1. **Cloner le dépôt** :

git clone https://github.com/votre-nom-d-utilisateur/proxmox-lxc-script.git

2. **Rendre le script exécutable** :

chmod +x create_lxc.sh


3. **Modifier les variables de configuration** dans `create_lxc.sh` selon vos besoins.
   
4. **Exécuter le script** :

./create_lxc.sh


## Exemple de Configuration

VMID=210

TEMPLATE="/var/lib/vz/template/cache/debian-12-standard_12.7-1_amd64.tar.zst"

HOSTNAME="srv-mtp-addc01"

NET_CONFIG="name=eth0,bridge=vmbr2,ip=192.168.1.210/24,gw=192.168.1.254"

STORAGE="local-lvm:10"

MEMORY=2048

SWAP=1024

UNPRIVILEGED=0

FEATURES="nesting=1"

DNS_SERVERS="192.168.1.210,192.168.1.217,1.1.1.1"

ONBOOT=1

PROTECTION=1


## Contribuer

Contributions sont bienvenues ! Pour proposer des modifications ou ajouter de nouvelles fonctionnalités, veuillez créer une pull request.

## Licence

Ce projet est sous licence [MIT](LICENSE).

## Remerciements

Merci à tous ceux qui contribuent à ce projet.
