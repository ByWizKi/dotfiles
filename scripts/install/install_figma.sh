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

# Vérifier si Homebrew est installé
if ! command -v brew >/dev/null 2>&1; then
  error "Homebrew n'est pas installé. Veuillez installer Homebrew d'abord."
  exit 1
fi

# Vérifier si le système est macOS ou Linux
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS

  # Vérifier si Figma est déjà installé
  if brew list --cask | grep -q "figma"; then
    success "Figma est déjà installé."
  else
    info "Installation de Figma pour macOS..."

    # Installer Figma via Homebrew
    brew install --cask figma

    # Vérifier si l'installation a réussi
    if brew list --cask | grep -q "figma"; then
      success "Figma a été installé avec succès."
    else
      error "L'installation de Figma a échoué."
      exit 1
    fi
  fi
fi
