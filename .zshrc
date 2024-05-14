# .:.
# zsh config

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

source $OH_MY_ZSH/oh-my-zsh.sh

# Environment
export EDITOR=nvim
export PATH=$PATH:$HOME/.tmuxifier/bin
export LESS="-R"

# Aliases
alias g="git"
alias e="exa"
alias dc="docker-compose"
alias n="nvim"
alias vim="nvim"
alias j="just"

# Functions
rgl() {
  rg -p $@ | less
}

# Dotfiles
alias dt='git --git-dir=$HOME/git/dotfiles --work-tree=$HOME'
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
