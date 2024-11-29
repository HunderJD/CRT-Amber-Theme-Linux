#!/bin/bash

# Définir le chemin du projet pour les scripts
SCRIPT_DIR=$(dirname "$(realpath "$0")")/..

# Discord
echo "Installation de Discord..."
sudo pacman -Sy discord --noconfirm >/dev/null 2>&1
echo "Discord installé."

# Brave
echo "Installation de Brave Browser..."
sudo pacman -Sy brave-browser --noconfirm >/dev/null 2>&1
echo "Brave Browser installé."

# JetBrains Toolbox
JETBRAIN_SCRIPT="$SCRIPT_DIR/jetbrain_toolbox_installer.sh"
if [ -f "$JETBRAIN_SCRIPT" ]; then
    bash "$JETBRAIN_SCRIPT"
else
    echo "Erreur : Le script d'installation de JetBrains Toolbox est introuvable dans $JETBRAIN_SCRIPT."
    exit 1
fi

echo "Tous les logiciels ont été installés avec succès."

