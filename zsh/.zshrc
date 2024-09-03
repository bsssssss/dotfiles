# ---------------- PATH ----------------

path=(
  $path
  $HOME/.cargo/bin
  $HOME/.pyenv/bin
)

typeset -U path
export PATH

fpath+=("$(brew --prefix)/share/zsh/site-functions")

# ---------------- CONF ----------------

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

COMPLETION_WAITING_DOTS="true"

autoload -U promptinit; promptinit
prompt pure

# ---------------- ENV VARS ----------------

set -o vi

export VISUAL=nvim
export EDITOR=nvim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Necessary to build JUCE projects
export JUCE_DIR="$HOME/Dev/frameworks/JUCE/install"
export JUCE_HOST="$HOME/git/JUCE/cmake-build/extras/AudioPluginHost/AudioPluginHost_artefacts/AudioPluginHost.app/Contents/MacOS/AudioPluginHost"

# Set Options
setopt always_to_end # When completing a word, move the cursor to the end of the word
setopt share_history          # share history between different instances of the shell
HISTFILE=${HOME}/.zsh_history
HISTSIZE=100000
SAVEHIST=${HISTSIZE}

# ---------------- PYTHON VENV ----------------

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ---------------- GHCUP ----------------

[ -f "/Users/bss/.ghcup/env" ] && . "/Users/bss/.ghcup/env" # ghcup-env. $HOME/.ghcup/env

# ---------------- SOURCING ----------------

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ---------------- ALIASES ----------------

alias vi=nvim
