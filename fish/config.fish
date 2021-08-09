set -g fish_key_bindings fish_vi_key_bindings
set -g theme_display_docker_machine no
set -g theme_display_vi yes
set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g default_user your_normal_user
set -g theme_color_scheme gruvbox
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_ruby no
set -x LC_ALL en_US.UTF-8

set -g SPACEFISH_PACKAGE_SHOW false
set -g SPACEFISH_NODE_SHOW false
set -g SPACEFISH_DOCKER_SHOW false
set -g SPACEFISH_ELIXIR_SHOW false
set -g SPACEFISH_GOLANG_SHOW false

abbr gcm 'git commit -m'
abbr gs 'git status'
abbr gd 'git diff'
abbr gdc 'git diff --cached'
abbr glast 'git diff HEADˆ'
abbr ga 'git add'
abbr gp 'git push'
abbr gl 'git log --graph --date=short'
abbr glc 'git log --pretty=format:"%h %cr %cn %Cgreen%s%Creset" --name-status'
abbr gta 'go test ./...'
abbr vim nvim
abbr tsd 'tmux attach -t default ;or tmux new -s default'
if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
  alias llt "ll --tree -a"
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

set -gx GPG_TTY (tty)
