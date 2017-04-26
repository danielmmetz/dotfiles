# dotfiles

## Arch Packages
```
pacaur
adobe-source-code-pro-fonts
arandr
arc-gtk-theme
arc-icon-theme
base16-git
cheat-git
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
skype
slack-desktop
smplayer
spotify
sublime-text-dev
transmission-cli
ttf-font-awesome
ttf-ubuntu-font-family
unrar
urxvt-resize-font-git
urxvt-vtwheel
vim
zathura
zathura-pdf-mupdf
```

## Brew Packages

## Fish Shell Plugins
```
fisher install simple done omf/fasd fzf gitignore omf/marlin transfer
set -U FZF_LEGACY_KEYBINDINGS 0
```

## Neovim Set-up
### Install vim-plug
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
### Install plugins
Inside vim:
```
:PlugInstall | PlugUpgrade
```

# TODO
  - [ ] write script to auto-symlink all configs
  - [ ] add brew packages
  - [ ] add transmission writeup

