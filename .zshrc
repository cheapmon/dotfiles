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
)

source $ZSH/oh-my-zsh.sh

# Environment
export EDITOR=nvim
export PATH=$PATH:$HOME/.local/bin:$HOME/.config/seims/bin:$HOME/git/architecture/bin/ia
export FORCE_INIT=yes
export GITLAB_API_TOKEN=$(cat $HOME/.vault/api_token)

# Aliases
alias g="git"
alias p="paru"
alias ls="exa"
alias dc="docker-compose"

# Dotfiles
alias dt='/usr/bin/git --git-dir=$HOME/git/dotfiles --work-tree=$HOME'
export GLOBALIAS_FILTER_VALUES=(dt grep egrep diff)

# Completion
source <($HOME/git/architecture/bin/ia completion)
source <(kubectl completion zsh)
source <(minikube completion zsh)
source <(helm completion zsh)
