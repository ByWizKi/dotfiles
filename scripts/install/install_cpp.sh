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

# Vérifier si Xcode Command Line Tools sont installés
if ! xcode-select -p >/dev/null 2>&1; then
  info "Installation de Xcode Command Line Tools..."
  xcode-select --install

  # Attendre que les outils soient installés
  while ! xcode-select -p >/dev/null 2>&1; do
    sleep 5
  done

  success "Xcode Command Line Tools ont été installés avec succès."
else
  success "Xcode Command Line Tools sont déjà installés."
fi

# Installer GCC (g++)
if ! command -v g++ >/dev/null 2>&1; then
  info "Installation de GCC (g++) via Homebrew..."

  brew install gcc

  # Vérifier si l'installation a réussi
  if command -v g++ >/dev/null 2>&1; then
    success "GCC (g++) a été installé avec succès."
  else
    error "L'installation de GCC a échoué."
    exit 1
  fi
else
  success "GCC (g++) est déjà installé."
fi
