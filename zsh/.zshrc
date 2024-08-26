# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# User defined scripts
export PATH=$PATH:~/Scripts:~/go/bin

export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export MANWIDTH=999

alias ls="lsd"
alias vim="nvim"
eval "$(zoxide init zsh)"

# opam configuration
[[ ! -r /Users/hyy/.opam/opam-init/init.zsh ]] || source /Users/hyy/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# zsh syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh vi mode
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# prompt
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

export PATH=$PATH:/Users/hyy/.spicetify

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# asdf
. "$HOME/.asdf/asdf.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
