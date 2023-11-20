if command -v eza &> /dev/null; then
  alias lla="ll -a"
  alias llt="ll --tree -a"
fi

if command -v podman &> /dev/null; then
  alias docker="podman"
fi
