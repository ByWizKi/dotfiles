#!/bin/bash

# Nom du service Automator
SERVICE_NAME="LaunchAppsService"

# Emplacement du script AppleScript (modifie ce chemin si nécessaire)
APP_PATH="$HOME/dotfiles/scripts/dev-window-layout.app"

# Vérifier si Automator est déjà configuré
if [ ! -e "$HOME/Library/Services/$SERVICE_NAME.workflow" ]; then
    echo "Création du service Automator pour associer un raccourci..."

    # Créer le répertoire Automator si nécessaire
    mkdir -p "$HOME/Library/Services"

    # Créer un fichier Automator pour exécuter l'application .app
    cat <<EOF > "$HOME/Library/Services/$SERVICE_NAME.workflow"
<?xml version="1.0" encoding="UTF-8"?>
<dict>
    <key>NSServicesDefinition</key>
    <dict>
        <key>ServiceInput</key>
        <string>none</string>
        <key>ServiceOutput</key>
        <string>none</string>
        <key>ApplicationBundleIdentifier</key>
        <string>com.apple.automator</string>
    </dict>
    <key>actions</key>
    <array>
        <dict>
            <key>AMActionID</key>
            <string>com.apple.cocoa.script.run.applescript</string>
            <key>action</key>
            <string>Run AppleScript</string>
            <key>isViewable</key>
            <true/>
            <key>viewable>in_workflow</key>
            <true/>
            <key>script</key>
            <string>tell application "$APP_PATH"
    activate
end tell</string>
        </dict>
    </array>
</dict>
EOF

    echo "Service créé dans Automator. Associez un raccourci dans les Préférences système."

else
    echo "Le service Automator existe déjà. Aucun changement nécessaire."
fi

# Message de fin
echo "Vous pouvez maintenant aller dans les Préférences Système > Clavier > Services et associer un raccourci au service 'LaunchAppsService'."
