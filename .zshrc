# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Configuration de nvim
export NVIM=~/.dotfiles


# Configuration de Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Configuration de flutter
export PATH=$HOME/development/flutter/bin:$PATH
export PATH=$HOME/.gem/bin:$PATH


# Thème
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(git
zsh-autosuggestions
zsh-syntax-highlighting
sudo
aliases
ant
tmux)

source $ZSH/oh-my-zsh.sh

# Alias
alias ll="ls -lah"
alias la="ls -A"
alias l="ls -CF"
#Keymap for autosuggestion
bindkey '  ' autosuggest-execute
bindkey '\t\t' autosuggest-accept
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
