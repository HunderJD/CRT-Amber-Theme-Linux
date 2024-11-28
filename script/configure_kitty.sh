#!/bin/bash

# Définir le chemin du projet à partir du script courant
PROJECT_DIR=$(dirname "$(realpath "$0")")/..

echo "Installation et configuration de Kitty..."

# Installer Kitty
sudo pacman -Sy kitty --noconfirm >/dev/null 2>&1

# Configurer Kitty
CONFIG_DIR="$PROJECT_DIR"
if [ -f "$CONFIG_DIR/kitty.conf" ]; then
    mkdir -p ~/.config/kitty
    cp "$CONFIG_DIR/kitty.conf" ~/.config/kitty/kitty.conf
    echo "Kitty configuré."
else
    echo "Erreur : Fichier kitty.conf introuvable dans $CONFIG_DIR."
    exit 1
fi

