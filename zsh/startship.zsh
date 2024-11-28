if command -v starship &> /dev/null; then
  export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
  export STARSHIP_LOG="error"
  eval "$(starship init zsh)"
fi
