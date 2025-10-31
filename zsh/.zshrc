export ZSH_CONFIG_DIR="$HOME/.config/zsh"

source "$ZSH_CONFIG_DIR/colors.zsh" 
source "$ZSH_CONFIG_DIR/env.zsh"
source "$ZSH_CONFIG_DIR/alias.zsh"
source "$ZSH_CONFIG_DIR/plugins.zsh"
source "$ZSH_CONFIG_DIR/completion.zsh"
source "$ZSH_CONFIG_DIR/history/config.zsh"
source "$ZSH_CONFIG_DIR/prompt.zsh"
source "$ZSH_CONFIG_DIR/tools/config.zsh"
source "$ZSH_CONFIG_DIR/vi_mode.zsh"

if [ ! -S ~/.ssh/ssh_auth_sock ]; then
      eval `ssh-agent`
        ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

# syntax highlighting
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
