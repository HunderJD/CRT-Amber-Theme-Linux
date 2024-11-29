#!/bin/bash

# Vérification : script doit être exécuté en tant que root
if [ "$(id -u)" != "0" ]; then
   echo "Ce script doit être exécuté en tant que root." >&2
   exit 1
fi

echo "----------------------------------------------"
echo "               Manjaro Installer"
echo "----------------------------------------------"
echo ""
echo "Début de l'installation..."
echo ""

# Définir le chemin vers le dossier contenant les scripts
SCRIPT_DIR="./script"

# Vérifier si le dossier de scripts existe
if [ ! -d "$SCRIPT_DIR" ]; then
    echo "Erreur : Le dossier de scripts ($SCRIPT_DIR) est introuvable." >&2
    exit 1
fi

# ------------------------- 1. Mise à jour du système -------------------------
echo "Mise à jour du système..."
bash "$SCRIPT_DIR/update_all.sh"

# ------------------------- 2. Configuration de GRUB -------------------------
echo "Configuration de GRUB..."
bash "$SCRIPT_DIR/update_grub.sh"

# ------------------------- 3. Configuration de SDDM -------------------------
#echo "Configuration de SDDM..."
#bash "$SCRIPT_DIR/configure_sddm.sh"

# ------------------------- 4. Configuration de Plymouth -------------------------
echo "Configuration de Plymouth..."
bash "$SCRIPT_DIR/configure_plymouth.sh"

# ------------------------- 5. Installation et configuration de Kitty -------------------------
#echo "Configuration de Kitty..."
#bash "$SCRIPT_DIR/configure_kitty.sh"

# ------------------------- 6. Installation et configuration de ZSH -------------------------
#echo "Configuration de ZSH..."
#bash "$SCRIPT_DIR/configure_zsh.sh"

# ------------------------- 7. Installation des outils -------------------------
#echo "Installation des outils..."
#bash "$SCRIPT_DIR/install_tools.sh"

# ------------------------- 8. Installation des logiciels -------------------------
#echo "Installation des logiciels..."
#bash "$SCRIPT_DIR/install_logiciel.sh"

# ------------------------- 9. Installation d'Hyprland -------------------------
#echo "Voulez-vous installer Hyprland ? (y/n)"
#read -rsn1 choice
#if [[ "$choice" =~ ^[yY]$ ]]; then
#    echo "Installation de Hyprland..."
#    bash "$SCRIPT_DIR/install_hyprland.sh"
#elif [[ "$choice" =~ ^[nN]$ ]]; then
#    echo "Installation de Hyprland annulée."
#else
#    echo "Choix invalide. Veuillez saisir 'y' pour Oui ou 'n' pour Non."
#    exit 1
#fi

echo "Installation terminée !"
bash reboot
