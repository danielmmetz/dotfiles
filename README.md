# Dotfiles

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [OS Agnostic](#os-agnostic)
  - [Fish Shell Plugins](#fish-shell-plugins)
  - [Neovim Set-up](#neovim-set-up)
    - [Install vim-plug](#install-vim-plug)
    - [Install Plugins](#install-plugins)
- [Arch Set-up](#arch-set-up)
- [MacOS Set-up](#macos-set-up)
  - [Brew Packages](#brew-packages)
- [TODO](#todo)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## OS Agnostic
### Fish Shell Plugins
```
fisher install gitignore omf/fasd fzf simnalamburt/shellder
set -U FZF_LEGACY_KEYBINDINGS 0
```

### Neovim Set-up
#### Install vim-plug
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
#### Install Plugins
Inside neovim:
```
:PlugInstall | PlugUpgrade
```

## Arch Set-up
See [Arch Set-up](https://www.github.com/danielmmetz/dotfiles/blob/master/docs/arch.md)

## MacOS Set-up
### Brew Packages
```
```


## TODO
  - [ ] add brew packages

