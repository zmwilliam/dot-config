set -g fish_key_bindings fish_vi_key_bindings

set -x LC_ALL en_US.UTF-8

abbr gcm 'git commit -m'
abbr gs 'git status'
abbr gd 'git diff'
abbr gdc 'git diff --cached'
abbr glast 'git diff HEADˆ'
abbr ga 'git add'
abbr gp 'git push'
abbr gl 'git log --graph --date=short'
abbr glc 'git log --pretty=format:"%h %cr %cn %Cgreen%s%Creset" --name-status'

abbr vim 'nvim'
abbr v 'nvim'

abbr tsd 'tmux attach -t default ;or tmux new -s default'
abbr bi 'brew install'
abbr bs 'brew search'
abbr bic 'brew install --cask'

if type -q eza
  alias ll "eza -l -g --icons"
  alias lla "ll -a"
  alias llt "ll --tree -a"
else
  echo (set_color yellow)WARNING:(set_color normal) eza(set_color normal) not found
end

set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx GOPATH $HOME/workspace/go
fish_add_path $GOPATH/bin

if test -f $HOME/.config/fish/config.secret.fish
  source $HOME/.config/fish/config.secret.fish
end

if type -q asdf
  source (brew --prefix)/opt/asdf/libexec/asdf.fish
else
  echo (set_color yellow)WARNING:(set_color normal) asdf not found
end

#Theme/colorscheme
source $HOME/.config/fish/themes/tokyonight.fish

if type -q erl
  set -gx ERL_AFLAGS "-kernel shell_history enabled"
end

fish_add_path "/usr/local/opt/erlang@22/bin"
fish_add_path "/usr/local/opt/libpq/bin"
fish_add_path "$HOME/.local/bin"
fish_add_path "/usr/local/sbin"
fish_add_path "/opt/homebrew/bin"

set -gx GPG_TTY (tty)

if type -q direnv
  direnv hook fish | source
else
  echo (set_color yellow)WARNING:(set_color normal) direnv not found
end

if type -q starship
  set -gx STARSHIP_CONFIG $HOME/.config/fish/starship.toml
  set -gx STARSHIP_LOG "error"
  starship init fish | source
else
  echo (set_color red)ERROR:(set_color normal) starship not found
end
