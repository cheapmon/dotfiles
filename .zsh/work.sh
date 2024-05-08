# Work
if [ "$WORK" = "yes" ]; then
  # Environment
  export PATH=$PATH:$HOME/git/architecture/bin/ia
  export FORCE_INIT=yes
  export GITLAB_API_TOKEN=$(cat $HOME/.vault/api_token)
  export DIGITALOCEAN_TOKEN=$(cat $HOME/.vault/digitalocean_token)
  export RAILS_MASTER_KEY=`gopass show inaudito/kubernetes-apps/inaudito/core/values-core-production.yaml | yq -r '.rails.master_key'`
  export XING_CONSUMER_KEY=`gopass show inaudito/kubernetes-apps/inaudito/core/values-core-production.yaml | yq -r '.xing.consumer_key'`
  export XING_CONSUMER_SECRET=`gopass show inaudito/kubernetes-apps/inaudito/core/values-core-production.yaml | yq -r '.xing.consumer_secret'`
  export IA_PASSWORDSTORE_MOUNT="inaudito"

  # Aliases
  alias k="kubectl"

  # Project aliases
  source <(/usr/bin/ls -d $HOME/git/architecture/apps/* | xargs -I% basename % | xargs -I% echo "alias %=\"$HOME/git/architecture/apps/%\"")
  prj() {
    app="$(/usr/bin/ls -d $HOME/git/architecture/apps/* | xargs -I% basename % | fzf-tmux)"
    dir="$HOME/git/architecture/apps/$app"

    if tmuxifier list-sessions | rg -q $app; then
      tmuxifier load-session $app
    else
      tmux new -Ads "$app" -c "$dir"
      tmux switch -t "$app"
    fi
  }
  alias ia="$HOME/git/architecture/bin/ia"
  alias iacli="$HOME/git/architecture/apps/cli/iacli"

  # Completion
  source <($HOME/git/architecture/bin/ia completion)
  source <(kubectl completion zsh)
  source <(minikube completion zsh)
  source <(helm completion zsh)
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C /usr/bin/terraform terraform

  # kubectl
  kc() {
    ctx=$(echo "staging\nproduction" | fzf-tmux)
    gopass show -n inaudito/infrastructure/kubernetes/$ctx/kubeconfig > /dev/shm/kubeconfig
    chmod 0600 /dev/shm/kubeconfig
    export KUBECONFIG=/dev/shm/kubeconfig
  }
  kd() {
    export KUBECONFIG=
  }
  alias kx="kubectx"
  alias kn="kubens"
  alias k9="k9s --readonly"

  # Ansible
  setup_ansible() {
    export ANSIBLE_FORCE_COLOR="True"
    export ANSIBLE_NOCOWS=1
    export ANSIBLE_INVENTORY="inventory.ini"
    export ANSIBLE_VAULT_PASSWORD_FILE="/dev/shm/ansible-vault-password.txt"
    export ANSIBLE_PRIVATE_KEY_FILE="/dev/shm/ansible-private-key-file.txt"
    export ANSIBLE_REMOTE_USER="root"

    gopass show -n inaudito/infrastructure/ansible-vault-password > $ANSIBLE_VAULT_PASSWORD_FILE
    gopass show -n inaudito/infrastructure/office-ci-runner/ssh-key | base64 -di - | tr -d '\r' > $ANSIBLE_PRIVATE_KEY_FILE
    chmod 600 $ANSIBLE_PRIVATE_KEY_FILE
  }
  alias ab="setup_ansible"

  # rbenv
  if [ -d "$HOME/.rbenv" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
  fi

  # nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi
