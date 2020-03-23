# nvm
export NVM_DIR="$HOME/.nvm"
[[ -f ~/.nvm/nvm.sh ]] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Git branch autocompletion
source $HOME/.dotfiles/git/git-completion.bash

# Local config
[[ -f ~/.bashrc.local ]] && source $HOME/.bashrc.local

# aliases
[[ -f ~/.aliases ]] && source $HOME/.aliases

# Krypton
export GPG_TTY=$(tty)

