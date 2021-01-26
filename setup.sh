#!/bin/bash

# Get current dir (so run this script from anywhere)
export DIR="$( cd "$(dirname "$0")" ; pwd -P )"

DIR_BACKUP=~/.dotfiles_old

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `setup.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Create dotfiles_old in homedir
echo -n "Creating $DIR_BACKUP for backup of any existing dotfiles in ~..."
mkdir -p $DIR_BACKUP
echo "done"

# Change to the dotfiles directory
echo -n "Go to the $DIR directory..."
cd $DIR
echo "done"

# Warn user this script will overwrite current dotfiles
while true; do
  echo "Warning: this will overwrite your current dotfiles. Continue? [y/n] "
  read yn
  case $yn in
    [Yy]* ) break;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes or no.";;
  esac
done

declare -a FILES_TO_SYMLINK=(
  '.agignore'
  '.aliases'
  '.bashrc'
  '.bash_profile'
  '.gitconfig'
  '.zshrc'
)

# Move any existing dotfiles in homedir to .dotfiles_old directory, then create
# symlinks from the homedir to any files in the ~/.dotfiles directory specified in $files

echo "Moving any existing dotfiles from ~ to $DIR_BACKUP"
mkdir -p $DIR_BACKUP/.nvm
mv ~/.nvm/default-packages $DIR_BACKUP/.nvm
for i in ${FILES_TO_SYMLINK[@]}; do
  mv ~/${i##*/} $DIR_BACKUP/
done
echo "done"

echo "Symlinking dotfiles to the home directory"
mkdir -p ~/.nvm
mkdir -p ~/.zsh
ln -sf $DIR/.nvm/default-packages ~/.nvm/default-packages
ln -sf $DIR/git/git-completion.bash ~/.zsh/git-completion.bash
ln -sf $DIR/git/git-comopletion.zsh ~/.zsh/git-comopletion.zsh
for i in ${FILES_TO_SYMLINK[@]}; do
  ln -sf "$DIR/$i" ~
done
echo "done"

# If we are on Mac
if [[ "$(uname)" == "Darwin" ]]; then
  . "$DIR/brew.sh"
  . "$DIR/macos.sh"
fi

. "$DIR/vscode.sh"
