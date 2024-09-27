# Ajouter des chemins de langages (Java, Python, Node.js)
export JAVA_HOME=/opt/homebrew/Cellar/openjdk/22.0.2
export PATH=$JAVA_HOME/bin:$PATH

# Tomcat configuration
export CATALINA_HOME=/opt/tomcat/apache-tomcat-10.1.28
export PATH=$CATALINA_HOME/bin:$PATH

# Python
export PATH="/usr/local/bin/python3:$PATH"

# Node.js via NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Activer NVM pour Node.js

# Configuration pour postgresql
export PATH="/opt/homebrew/Cellar/postgresql@16/16.4/bin:$PATH"

# Initialisation de Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="awesomepanda"  # Tu peux choisir un autre thème si tu le souhaites

# Plugins pour Oh My Zsh
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-completions sudo brew macos zsh-vi-mode vscode)


source $ZSH/oh-my-zsh.sh

# Options avancées du shell
autoload -Uz compinit && compinit  # Auto-complétion
setopt HIST_IGNORE_ALL_DUPS        # Ignorer les doublons dans l'historique
setopt SHARE_HISTORY               # Partager l'historique entre les sessions
export HISTFILE=~/.zsh_history     # Fichier de sauvegarde de l'historique
export HISTSIZE=10000              # Taille de l'historique
export SAVEHIST=10000              # Nombre de commandes sauvegardées dans l'historique

# Alias utiles
alias ll="ls -lah"          # Liste détaillée des fichiers, y compris les fichiers cachés
alias gs="git status"       # Afficher le statut Git
alias gc="git commit"       # Commit Git
alias gp="git push"         # Pousser les commits Git

# Activer Visual Studio Code depuis le terminal
alias code="open -a 'Visual Studio Code'"

# Fonctions pour naviguer rapidement dans les projets Java/Python
function cdjava() {
    cd ~/workspace/java-projects/$1
}

function cdpython() {
    cd ~/workspace/python-projects/$1
}

# Message pour indiquer que la configuration Zsh est appliquée avec succès
echo "Configuration Zsh chargée avec succès !"