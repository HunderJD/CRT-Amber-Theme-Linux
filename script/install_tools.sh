#--------------------------------TOOLS----------------------------------
echo "Installation des outils..."
sudo pacman -Sy nmap > /dev/null 2>&1 --noconfirm
sudo pacman -Sy wireshark-qt > /dev/null 2>&1 --noconfirm
sudo pacman -Sy metasploit > /dev/null 2>&1 --noconfirm
echo "Outils installés."

