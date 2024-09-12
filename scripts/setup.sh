#!/bin/bash

################### CONFIGURATION DES LIENS SYMBOLIQUES ########################
# Créer les symlinks pour VS Code
ln -sf ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

# Créer les symlinks pour .zshrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# Créer les symlinks pour .gitconfig
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
####################FIN DE CONFIGURATION DES LIENS SYMBOLIQUES#####################


################### CONFIGURATION DE iTerm2 ####################
# Chemin vers ton fichier de préférences iTerm2 dans le dépôt de dotfiles
PREFERENCES_FILE=~/dotfiles/iterm2/com.googlecode.iterm2.plist

# Vérifier si le fichier de préférences existe dans les dotfiles
if [ -f "$PREFERENCES_FILE" ]; then
    # Créer un lien symbolique pour que iTerm2 utilise ces préférences
    defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2/"
    defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
    echo "Préférences iTerm2 configurées avec succès."
else
    echo "Fichier de préférences iTerm2 introuvable. Assurez-vous qu'il est bien dans ~/dotfiles/iterm2"
fi
####################FIN DE CONFIGURATION DE iTerm2#####################

echo "Dotfiles setup completed!"
