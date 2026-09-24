# Kanata keyboard mods

[Kanata github page](https://github.com/jtroo/kanata)

## Dependencies

[Karabiner-DriverKit-VirtualHIDDevice](https://github.com/pqrs-org/Karabiner-DriverKit-VirtualHIDDevice)

Install the standalone driver package (6.x or newer). Do **not** install Karabiner-Elements just for the driver — its bundled DriverKit (1.7.0) is too old for current kanata and Karabiner-Elements itself will fight kanata for the keyboard.

Download the latest `.pkg` from the [releases page](https://github.com/pqrs-org/Karabiner-DriverKit-VirtualHIDDevice/releases) and install it.

After install, activate the system extension:

```sh
sudo /Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Manager activate
```

macOS will prompt to allow the extension in **System Settings → General → Login Items & Extensions → Driver Extensions**. Approve it and reboot.

Verify with:

```sh
systemextensionsctl list | grep -i karabiner
```

You should see the extension `[activated enabled]`.

## Setup

### Install with Homebrew

```sh
brew install kanata
```

### Allow input monitoring

Allow Wezterm and Kanata to monitor input at "System Settings → Privacy & Security → Input Monitoring" ([example](https://github.com/jtroo/kanata/issues/1211#issuecomment-2327141671)).

### Start the VirtualHIDDevice daemon

The 6.x driver package does **not** install a LaunchDaemon, so the daemon must be started manually each boot before running kanata:

```sh
sudo "/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon" &
```

Without this, kanata will log `connect_failed asio.system:2` and the keyboard appears frozen (kanata grabs input but its output goes nowhere).

### Run Kanata

```sh
sudo kanata --cfg ~/.config/kanata/kanata.kbd
```

### Helper: `kanata-start`

A `kanata-start` zsh function in `~/.config/zsh/functions.zsh` starts the daemon (if not already running) and then kanata in one command.

## Troubleshooting

- **`IOHIDDeviceOpen error: exclusive access and device already open`** — another process is holding the keyboard. Check for leftover kanata processes (`pgrep -fl kanata`) or Karabiner-Elements (`pgrep -fl Karabiner`) and kill them.
- **Keyboard appears frozen / `connect_failed asio.system:2` in logs** — the VirtualHIDDevice daemon isn't running. Start it (see above).
- **Stale Karabiner-Elements install** — uninstall it if you don't need it; it auto-launches `karabiner_grabber` which conflicts with kanata.

## Startup Configuration

> Note: the bundled `com.github.jtroo.kanata.plist` is not currently used. Boot-time autostart is intentionally disabled.

To enable, edit the plist's `$REPLACE_WITH_HOME_PATH` and add a step to also start the VirtualHIDDevice daemon at boot, then:

```sh
sudo cp ~/.config/kanata/com.github.jtroo.kanata.plist /Library/LaunchDaemons/
sudo launchctl load /Library/LaunchDaemons/com.github.jtroo.kanata.plist
sudo launchctl start com.github.jtroo.kanata
```

## References

[Dreams of Code video](https://www.youtube.com/watch?v=sLWQ4Gx88h4)

[Dreams of Code github guide](https://github.com/dreamsofcode-io/home-row-mods/tree/main/kanata/macos)

[Kanata permission issue](https://github.com/jtroo/kanata/issues/1211)
