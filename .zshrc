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
export PATH=$PATH:$HOME/.tmuxifier/bin
export COMPOSE_HTTP_TIMEOUT=86400
export LESS="-R"

# Aliases
alias g="git"
alias p="paru"
alias ls="exa"
alias dc="docker-compose"
alias n="nvim"
alias vim="nvim"

# Functions
rgl() {
  rg -p $@ | less
}

# Dotfiles
alias dt='/usr/bin/git --git-dir=$HOME/git/dotfiles --work-tree=$HOME'
export GLOBALIAS_FILTER_VALUES=(dt grep egrep diff ia iacli history)

# Starship prompt
eval "$(starship init zsh)"

# Tmuxifier
eval "$(tmuxifier init -)"

# Direnv
eval "$(direnv hook zsh)"

# Just
source <(just --completions bash)

# Remove folder
rm -rf $HOME/Downloads

# Additional environments
source $HOME/.zsh/work.sh
