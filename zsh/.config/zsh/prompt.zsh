#!/usr/bin/env zsh

eval "$(starship init zsh)"

bindkey -v
export KEYTIMEOUT=5

_fix_cursor() {
    echo -ne '\e[4 q' # static underline
}

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
      echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
      _fix_cursor
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    _fix_cursor
}
zle -N zle-line-init
precmd_functions+=(_fix_cursor)
