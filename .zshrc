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
export PATH=$PATH:$HOME/.local/bin:$HOME/.config/seims/bin:$HOME/git/architecture/bin/ia:$HOME/.cargo/bin:$HOME/.local/share/gem/ruby/3.0.0/bin
export FORCE_INIT=yes
export GITLAB_API_TOKEN=$(cat $HOME/.vault/api_token)

# Aliases
alias g="git"
alias p="paru"
alias k="kubectl"
alias ls="exa"
alias dc="docker compose"

# Project aliases
alias architecture="$HOME/git/architecture"
alias configurator="$HOME/git/architecture/apps/configurator"
alias cli="$HOME/git/architecture/apps/cli"
alias core="$HOME/git/architecture/apps/core"
alias dumper="$HOME/git/architecture/apps/dumper"
alias infrastructure="$HOME/git/architecture/apps/infrastructure"
alias jobcrawler="$HOME/git/architecture/apps/jobcrawler"
alias jobmixer="$HOME/git/architecture/apps/jobmixer"
alias jobmixer-legacy="$HOME/git/architecture/apps/jobmixer-legacy"
alias jobwindow="$HOME/git/architecture/apps/jobwindow"
alias keywords="$HOME/git/architecture/apps/keywords"
alias notes="$HOME/git/architecture/apps/notes"
alias odoo="$HOME/git/architecture/apps/odoo"
alias odoo-ee="$HOME/git/architecture/apps/odoo-ee"
alias schnellestelle2017="$HOME/git/architecture/apps/schnellestelle2017"
alias whitelabel="$HOME/git/architecture/apps/whitelabel"

# Dotfiles
alias dt='/usr/bin/git --git-dir=$HOME/git/dotfiles --work-tree=$HOME'
export GLOBALIAS_FILTER_VALUES=(dt grep egrep diff ia history)

# Completion
source <($HOME/git/architecture/bin/ia completion)
source <(kubectl completion zsh)
source <(minikube completion zsh)
source <(helm completion zsh)
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# kubectl
kc() {
  gopass show inaudito/infrastructure/kubernetes/staging/kubeconfig > /dev/shm/kubeconfig-staging
  gopass show inaudito/infrastructure/kubernetes/production/kubeconfig > /dev/shm/kubeconfig-production
  export KUBECONFIG=/dev/shm/kubeconfig-staging:/dev/shm/kubeconfig-production
}
kd() {
  export KUBECONFIG=
}
alias kx="kubectx"
alias kn="kubens"

# Starship prompt
eval "$(starship init zsh)"

# Remove folder
rm -rf $HOME/Downloads
