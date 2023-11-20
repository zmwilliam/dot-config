export EDITOR=nvim
export VISUAL=nvim
export NVIM_APPNAME=astro-nvim

export GOPATH=$HOME/workspace/go
export PATH=$GOPATH/bin:$PATH

export ABBR_USER_ABBREVIATIONS_FILE=$HOME/.config/zsh/abbreviations

if command -v erl &> /dev/null; then
  export ERL_AFLAGS="-kernel shell_history enabled"
fi
