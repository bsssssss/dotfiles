# PATH
#
path=(
  $HOME/.cargo/bin
  $HOME/.pyenv/bin
  $HOME/.local/bin
  $PATH:./node_modules/.bin
  $path
)
typeset -U path
export PATH
fpath+=("$(brew --prefix)/share/zsh/site-functions")

export TIDAL_PATH="$HOME/Code/projects/tidal/src/Sound/Tidal"

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
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# history setup
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE="$HOME/.zsh_history"
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
setopt hist_ignore_dups
setopt hist_verify
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
alias viconf="cd ~/.dotfiles/nvim/.config/nvim/"

alias ls=lsd
alias ll="ls -la"

alias cervo="cd ~/Dropbox/obsidian/cerveau2.1"

alias kittyconf="cd ~/.dotfiles/kitty/.config/kitty"

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# FZF
source <(fzf --zsh)

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

source ~/Code/git/fzf-git.sh/fzf-git.sh 

# BAT

export BAT_THEME="Visual Studio Dark+"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
