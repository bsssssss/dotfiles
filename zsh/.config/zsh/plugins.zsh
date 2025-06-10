#!/usr/bin/env zsh

# plugins=(
#   git
#   zsh-syntax-highlighting
#   zsh-autosuggestions
# )

ZVM_INIT_MODE=sourcing # Fix fzf-vi-mode overwrites 
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
ZVM_VI_HIGHLIGHT_BACKGROUND=#754545

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# bindkey '^@' forward-word # Accept auto-suggestion by word with ctrl-space

