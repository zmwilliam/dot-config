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

set -gx EDITOR nvim
set -gx VISUAL nvim

set -x GOPATH $HOME/workspace/go

set -x HOMEBREW_GITHUB_API_TOKEN 8987912df0b55e31928286c7836e94316a8a07e0

add_to_user_path $GOPATH/bin

if test -f $HOME/.config/fish/config.secret.fish
  source $HOME/.config/fish/config.secret.fish 
end

#if test ! (which node)
#  and test (which nave)
#    nave use latest
#end

if test (which asdf)
  source /usr/local/opt/asdf/asdf.fish
end

if test (which tmux) 
  and status is-interactive 
  and not set -q TMUX
    eval tmux attach -t default ;or tmux new -s default
end

