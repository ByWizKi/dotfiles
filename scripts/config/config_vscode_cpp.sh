#!/bin/bash

# Définir les chemins de configuration
VSCODE_DIR="${HOME}/.vscode"
DOTFILES_DIR="${HOME}/dotfiles/vscode/cpp"

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

# Vérifier que le dossier dotfiles existe, sinon le créer
if [ ! -d "$DOTFILES_DIR" ]; then
    info "Le dossier $DOTFILES_DIR n'existe pas. Création du répertoire..."
    mkdir -p "$DOTFILES_DIR"
    success "Le dossier $DOTFILES_DIR a été créé."
fi

# Créer le dossier .vscode s'il n'existe pas
if [ ! -d "$VSCODE_DIR" ]; then
    info "Création du dossier .vscode..."
    mkdir -p "$VSCODE_DIR"
    success "Le dossier .vscode a été créé."
fi

# Fonction pour créer un fichier de configuration par défaut s'il n'existe pas
create_default_file() {
    local file_path=$1
    local default_content=$2

    if [ ! -f "$file_path" ]; then
        info "Création du fichier par défaut $file_path..."
        echo "$default_content" > "$file_path"
        success "Le fichier $file_path a été créé."
    else
        success "Le fichier $file_path existe déjà."
    fi
}

# Fonction pour créer des liens symboliques
create_symlink() {
    local source_file=$1
    local target_file=$2

    if [ -L "$target_file" ]; then
        info "Le lien symbolique $target_file existe déjà. Suppression et recréation..."
        rm "$target_file"
    elif [ -f "$target_file" ]; then
        error "Le fichier $target_file existe déjà et n'est pas un lien symbolique. Suppression et recréation..."
        rm "$target_file"
    fi

    ln -s "$source_file" "$target_file"
    success "Lien symbolique créé pour $target_file."
}

# Contenu par défaut pour les fichiers de configuration
DEFAULT_TASKS_JSON='{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "build C++ file",
      "type": "shell",
      "command": "/opt/homebrew/bin/g++",
      "args": [
        "-g",
        "${file}",
        "-o",
        "${fileDirname}/${fileBasenameNoExtension}"
      ],
      "group": {
        "kind": "build",
        "isDefault": true
      },
      "problemMatcher": ["$gcc"],
      "detail": "Compiles the current C++ file using g++."
    }
  ]
}'

DEFAULT_LAUNCH_JSON='{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Debug C++ File",
      "type": "cppdbg",
      "request": "launch",
      "program": "${fileDirname}/${fileBasenameNoExtension}",
      "args": [],
      "stopAtEntry": false,
      "cwd": "${workspaceFolder}",
      "environment": [],
      "externalConsole": false,
      "MIMode": "lldb",
      "miDebuggerPath": "/usr/bin/lldb",
      "setupCommands": [
        {
          "description": "Enable pretty-printing for gdb",
          "text": "-enable-pretty-printing",
          "ignoreFailures": true
        }
      ],
      "preLaunchTask": "build C++ file",
      "internalConsoleOptions": "openOnSessionStart"
    }
  ]
}'

DEFAULT_CPP_PROPERTIES_JSON='{
  "configurations": [
    {
      "name": "Mac",
      "includePath": [
        "${workspaceFolder}/**",
        "/usr/local/include",
        "/opt/homebrew/include",
        "/Library/Developer/CommandLineTools/usr/include/c++/v1"
      ],
      "defines": [],
      "macFrameworkPath": [
        "/System/Library/Frameworks",
        "/Library/Frameworks"
      ],
      "compilerPath": "/opt/homebrew/bin/g++",
      "cStandard": "c11",
      "cppStandard": "c++17",
      "intelliSenseMode": "macos-clang-arm64"
    }
  ],
  "version": 4
}'

DEFAULT_SETTINGS_JSON='{
  "C_Cpp.errorSquiggles": "enabled",
  "C_Cpp.intelliSenseEngine": "default",
  "C_Cpp.default.cppStandard": "c++17",
  "C_Cpp.default.compilerPath": "/opt/homebrew/bin/g++",
  "C_Cpp.clang_format_fallbackStyle": "{ BasedOnStyle: Google, IndentWidth: 4 }",

  "files.associations": {
    "*.h": "cpp"
  },

  "cpp.lint.executable": "/opt/homebrew/bin/cpplint",
  "cpp.lint.run": "onType",
  "cpp.lint.language": ["cpp"],
  "code-runner.executorMap": {
    "cpp": "/opt/homebrew/bin/g++ -g ${file} -o ${fileDirname}/${fileBasenameNoExtension} && ${fileDirname}/${fileBasenameNoExtension}"
  }
}'

# Créer des fichiers de configuration par défaut dans le répertoire dotfiles
info "Création des fichiers de configuration par défaut si nécessaire..."

create_default_file "$DOTFILES_DIR/tasks.json" "$DEFAULT_TASKS_JSON"
create_default_file "$DOTFILES_DIR/launch.json" "$DEFAULT_LAUNCH_JSON"
create_default_file "$DOTFILES_DIR/c_cpp_properties.json" "$DEFAULT_CPP_PROPERTIES_JSON"
create_default_file "$DOTFILES_DIR/settings.json" "$DEFAULT_SETTINGS_JSON"

# Créer les liens symboliques pour les fichiers de configuration
info "Création des liens symboliques pour les fichiers de configuration C++..."

create_symlink "$DOTFILES_DIR/tasks.json" "$VSCODE_DIR/tasks.json"
create_symlink "$DOTFILES_DIR/launch.json" "$VSCODE_DIR/launch.json"
create_symlink "$DOTFILES_DIR/c_cpp_properties.json" "$VSCODE_DIR/c_cpp_properties.json"
create_symlink "$DOTFILES_DIR/settings.json" "$VSCODE_DIR/settings.json"

success "Configuration de VSCode pour C++ avec des liens symboliques terminée."
