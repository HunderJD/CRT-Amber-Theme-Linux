#!/bin/bash

# Définir le chemin du projet à partir du script courant
PROJECT_DIR=$(dirname "$(realpath "$0")")/..

echo "Installation et configuration de ZSH..."

# Installer ZSH si nécessaire
if ! command -v zsh &>/dev/null; then
    sudo pacman -Sy zsh --noconfirm >/dev/null 2>&1
    chsh -s "$(which zsh)"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Configurer ZSH
ZSHRC_PATH="$PROJECT_DIR/zshrc"
if [ -f "$ZSHRC_PATH" ]; then
    cp "$ZSHRC_PATH" ~/.zshrc
    echo "Fichier .zshrc configuré."
else
    echo "Erreur : Fichier zshrc introuvable dans $ZSHRC_PATH."
    exit 1
fi

# Installer la police refixedsys-mono
FONT_PATH="$PROJECT_DIR/refixedsys-mono.ttf"
if [ -f "$FONT_PATH" ]; then
    cp "$FONT_PATH" ~/.local/share/fonts/
    sudo fc-cache -f -v >/dev/null 2>&1
    echo "Police installée."
else
    echo "Erreur : Fichier de police introuvable dans $FONT_PATH."
    exit 1
fi

