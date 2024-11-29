#!/bin/bash

# Définir le chemin du projet à partir du script courant
PROJECT_DIR=$(dirname "$(realpath "$0")")/..

# Copier le thème GRUB
THEME_DIR="$PROJECT_DIR/CRT-Amber-GRUB-Theme-master"
if [ -d "$THEME_DIR" ]; then
    sudo rm -rf /boot/grub/themes/CRT-Amber-GRUB-Theme-master >/dev/null 2>&1
    sudo cp -r "$THEME_DIR" /boot/grub/themes/CRT-Amber-GRUB-Theme-master
    sudo sed -i 's|^#\?GRUB_THEME=.*|GRUB_THEME="/boot/grub/themes/CRT-Amber-GRUB-Theme-master/theme.txt"|' /etc/default/grub
    sudo update-grub >/dev/null 2>&1
    echo "GRUB mis à jour."
else
    echo "Erreur : Thème GRUB introuvable dans $THEME_DIR."
    exit 1
fi

