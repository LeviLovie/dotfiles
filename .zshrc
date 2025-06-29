if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
    macos
    dotenv
    git
    z
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source ~/powerlevel10k/powerlevel10k.zsh-theme
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias g="lazygit"
alias l="eza -lha"
alias vim="nvim"
alias c="cd -v"
alias rm="rm -v"
alias mv="mv -v"
alias cp="cp -v"
alias cr="cargo run"
alias xcc="cargo check"
alias cl="cargo clippy"
alias cf="cargo fmt"
alias cb="cargo build"
alias ch="cargo bench"
alias ct="cargo test"

function handle_fastfetch() {
  clear; fastfetch --config ~/.config/fastfetch/config.json
  zle reset-prompt
}
zle -N handle_fastfetch
bindkey '\e[999~' handle_fastfetch

bindkey "^[." insert-last-word

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
