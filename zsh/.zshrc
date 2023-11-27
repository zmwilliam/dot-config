# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"

plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "jeffreytse/zsh-vi-mode"
plug "agkozak/zsh-z"
plug "$HOME/.config/zsh/startship.zsh"

function zvm_after_init(){
  plug "zap-zsh/fzf"
  plug "olets/zsh-abbr"
}

# Load and initialise completion system
autoload -Uz compinit
compinit

if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

if command -v asdf &> /dev/null; then
  . /usr/local/opt/asdf/libexec/asdf.sh
fi
