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
abbr tsd 'tmux attach -t default ;or tmux new -s default'
abbr bi 'brew install'
abbr bs 'brew search'

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

set -gx GOPATH $HOME/workspace/go
set -g fish_user_paths $GOPATH/bin $fish_user_paths

set -gx GRAALVM_HOME $HOME/graalvm-ce-1.0.0-rc13/Contents/Home

if test -f $HOME/.config/fish/config.secret.fish
  source $HOME/.config/fish/config.secret.fish 
end

if test (which asdf)
  source /usr/local/opt/asdf/asdf.fish
end

if test (which tmux) 
  and status is-interactive 
  and not set -q TMUX
    eval tmux attach -t default ;or tmux new -s default
end

set -g fish_user_paths "/usr/local/opt/erlang@22/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/libpq/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.local/bin" $fish_user_paths

set -gx GPG_TTY (tty)

set -gx STARSHIP_CONFIG $HOME/.config/fish/starship.toml
starship init fish | source
