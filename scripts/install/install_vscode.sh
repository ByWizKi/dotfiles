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

# Vérifier si VSCode est déjà installé
if brew list --cask | grep -q "visual-studio-code"; then
  success "Visual Studio Code est déjà installé."
else
  info "Installation de Visual Studio Code..."

  # Installer VSCode via Homebrew
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    brew install --cask visual-studio-code
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    brew install --cask visual-studio-code
  else
    error "Ce script ne prend en charge que macOS et Linux."
    exit 1
  fi

  # Vérifier si l'installation a réussi
  if brew list --cask | grep -q "visual-studio-code"; then
    success "Visual Studio Code a été installé avec succès."
  else
    error "L'installation de Visual Studio Code a échoué."
    exit 1
  fi
fi
