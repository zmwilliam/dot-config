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

abbr gcm 'git commit -m'
abbr gs 'git status'
abbr gd 'git diff'
abbr gdc 'git diff --cached'
abbr glast 'git diff HEADˆ'
abbr ga 'git add'
abbr gp 'git push'
abbr gl 'git log --graph --date=short'
abbr gta 'go test ./...'

abbr vim nvim

set -gx EDITOR nvim
set -gx VISUAL nvim

set -x GOPATH $HOME/workspace/go
