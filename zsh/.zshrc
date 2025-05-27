# PATH
#
path=(
  $HOME/.cargo/bin
  $HOME/.pyenv/bin
  $HOME/.local/bin
  $PATH:./node_modules/.bin
  $HOME/.pyenv/shims/python3
  $HOME/dev/git/emsdk
  $HOME/dev/git/emsdk/upstream/emscripten
  $path
)
typeset -U path
export PATH
export XDG_CONFIG_HOME="$HOME/.config"
fpath+=("$(brew --prefix)/share/zsh/site-functions")
export EMSDK_QUIET=1
export CMAKE_EXPORT_COMPILE_COMMANDS=1

export TIDAL_PATH="$HOME/dev/github.com/bsssssss/tidal/src/Sound/Tidal"
export JAVA_HOME=$(/usr/libexec/java_home)
export TOOLCHAIN_PATH=/Users/bss/dev/git/mutable-instruments/MI_FIRMWARE_COMPILING/ARM/
export MANPAGER="nvim +Man!"

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
[ -f "/Users/bss/.ghcup/env" ] && . "/Users/bss/.ghcup/env" # ghcup-env. $HOME/.ghcup/env

# SOURCE
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ALIASES
alias vi=nvim
alias viconf="cd ~/.dotfiles/nvim/.config/nvim/"
# alias ls=lsd
alias ll="lsd -la"
alias notes="cd ~/Vaults/Personal/1\ -\ Notes/"
alias kittyconf="cd ~/.dotfiles/kitty/.config/kitty"
alias vpdf='zathura "$@" & disown'
alias tree='tree -C'

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# FZF
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--height 10% --layout default --color=bg+:#343B4C,gutter:-1,pointer:-1,info:#c4a7e7,spinner:#c4a7e7,fg:#677598'
# export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_COMMAND="fd --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

fzf-history-widget-custom() {
    local selected
    if selected=$(fc -rl 1 | awk '{ cmd=$0; sub(/^[ \t]*[0-9]+\**[ \t]+/, "", cmd); if (!seen[cmd]++) print $0 }' |
        FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-r:toggle-sort $FZF_DEFAULT_OPTS" fzf); then
        BUFFER=$(echo "$selected" | sed 's/^[0-9 ]*\*\{0,1\}[[:space:]]*//')
        CURSOR=$#BUFFER
        zle reset-prompt
    fi
}

zle -N fzf-history-widget-custom
bindkey '^R' fzf-history-widget-custom

source ~/dev/git/fzf-git.sh/fzf-git.sh 

# ZOXIDE
eval "$(zoxide init zsh)"

# BAT
export BAT_THEME="Visual Studio Dark+"

# POMODORO
tea() {
  timer "${1:-3m}" && terminal-notifier -message 'Chronos'\
    -title 'Le thé !'\
    -appIcon '/Users/bss/Pictures/tea-cup.png'
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export STM32_PRG_PATH=/Applications/STMicroelectronics/STM32Cube/STM32CubeProgrammer/STM32CubeProgrammer.app/Contents/MacOs/bin
