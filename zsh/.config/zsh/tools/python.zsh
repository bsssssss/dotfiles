#!/usr/bin/env zsh

export PYENV_ROOT="$HOME/.pyenv"

pyenv() {
  unset -f pyenv python pip
  eval "$(command pyenv init --path)"
  eval "$(command pyenv init -)"
  eval "$(command pyenv virtualenv-init -)"
  export PYTHON=$(which python)
  pyenv "$@"
}

python() {
  unset -f pyenv python pip
  eval "$(command pyenv init --path)"
  eval "$(command pyenv init -)"
  eval "$(command pyenv virtualenv-init -)"
  export PYTHON=$(which python)
  python "$@"
}

pip() {
  unset -f pyenv python pip
  eval "$(command pyenv init --path)"
  eval "$(command pyenv init -)"
  eval "$(command pyenv virtualenv-init -)"
  export PYTHON=$(which python)
  pip "$@"
}
