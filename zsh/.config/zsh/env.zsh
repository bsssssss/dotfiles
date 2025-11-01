#!/usr/bin/env zsh

export XDG_CONFIG_HOME="$HOME/.config"

path=(
    "$HOME/.local/bin"
    "$HOME/.local/share/bss-arch/bin"
    $path
)

typeset -U path
export PATH

export VISUAL=nvim
export EDITOR=nvim
export MANPAGER="less -R --use-color -Dd+c-Du+4"
