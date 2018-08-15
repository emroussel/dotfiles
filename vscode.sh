#!/bin/bash

# Make sure vscode is installed
if [ ! "$(which code)" ]; then
  echo -e "\nVisual Studio Code is not installed. Skipping."
  return
fi

# Get current dir (so run this script from anywhere)
DIR="$( cd "$(dirname "$0")" ; pwd -P )"

echo -e "\nSymlinking Visual Studio Code settings..."
ln -sf "$DIR/.vscode/settings.json" ~/Library/Application\ Support/Code/User/settings.json

declare -a EXTENSIONS=(
  Compulim.vscode-clock # Displays a clock in the status bar
  akamud.vscode-theme-onedark # One Dark Theme based on Atom
  dbaeumer.vscode-eslint # JavaScript linter
  esbenp.prettier-vscode # Code formatter
  glen-84.sass-lint # Sass Lint
  ionutvmi.path-autocomplete # Provides file path completion
  formulahendry.auto-close-tag  # Automatically add HTML/XML close tag
  formulahendry.auto-rename-tag  # Auto rename paired HTML/XML tag
  kumar-harsh.graphql-for-vscode # GraphQL syntax highlighting, linting, and auto-complete
  numso.prettier-standard-vscode # Prettier formatter with Standard rules
  octref.vetur # Vue tooling
  robinbentley.sass-indented # Sass syntax highlighting, auto-complete and snippets
  wayou.vscode-todo-highlight # Comment keyword highlighting
  rafamel.subtle-brackets # Better styling of matching bracket
)

echo -e "\nInstalling VSCode extensions..."
for extension in ${EXTENSIONS[@]}; do
  code --install-extension "$extension" || true
done
