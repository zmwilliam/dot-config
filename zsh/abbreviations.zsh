# Git
abbr gcm="git commit -m"
abbr gs="git status"
abbr gd="git diff"
abbr gdc="git diff --cached"
abbr gds="git diff --shortstat"
abbr glast="git diff HEADˆ"
abbr ga="git add"
abbr gp="git push"
abbr gpl="git pull"
abbr gl="git log --graph --date=short"
abbr glc="git log --pretty=format:\"%h %cr %cn %Cgreen%s%Creset\" --name-status"

# Neovim
abbr v="nvim"
abbr vim="nvim"
abbr lv="NVIM_APPNAME=lazyvim nvim"

# Homebrew
abbr bi="brew install"
abbr bs="brew search"
abbr bic="brew install --cask"

# Docker / Podman

if command -v podman &> /dev/null; then
  abbr docker="podman"
fi

abbr dc="docker compose"

# Eza
abbr lla="ll -a"
abbr llt="ll --tree -a"
