# .dotfiles

personal dotfiles

## setup

```sh
git clone git@github.com:Rurs21/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./init.sh
./link.sh
```

`init.sh` installs the dependencies and plugin managers.

`link.sh` puts everything where it belongs and leaves existing files alone.

Optional macOS preferences:

```sh
./macos.sh
```

## notes

- Neovim uses the Vim config as its baseline, keeping Vim usable without maintaining the same config twice.
- Setup assumes Apple Silicon macOS. Intel chips mainly heat the room and occasionally manage to compute while draining the battery in record time.
- Some configs are old and untested. If they still work, cool.
