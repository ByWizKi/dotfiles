#!/bin/bash

# Fonction pour afficher des messages en couleur
info() {
  echo -e "\033[1;34m$1\033[0m"
}

success() {
  echo -e "\033[1;32m$1\033[0m"
}

error() {
  echo -e "\033[1;31m$1\033[0m"
}

# Vérifier si le système est macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    error "Ce script est uniquement pour macOS."
    exit 1
fi

# Vérifier si Homebrew est installé
if ! command -v brew >/dev/null 2>&1; then
    error "Homebrew n'est pas installé. Veuillez l'installer avant de continuer."
    exit 1
fi

# Fonction pour installer Java
install_java() {
    info "Installation de Java (OpenJDK) via Homebrew..."
    brew install openjdk

    # Ajouter OpenJDK au PATH
    sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

    # Vérifier l'installation de Java
    if command -v java >/dev/null 2>&1; then
        success "Java a été installé avec succès."
    else
        error "L'installation de Java a échoué."
        exit 1
    fi
}

# Fonction pour installer Maven
install_maven() {
    info "Installation de Maven via Homebrew..."
    brew install maven

    # Vérifier l'installation de Maven
    if command -v mvn >/dev/null 2>&1; then
        success "Maven a été installé avec succès."
    else
        error "L'installation de Maven a échoué."
        exit 1
    fi
}

# Fonction pour installer Tomcat
install_tomcat() {
    info "Installation de Tomcat..."
    TOMCAT_VERSION="9.0.65"  # Version de Tomcat à installer (modifiable)

    # Télécharger Tomcat
    wget https://dlcdn.apache.org/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz -O tomcat.tar.gz

    # Extraire l'archive
    sudo mkdir -p /opt/tomcat
    sudo tar xzvf tomcat.tar.gz -C /opt/tomcat --strip-components=1
    sudo rm tomcat.tar.gz

    # Permissions
    sudo chmod +x /opt/tomcat/bin/*.sh

    success "Tomcat a été installé dans /opt/tomcat."
    info "Pour démarrer Tomcat : /opt/tomcat/bin/startup.sh"
}

# Installation de Java
install_java

# Installation de Maven
install_maven

# Demande d'installation de Tomcat
read -p "Souhaitez-vous installer Tomcat ? (y/n): " install_tomcat_response
if [[ "$install_tomcat_response" == "y" || "$install_tomcat_response" == "Y" ]]; then
    install_tomcat
else
    info "Installation de Tomcat annulée."
fi
