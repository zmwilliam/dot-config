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
abbr av 'NVIM_APPNAME=astro-nvim nvim'

abbr tsd 'tmux attach -t default ;or tmux new -s default'
abbr bi 'brew install'
abbr bs 'brew search'
abbr bic 'brew install --cask'

if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
  alias llt "ll --tree -a"
end

if type -q nerdctl
  alias docker "nerdctl"
end

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx NVIM_APPNAME astro-nvim

set -gx GOPATH $HOME/workspace/go
fish_add_path $GOPATH/bin 

if test -f $HOME/.config/fish/config.secret.fish
  source $HOME/.config/fish/config.secret.fish 
end

if test (which asdf)
  source /opt/homebrew/opt/asdf/libexec/asdf.fish
end

#Theme/colorscheme
source $HOME/.config/fish/themes/tokyonight.fish
#fish_config theme choose "Rose Pine Moon"

# if type -q tmux
#   and status is-interactive 
#   and not set -q TMUX
#     eval tmux attach -t default ;or tmux new -s default
# end

if type -q erl
  set -gx ERL_AFLAGS "-kernel shell_history enabled"
end

fish_add_path "/usr/local/opt/erlang@22/bin" 
fish_add_path "/usr/local/opt/libpq/bin" 
fish_add_path "$HOME/.local/bin" 
fish_add_path "/usr/local/sbin"
fish_add_path "/opt/homebrew/bin"

set -gx GPG_TTY (tty)

set -gx STARSHIP_CONFIG $HOME/.config/fish/starship.toml
set -gx STARSHIP_LOG "error"
starship init fish | source
