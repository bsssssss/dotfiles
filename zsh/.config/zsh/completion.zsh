#!/usr/bin/env zsh

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:default' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=34:cd=34:su=30:sg=30:tw=30:ow=30'

autoload -Uz compinit && compinit

# Autocomplete via history with up/down arrow keys
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
