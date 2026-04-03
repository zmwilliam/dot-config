# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/functions.zsh"

plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "jeffreytse/zsh-vi-mode"
plug "$HOME/.config/zsh/startship.zsh"

function zvm_after_init(){
  plug "zap-zsh/fzf"
}

if type brew &>/dev/null; then
  plug "$(brew --prefix)/share/zsh-abbr/zsh-abbr.zsh"
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# Load and initialise completion system
autoload -Uz compinit
compinit

if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

if command -v asdf &> /dev/null; then
  . /opt/homebrew/opt/asdf/libexec/asdf.sh
fi

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

if command -v wt >/dev/null 2>&1; then 
  eval "$(command wt config shell init zsh)"
fi
