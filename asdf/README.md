# Setup

asdf does not read global tool-versions from XDG base directory. [GH issue](https://github.com/asdf-vm/asdf/pull/1351).

Creating a symlink is necessary.

```sh
ln -s ~/.config/asdf/tool-versions ~/.tool-versions
```
