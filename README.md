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

## Monitor Set-up
Add the following line at the top of your `~/.xinitrc` file.
```
xrandr --output DP-0 --primary --mode 1920x1200 --pos 0x0 --output HDMI-0 --mode 1920x1200 --pos 1920x0
```

## Brew Packages

## Fish Shell Plugins
```
fisher install gitignore omf/fasd fzf simnalamburt/shellder
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

