#!/bin/bash

# Make sure vscode is installed
if [ ! "$(which code)" ]; then
  echo -e "\nVisual Studio Code is not installed. Skipping."
  return
fi

# Get current dir (so run this script from anywhere)
DIR="$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")"

echo -e "\nSymlinking Visual Studio Code settings..."
ln -sf "$DIR/.vscode/settings.json" ~/Library/Application\ Support/Code/User/settings.json

declare -a EXTENSIONS=(
  Compulim.vscode-clock # Displays a clock in the status bar
  emroussel.atomize-atom-one-dark-theme # One Dark Theme based on Atom
  emroussel.atom-icons # Atom icons theme
  dbaeumer.vscode-eslint # Eslint
  esbenp.prettier-vscode # Code formatter
  ionutvmi.path-autocomplete # Provides file path completion
  kumar-harsh.graphql-for-vscode # GraphQL syntax highlighting, linting, and auto-complete
  wayou.vscode-todo-highlight # Comment keyword highlighting
  rafamel.subtle-brackets # Better styling of matching bracket
  bungcip.better-toml # TOML language support
  bradlc.vscode-tailwindcss # Tailwind CSS IntelliSense
  ms-python.python # Python support
)

echo -e "\nInstalling VSCode extensions..."
for extension in ${EXTENSIONS[@]}; do
  code --install-extension "$extension" || true
done
