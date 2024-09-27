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
  error "Ce script est conçu pour macOS uniquement."
  exit 1
fi

# Vérifier si Homebrew est installé
if ! command -v brew >/dev/null 2>&1; then
  error "Homebrew n'est pas installé. Veuillez installer Homebrew d'abord."
  exit 1
fi

# Vérifier si iTerm2 est déjà installé
if brew list --cask | grep -q "iterm2"; then
  success "iTerm2 est déjà installé."
else
  info "Installation de iTerm2..."

  # Installer iTerm2 via Homebrew
  brew install --cask iterm2

  # Vérifier si l'installation a réussi
  if brew list --cask | grep -q "iterm2"; then
    success "iTerm2 a été installé avec succès."
  else
    error "L'installation de iTerm2 a échoué."
    exit 1
  fi
fi
