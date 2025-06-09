#!/usr/bin/env zsh

# plugins=(
#   git
#   zsh-syntax-highlighting
#   zsh-autosuggestions
# )

ZVM_INIT_MODE=sourcing # Fix fzf-vi-mode overwrites 
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^@' forward-word # Accept auto-suggestion by word with ctrl-space

