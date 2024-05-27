# Instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Setup plugin manager
ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Install prompt
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Snippets
zinit snippet OMZP::globalias

# Completions
autoload -U compinit && compinit
autoload -U +X bashcompinit && bashcompinit
zinit cdreplay -q

# Setup prompt
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# History
HISTSIZE=10000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" menu no
zstyle ":fzf-tab:complete:cd:*" fzf-preview 'exa $realpath'

# Keybindings
bindkey -e

# Environment
export PATH="$PATH:$HOME/.tmuxifier/bin"
export LESS="-R"
export GLOBALIAS_FILTER_VALUES=(d ls ia iacli)
export DIRENV_LOG_FORMAT=

# Aliases
alias d='git --git-dir=$HOME/git/dotfiles --work-tree=$HOME'
alias ls="exa --color"
alias g="git"
alias dc="docker-compose"
alias n="nvim"
alias j="just"

# Functions
rgl() {
  rg -p $@ | less
}

# Shell integrations
eval "$(fzf --zsh)"
eval "$(thefuck --alias)"
eval "$(tmuxifier init -)"
eval "$(direnv hook zsh)"
source <(just --completions bash)

# Remove folder
rm -rf "$HOME/Downloads"

# Extra source files
for FILE in $HOME/.zsh/*.sh; do source $FILE; done
