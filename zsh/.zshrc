# User defined scripts
export PATH=$PATH:~/Scripts:~/go/bin

export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export MANWIDTH=999

alias ls="eza"
alias vim="nvim"
eval "$(zoxide init zsh)"

# zsh syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh vi mode
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Retro-style prompt configuration
PROMPT='%m:%~ $ '
