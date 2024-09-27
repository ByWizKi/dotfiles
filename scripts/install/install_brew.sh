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

# Vérifier si Brew est déjà installé
if command -v brew >/dev/null 2>&1; then
  success "Homebrew est déjà installé."
else
  info "Installation de Homebrew..."

  # Télécharger et installer Homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Vérifier si l'installation a réussi
  if command -v brew >/dev/null 2>&1; then
    success "Homebrew a été installé avec succès."

    # Ajouter Brew au PATH pour macOS (si nécessaire)
    if [[ "$OSTYPE" == "darwin"* ]]; then
      if ! grep -q 'eval "$(/opt/homebrew/bin/brew shellenv)"' ~/.zprofile; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi
    fi
  else
    error "L'installation de Homebrew a échoué."
    exit 1
  fi
fi
