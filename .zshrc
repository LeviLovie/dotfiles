ZINIT_HOME="${HOME}/.config/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone git@github.com:zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Install ZSH plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Config
HISTFILE="${HOME}/.cache/.zsh_history"
SAVEHIST=10000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu on
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -a $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -a $realpath'

# Custom Ctrl+K handler
function handle_clear() {
  clear;
  zle reset-prompt
}
zle -N handle_clear
bindkey '\e[999~' handle_clear

# Aliases
alias l='eza -lh'
alias ll='eza -lha'
alias lg='lazygit'

# Apply some plugins
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
