# Kanata keyboard mods

[Kanata github page](https://github.com/jtroo/kanata)

## Dependencies

[Karabiner VirtualHiDDevice Driver](https://github.com/pqrs-org/Karabiner-DriverKit-VirtualHIDDevice)

The easiest way to install the driver is installing [Karabiner Elements 14](https://github.com/pqrs-org/Karabiner-Elements/releases/tag/v14.13.0)

## Setup

### Install with Homebrew

```sh
brew install kanata
```

### Manual Install

Download kanata_macos_arm84 at [releases page](https://github.com/jtroo/kanata/releases/tag/v1.7.0)

Copy executable to bin folder

```sh
cp ~/Downloads/kanata_macos_arm64 ~/.local/bin/kanata

```

Give executable permission

```sh
chmod u+x ~/.local/bin/kanata
```

### Allow input monitoring

Allow Wezterm and Kanata to monitor input at "System Settings -> Input Monitoring" ([example](https://github.com/jtroo/kanata/issues/1211#issuecomment-2327141671))

### Run Kanata

```sh
sudo kanata --cfg ~/.config/kanata/kanata.kbd
```

## Startup Configuration

Update plist file with the correct paths.

Copy plist this file to your LaunchDaemon folder.

```sh
sudo cp ~/.config/kanata/com.github.jtroo.kanata.plist /Library/LaunchDaemons/
```

Once copied over, you can then load it using sudo

```sh
sudo launchctl load /Library/LaunchDaemons/com.github.jtroo.kanata.plist
```

```sh
sudo launchctl start com.github.jtroo.kanata
```

Now, kanata should be running whenever your macbook starts up!

## References

[Dreams of Code video](https://www.youtube.com/watch?v=sLWQ4Gx88h4)

[Dreams of Code github guide](https://github.com/dreamsofcode-io/home-row-mods/tree/main/kanata/macos)

[Kanata permission issue](https://github.com/jtroo/kanata/issues/1211)
