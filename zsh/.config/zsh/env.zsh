#!/usr/bin/env zsh

export XDG_CONFIG_HOME="$HOME/.config"

path=(
    "$HOME/.local/bin"
    # we set this in ~/.local/share/bss-arch/install.sh !
    # "$HOME/.local/share/bss-arch/bin"
    $path
)

typeset -U path
export PATH

export VISUAL=nvim
export EDITOR=nvim
export MANPAGER="less -R --use-color -DS232.2 -DP232.7"
export TERMINAL="ghostty"
