# Usage

## Dotfiles

[Create SSH key and add to Github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

Clone config repo

```sh
git clone git@github.com:zmwilliam/dot-config.git ~/.config/
```

## Homebrew

Install [Homebrew](https://brew.sh)

Add brew Homebrew to PATH

Run brew bundle

```sh
brew bundle --file=~/.config/homebrew/Brewfile
```

## Shell / ZSH

Install [Zap](https://github.com/zap-zsh/zap)

Symlink zshrc

```sh
ln -s ~/.config/zsh/.zshrc ~/.zshrc
```

Synlink tool-versions

```sh
ln -s ~/.config/asdf/tool-versions ~/.tool-versions
```


## Mac defaults

Run .macos script
```sh
chmod +x ~/.macos && ./.macos
```

## Obsidian

Create vault synlink
```sh
ln -s $HOME/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents $HOME/Obsidian
```


## Manual Config

Accessibility
- Enable Reduce Motion
- Enable Reduce Transparency

Trackpad
- Enable Tap to click
- Swipe Down with 3 Fingers to App Exposé

Keyboard
- Disable Input Sources Shortcuts
- Disable Spotlight Shortcuts
- Configure Input Source to "U.S."

App Store
- Bitwarden
