
#!/bin/bash

#root obligatoire
if [ "$(id -u)" != "0" ]; then
   echo "Ce script doit être exécuté en tant que root" 1>&2
   exit 1
fi

echo "----------------------------------------------"
echo "               Manjaro Installer"
echo "----------------------------------------------"
echo ""
echo "Début de l'installation..."
echo ""


#-------------------------------UPDATE ALL-----------------------------------
echo "Update All"
sudo pacman -Sy > /dev/null 2>&1 --noconfirm





#mettre a jour le menu de login ssdm

#dl my package
#sudo git clone https://github.com/HunderJD/CRT-Amber-Theme-Linux.git ~/CRT-Amber-Theme-Linux

#--------------------------------------------GRUB THEME + UPDATE-----------------------------------------------------

# CRT-AMBER-THEME-GRUB
sudo rm -rf /boot/grub/themes/CRT-Amber-GRUB-Theme-master > /dev/null 2>&1
sudo cp -r ~/CRT-Amber-Theme-Linux/CRT-Amber-GRUB-Theme-master /boot/grub/themes/CRT-Amber-GRUB-Theme-master
sudo sed -i 's|^#\?GRUB_THEME=.*|GRUB_THEME="/boot/grub/themes/CRT-Amber-GRUB-Theme-master/theme.txt"|' /etc/default/grub
sudo update-grub > /dev/null 2>&1
echo "GRUB modifié"

# CRT-AMBER-THEME-PLYMOUTH
sudo pacman -Sy plymouth --noconfirm > /dev/null 2>&1
sudo cp -r ~/CRT-Amber-Theme-Linux/CRT-Amber-Plymouth-Theme /usr/share/plymouth/themes
sudo plymouth-set-default-theme CRT-Amber-Plymouth-Theme -R
sudo mkinitcpio -P
echo "Plymouth modifié"


#CRT-AMBER-THEME-SSDM
sudo pacman -Sy sddm --noconfirm > /dev/null 2>&1
sudo cp -r ~/CRT-Amber-Theme-Linux/simplicity /usr/share/sddm/themes/simplicity   #CRT-AMBER-THEME-SDDM
sudo rm -f /etc/sddm.conf
echo "[Theme]" | sudo tee /etc/sddm.conf
echo "Current=simplicity" | sudo tee -a /etc/sddm.conf
echo "sddm updated"




#--------------------------------TERMINAL-------------------------------------

sudo pacman -Sy kitty > /dev/null > 2>&1
echo "kitty installé"
sudo rm -rf .config/kitty/kitty.conf
sudo cp -r ~/CRT-Amber-Theme-Linux/kitty.conf ~/.config/kitty/kitty.conf


#--------------------------------ZSH-INSTALL----------------------------------


if command -v zsh &> /dev/null
then
   echo "Zsh est déjà installé."
else
   echo "installation de zsh"
   sudo pacman -Sy zsh > /dev/null > 2>&1
   chsh -s $(which zsh)
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

#remplacé le .zshrc par le miens(a mettre dans le git
sudo cp -r CRT-Amber-Theme-Linux/zshrc ~/.zshrc

#modifié la font : 
sudo cp refixedsys-mono.ttf ~/.local/share/fonts/
sudo fc-cache -f -v




#--------------------------------ALIAS----------------------------------

#add alias
echo "cl='clear'" >> ~/.zshrc
echo "alias getIp=\"grep -E -o '([0-9]{1,3}\.){3}[0-9]{1,3}'\"" >> ~/.zshrc
echo "alias getIPAwk='awk "/ for/ {print \$5, \$NF}"'" >> ~/.zshrc
echo "alias wireshark='sudo wireshark'" >> ~/.zshrc


#--------------------------------TOOLS----------------------------------
sudo pacman -Sy nmap > /dev/null 2>&1 --noconfirm
sudo pacman -Sy wireshark-qt > /dev/null 2>&1 --noconfirm
sudo pacman -Sy metasploit > /dev/null 2>&1 --noconfirm




#--------------------------------LOGICIEL----------------------------------
#discord
echo "Discord Installation"
sudo pacman -Sy discord > /dev/null 2>&1 --noconfirm

#firefox 
echo "Firefox Installation (pas implementé)


#wine
echo "Wine Installation"
sudo pacman -Syu wine > /dev/null 2>&1 --noconfirm

echo "VS Code Installation"
sudo snap install code --classic > /dev/null 2>&1 --noconfirm 


#--------------------------------REBOOT----------------------------------
echo "restart ? (y/n)"
read -rsn1 choice

if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
    echo "restart in progress..."
    sudo reboot
elif [ "$choice" = "n" ] || [ "$choice" = "N" ]; then
    echo "Restart later to apply updates."
else
    echo "Choix invalide. Veuillez saisir 'y' pour Oui ou 'n' pour Non."
fi
