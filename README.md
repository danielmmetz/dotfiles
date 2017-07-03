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
  - [Package List](#package-list)
  - [Monitor Set-up](#monitor-set-up)
  - [Natural Scrolling](#natural-scrolling)
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
### Package List
```
pacaur
adobe-source-code-pro-fonts
arandr
arc-gtk-theme
arc-icon-theme
base16-git
cheat-git
ctags
dropbox
fasd
feh
fish
fisherman
google-chrome
htop
i3
i3blocks
lxappearance
mpv
ncdu
neovim-git
network-manager-applet
pa-applet
pcmanfm
playerctl
powerline-fonts
python2-neovim
python-neovim
ranger
redshift
ripgrep
ruby-neovim
rxvt-unicode
rxvt-unicode-terminfo
smplayer
spotify
transmission-cli
ttf-font-awesome
ttf-ubuntu-font-family
unrar
urxvt-resize-font-git
urxvt-vtwheel
zathura
zathura-pdf-mupdf
```

### Monitor Set-up
Add the following line at the top of your `~/.xinitrc` file.
```
xrandr --output DP-0 --primary --mode 1920x1200 --pos 0x0 --output HDMI-0 --mode 1920x1200 --pos 1920x0
```

### Natural Scrolling
Add the following line to the "pointer" block inside of `/usr/share/X11/xorg.conf.d/40-libinput.conf`:
```
    Option "NaturalScrolling" "true"
```

## MacOS Set-up
### Brew Packages
```
```


## TODO
  - [ ] add brew packages
  - [ ] add transmission writeup

