#!/usr/bin/env zsh

export XDG_CONFIG_HOME="$HOME/.config"

export VISUAL=nvim
export EDITOR=nvim
# export MANPAGER="nvim +Man!"
export MANPAGER="less -R --use-color -Dd+c-Du+4"
# export MANPAGER="most"

export EMSDK_QUIET=1
export CMAKE_EXPORT_COMPILE_COMMANDS=1

export TIDAL_PATH="$HOME/dev/github.com/bsssssss/tidal/tidal-core/src/Sound/Tidal"

export JAVA_HOME=$(/usr/libexec/java_home)

export TOOLCHAIN_PATH=/Users/bss/dev/git/mutable-instruments/MI_FIRMWARE_COMPILING/ARM/
export STM32_PRG_PATH=/Applications/STMicroelectronics/STM32Cube/STM32CubeProgrammer/STM32CubeProgrammer.app/Contents/MacOs/bin

path=(
  $HOME/.cargo/bin
  $HOME/.pyenv/bin
  $HOME/.local/bin
  $PATH:./node_modules/.bin
  $HOME/.pyenv/shims/python3
  $HOME/dev/git/emsdk
  $HOME/dev/git/emsdk/upstream/emscripten
  $HOME/scripts
  $path
)

typeset -U path
export PATH

fpath+=("$(brew --prefix)/share/zsh/site-functions")
