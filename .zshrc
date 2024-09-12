# Ajouter des chemins de langages (Java, Python, Node.js)
export JAVA_HOME=/opt/homebrew/Cellar/openjdk/22.0.2
export PATH=$JAVA_HOME/bin:$PATH
export CATALINA_HOME=/opt/tomcat/apache-tomcat-10.1.28 
export PATH=$CATALINA_HOME/bin:$PATH
export PATH="/usr/local/bin/python3:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Activer NVM pour Node.js

# Alias utiles
alias ll="ls -lah"
alias gs="git status"
alias gc="git commit"
alias gp="git push"

# Activer VS Code depuis le terminal
alias code="open -a 'Visual Studio Code'"

# Source les autres configurations de dotfiles si nécessaire
#source ~/dotfiles/vscode/settings.json

# Fonction pour changer rapidement de projet Java
function cdjava() {
    cd ~/workspace/java-projects/$1
}

# Fonction pour changer rapidement de projet Python
function cdpython() {
    cd ~/workspace/python-projects/$1
}

