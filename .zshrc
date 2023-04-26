# .:.
# zsh config

# Oh my Zsh
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  globalias
  docker
  docker-compose
  thefuck
  vi-mode
  fzf
)

source $ZSH/oh-my-zsh.sh

# Environment
export EDITOR=nvim
export PATH=$PATH:$HOME/.local/bin:$HOME/.config/seims/bin:$HOME/.local/share/gem/ruby/3.0.0/bin
export COMPOSE_HTTP_TIMEOUT=86400
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Aliases
alias g="git"
alias p="paru"
alias ls="exa"
alias dc="docker-compose"
alias n="nvim"
alias vim="nvim"
alias t="tmux"
alias ts="tmux new-session -t $(basename $(pwd))"

# Functions
rgl() {
  rg -p $@ | less
}

# Dotfiles
alias dt='/usr/bin/git --git-dir=$HOME/git/dotfiles --work-tree=$HOME'
export GLOBALIAS_FILTER_VALUES=(dt grep egrep diff ia iacli history)

# Starship prompt
eval "$(starship init zsh)"

# Remove folder
rm -rf $HOME/Downloads

# Additional environments
source $HOME/.zsh/work.sh
