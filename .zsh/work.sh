# Work
if [ "$WORK" = "yes" ]; then
  # Environment
  export FORCE_INIT=yes
  SECRETS="/run/user/$(id -u)/secrets"
  export GITLAB_API_TOKEN=$(cat $SECRETS/api_token)
  export DIGITALOCEAN_TOKEN=$(cat $SECRETS/digitalocean_token)
  export ANTHROPIC_API_KEY=$(cat $SECRETS/anthropic_api_key)
  export IA_PASSWORDSTORE_MOUNT="inaudito"
  export CORE_SERVICE="core-native"

  # Project aliases
  source <(ls -d $HOME/git/architecture/apps/* | xargs -I% basename % | xargs -I% echo "alias %=\"cd $HOME/git/architecture/apps/%\"")
  alias prj="open-project"
  alias ia="$HOME/git/architecture/bin/ia"
  alias iacli="$HOME/git/architecture/apps/cli/iacli"

  # Completion
  source <($HOME/git/architecture/bin/ia completion)
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C terraform terraform
  source <(acli completion zsh)

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

  openspec() {
    npx @fission-ai/openspec@latest -- "$@"
  }
fi
