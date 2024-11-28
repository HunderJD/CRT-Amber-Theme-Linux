#!/bin/bash

# Définir le chemin du projet à partir du script courant
PROJECT_DIR=$(dirname "$(realpath "$0")")/..

echo "Configuration de SDDM..."

# Installer SDDM si nécessaire
sudo pacman -Sy sddm --noconfirm >/dev/null 2>&1

# Configurer le thème SDDM
THEME_DIR="$PROJECT_DIR/simplicity"
if [ -d "$THEME_DIR" ]; then
    sudo cp -r "$THEME_DIR" /usr/share/sddm/themes/simplicity
    echo "[Theme]" | sudo tee /etc/sddm.conf
    echo "Current=simplicity" | sudo tee -a /etc/sddm.conf
    sudo systemctl enable sddm >/dev/null 2>&1
    sudo systemctl start sddm >/dev/null 2>&1
    echo "SDDM configuré."
else
    echo "Erreur : Thème SDDM introuvable dans $THEME_DIR."
    exit 1
fi

