#--------------------------------ALIAS----------------------------------
echo "cl='clear'" >> ~/.zshrc
echo "alias getIp=\"grep -E -o '([0-9]{1,3}\.){3}[0-9]{1,3}'\"" >> ~/.zshrc
echo "alias getIPAwk='awk "/ for/ {print \$5, \$NF}"'" >> ~/.zshrc
echo "alias wireshark='sudo wireshark'" >> ~/.zshrc

