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

# Vérifier si Notion est déjà installé
if brew list --cask | grep -q "notion"; then
  success "Notion est déjà installé."
else
  info "Installation de Notion..."

  # Installer Notion via Homebrew
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    brew install --cask notion
  else
    error "Installation non reussie. Ce script ne prend en charge que macOS."
    exit 1
  fi
fi
