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

# Vérifier si Homebrew est installé sur macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  if ! command -v brew >/dev/null 2>&1; then
    error "Homebrew n'est pas installé. Veuillez installer Homebrew d'abord."
    exit 1
  fi
fi

# Installer WhatsApp selon le système d'exploitation
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS

  # Vérifier si WhatsApp est déjà installé
  if brew list --cask | grep -q "whatsapp"; then
    success "WhatsApp est déjà installé."
  else
    info "Installation de WhatsApp pour macOS..."

    # Installer WhatsApp via Homebrew
    brew install --cask whatsapp

    # Vérifier si l'installation a réussi
    if brew list --cask | grep -q "whatsapp"; then
      success "WhatsApp a été installé avec succès."
    else
      error "L'installation de WhatsApp a échoué."
      exit 1
    fi
  fi
fi