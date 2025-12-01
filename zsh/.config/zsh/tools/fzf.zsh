#!/usr/bin/env zsh

source <(fzf --zsh)

export FZF_DEFAULT_OPTS="
    --height=~10%
    --layout reverse
    --style=minimal
    --color=bg+:-1,fg:0,fg+:7,header:0,spinner:magenta,border:0
    --gutter ' '
    --pointer ' '
    --prompt ' '
    --no-info"

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
        FZF_DEFAULT_OPTS=" $FZF_DEFAULT_OPTS --scheme=history --bind=ctrl-r:toggle-sort" fzf); then
        BUFFER=$(echo "$selected" | sed 's/^[0-9 ]*\*\{0,1\}[[:space:]]*//')
        CURSOR=$#BUFFER
    fi
    zle reset-prompt
}

zle -N fzf-history-widget-custom
bindkey '^R' fzf-history-widget-custom
