# PATH
#
path=(
  $path
  $HOME/.cargo/bin
  $HOME/.pyenv/bin
  $PATH:./node_modules/.bin
)
typeset -U path
export PATH
fpath+=("$(brew --prefix)/share/zsh/site-functions")

# PLUGINS
#
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# AUTOCOMPLETION
#
# initialize autocompletion
autoload -U compinit
compinit

# history setup
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE="$HOME/.zsh_history"
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY


COMPLETION_WAITING_DOTS="true"

setopt always_to_end # When completing a word, move the cursor to the end of the word

# PROMPT
#
autoload -U promptinit; promptinit
prompt pure

set -o vi

# VARIABLES
#
export VISUAL=nvim
export EDITOR=nvim
export ANTHROPIC_API_KEY=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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Necessary to build JUCE projects
export JUCE_DIR="$HOME/Dev/frameworks/JUCE/install"
export JUCE_HOST="$HOME/git/JUCE/cmake-build/extras/AudioPluginHost/AudioPluginHost_artefacts/AudioPluginHost.app/Contents/MacOS/AudioPluginHost"

# PYTHON
#
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYTHON=$(which python)

# GHC
#
[ -f "/Users/bss/.ghcup/env" ] && . "/Users/bss/.ghcup/env" # ghcup-env. $HOME/.ghcup/env

# SOURCE
#
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ALIASES
#
alias vi=nvim
alias ls=lsd
alias ll="ls -la"
alias nv='NVIM_APPNAME=nvim_test nvim'

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
