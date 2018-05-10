# Dotfiles
My dotfiles for macOS.

## Files
### `brew.sh`
Installs brew if not already installed, updates packages, and installs the packages in `Brewfile`.

### `setup.sh`
Symlinks all files and makes a back up of previous ones.

### `macos.sh`
Sets up macOS settings.

### `vscode.sh`
Symlinks vscode settings, and installs extensions.

## iTerm2
Settings and key mappings saved in `iterm2/com.googlecode.iterm2.plist`.

To use them, open iTerm2 preferences, and under general at the bottom, select "Load preferences from a custom folder or url" and select the `iterm2` folder in this repo. Also check "Save changes to folder when iTerm2 quits"

TODO: Automate this process.
