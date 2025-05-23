# enable default zsh completions
autoload -Uz compinit && compinit

# nvm
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Call `nvm use` automatically in a directory with a `.nvmrc` file
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Git autocompletion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.zsh
fpath=(~/.zsh $fpath)

# Local config
[[ -f ~/.zshrc.local ]] && source $HOME/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source $HOME/.aliases

export PATH="/usr/local/sbin:$PATH"

# keybindings
bindkey "^_" undo # cmd + z
bindkey "^X^_" redo # cmd + shift + z
bindkey "^A" beginning-of-line # cmd + ←
bindkey "^E" end-of-line # cmd + →
bindkey "^[b" backward-word # opt + ←
bindkey "^[f" forward-word # opt + →
bindkey "^U" backward-kill-line # cmd + backspace
bindkey "^[^H" backward-kill-word # opt + backspace
