#!/bin/bash

# Définir le chemin du projet à partir du script courant
PROJECT_DIR=$(dirname "$(realpath "$0")")/..

echo "Configuration de Plymouth..."

# Installer Plymouth
sudo pacman -Sy plymouth --noconfirm >/dev/null 2>&1

# Configurer le thème Plymouth
THEME_DIR="$PROJECT_DIR/CRT-Amber-Theme-Plymouth"
if [ -d "$THEME_DIR" ]; then
    sudo cp -r "$THEME_DIR" /usr/share/plymouth/themes
    sudo plymouth-set-default-theme CRT-Amber-Plymouth-Theme -R
    sudo mkinitcpio -P >/dev/null 2>&1
    echo "Plymouth configuré."
else
    echo "Erreur : Thème Plymouth introuvable dans $THEME_DIR."
    exit 1
fi

