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
export PATH=$PATH:$HOME/.local/bin:$HOME/.config/seims/bin:$HOME/git/architecture/bin/ia:$HOME/.cargo/bin:$HOME/.local/share/gem/ruby/3.0.0/bin
export FORCE_INIT=yes
export GITLAB_API_TOKEN=$(cat $HOME/.vault/api_token)
export COMPOSE_HTTP_TIMEOUT=86400

# Aliases
alias g="git"
alias p="paru"
alias k="kubectl"
alias ls="exa"
alias dc="docker-compose"

# Project aliases
source <(ls -d $HOME/git/architecture/apps/* | cut -d/ -f7 | xargs -I% echo "alias %=\"$HOME/git/architecture/apps/%\"")
prj() {
  app=$(ls -d $HOME/git/architecture/apps/* | cut -d/ -f7 | fzf)
  cd $HOME/git/architecture/apps/$app
}

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
  gopass show inaudito/infrastructure/kubernetes/hetzner/kubeconfig > /dev/shm/kubeconfig-hetzner
  export KUBECONFIG=/dev/shm/kubeconfig-staging:/dev/shm/kubeconfig-production:/dev/shm/kubeconfig-hetzner
}
kd() {
  export KUBECONFIG=
}
alias kx="kubectx"
alias kn="kubens"
alias k9="k9s --readonly"

# Starship prompt
eval "$(starship init zsh)"

# Remove folder
rm -rf $HOME/Downloads
