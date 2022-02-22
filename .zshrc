
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file

# Github Hub alias
# eval "$(hub alias -s)"

# Fuck
eval "$(thefuck --alias)"

# colorls
source $(dirname $(gem which colorls))/tab_complete.sh
alias l='colorls -A --sd'

# Git
alias pull='git pull origin $(git rev-parse --abbrev-ref HEAD)'
# if [ -f ~/.git-completion.bash ]; then
#   source ~/.git-completion.bash
# fi

# vercel -> now
alias now=vercel

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_VI_MODE_SHOW=false


# PATH
export PATH="$(npm bin -g):$PATH"
export NVM_DIR="/Users/djeglin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# HOMEBREW PYTHON
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# FLUTTER
export PATH="$PATH:/Users/djeglin/Projects/ext/flutter/bin"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


# NVM AUTOINIT ON .NVMRC
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# RUBY

eval "$(rbenv init -)"

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
