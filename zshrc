# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="xiong-chiamiov-plus"

plugins=( 
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux


#add alias
alias cl='clear'
alias getIp="grep -E -o '([0-9]{1,3}\.){3}[0-9]{1,3}'"
alias getIPAwk='awk / for/ {print $5, $NF}'
alias wireshark='sudo wireshark'


#-------------------------------------Modif------------------------------
clear
echo "Welcome To $(uname -a)"

# Configuration de l'invite de commande
PROMPT='%~ > '

# Effacer l'écran et centrer l'invite de commande
LINES=$(tput lines)

center_prompt() {
    local last_line=$((LINES - 1))
    tput cup $last_line 0
    echo -n "${PROMPT}"
}

precmd() {
    center_prompt
}

unsetopt PROMPT_SP


