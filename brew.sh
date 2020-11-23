#!/bin/bash

# Refresh existing sudo session or start a new one
sudo -v

# Check for Homebrew and install if we don't have it
which -s brew
if [[ $? != 0 ]]; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  # Update Homebrew recipes
  echo "Updating brew..."
  brew update
fi

# Upgrade any already-installed formulae
echo "Upgrading installed formulas..."
brew upgrade

# Make sure brew directories have the right ownership
sudo chown -R $(whoami) $(brew --prefix)/*

# Install all our dependencies with bundle (See Brewfile)
echo "Installing dependencies..."
brew tap homebrew/bundle
brew bundle

# Remove outdated versions from the cellar
brew cleanup

echo -e "\nRun the following command if you want to install the Xcode command line tools"
echo "xcode-select --install"
