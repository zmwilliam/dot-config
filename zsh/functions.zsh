function gi() { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@ ;}

function kanata-start() {
  local daemon="/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon"
  if ! pgrep -f Karabiner-VirtualHIDDevice-Daemon >/dev/null; then
    sudo "$daemon" &!
    sleep 1
  fi
  sudo kanata --cfg ~/.config/kanata/kanata.kbd
}
