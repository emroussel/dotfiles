# enable default zsh completions
autoload -Uz compinit && compinit

# nvm
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Git autocompletion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

# Local config
[[ -f ~/.zshrc.local ]] && source $HOME/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source $HOME/.aliases

# Krypton
export GPG_TTY=$(tty)

