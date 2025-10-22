#!/usr/bin/env zsh

setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE="$ZSH_CONFIG_DIR/history/zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_EXPIRE_DUPS_FIRST
setopt hist_ignore_dups
setopt hist_verify
setopt EXTENDED_HISTORY
setopt always_to_end # When completing a word, move the cursor to the end of the word

# ???
COMPLETION_WAITING_DOTS="true"

