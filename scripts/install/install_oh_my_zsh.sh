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

# Vérifier si Zsh est installé
if ! command -v zsh >/dev/null 2>&1; then
  error "Zsh n'est pas installé. Veuillez installer Zsh d'abord."
  exit 1
fi

# Vérifier si Oh My Zsh est déjà installé
if [ -d "$HOME/.oh-my-zsh" ]; then
  success "Oh My Zsh est déjà installé."
else
  info "Installation de Oh My Zsh..."

  # Télécharger et installer Oh My Zsh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # Vérifier si l'installation a réussi
  if [ -d "$HOME/.oh-my-zsh" ]; then
    success "Oh My Zsh a été installé avec succès."

    # Changer le shell par défaut en Zsh si ce n'est pas déjà fait
    if [ "$SHELL" != "$(which zsh)" ]; then
      info "Changement du shell par défaut vers Zsh..."
      chsh -s "$(which zsh)"
    fi
  else
    error "L'installation de Oh My Zsh a échoué."
    exit 1
  fi
fi
