# nvm
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Git branch autocompletion
source $HOME/.dotfiles/git/git-completion.sh

# Local config
[[ -f ~/.bashrc.local ]] && source $HOME/.bashrc.local

# aliases
[[ -f ~/.aliases ]] && source $HOME/.aliases
