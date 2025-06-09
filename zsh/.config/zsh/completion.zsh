#!/usr/bin/env zsh

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# Autocomplete via history with up/down arrow keys
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
