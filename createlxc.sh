#!/bin/bash
# Script d'automatisation pour conteneurs LXC Proxmox VE
# Licence : MIT

# Configuration des variables modifiables
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

# Vérification des prérequis
if ! command -v pct &> /dev/null; then
    echo "Erreur : la commande pct n'est pas disponible"
    exit 1
fi

if [ ! -f "$TEMPLATE" ]; then
    echo "Erreur : le template $TEMPLATE est introuvable"
    exit 1
fi

if pct list | grep -q "$VMID"; then
    echo "Erreur : le conteneur $VMID existe déjà"
    exit 1
fi

# Création du conteneur
pct create "$VMID" "$TEMPLATE" \
  --hostname "$HOSTNAME" \
  --net0 "$NET_CONFIG" \
  --rootfs "$STORAGE" \
  --memory "$MEMORY" \
  --swap "$SWAP" \
  --unprivileged "$UNPRIVILEGED" \
  --features "$FEATURES" \
  --nameserver "$DNS_SERVERS" \
  --onboot "$ONBOOT" \
  --protection "$PROTECTION"

# Vérification du statut
if [ $? -eq 0 ]; then
    echo "Conteneur $VMID créé avec succès"
    pct start "$VMID"
else
    echo "Erreur lors de la création du conteneur"
    exit 1
fi
