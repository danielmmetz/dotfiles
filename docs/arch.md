# Arch Set-up

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Package List](#package-list)
- [Monitor Set-up](#monitor-set-up)
- [Natural Scrolling](#natural-scrolling)
- [Mount Points](#mount-points)
- [Transmission Daemon Set-up](#transmission-daemon-set-up)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Package List
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

## Natural Scrolling
Add the following line to the "pointer" block inside of `/usr/share/X11/xorg.conf.d/40-libinput.conf`:
```
Option "NaturalScrolling" "true"
```

## Mount Points
Add the following line to your `/etc/fstab` file.
```
UUID=0edcd222-d30a-4c0c-98a9-316232fe450b /media         ext4    defaults,noatime,discard 0 0
```

## Transmission Daemon Set-up
### Enable the daemon at start-up
Enable the transmission daemon. When complete, verify success by visiting `localhost:9091/transmission/web/`.
```
systemctl enable transmission
systemctl start transmission
```

### Settings
The daemon overrwites settings at close. To manually overwrite the settings, we need to stop it first.
```
systemctl stop transmission
```

Tweak the following lines in `/var/lib/transmission/.config/transmission-daemon/settings.json`:
```
"alt-speed-down": 750,
"alt-speed-up": 200,
"dht-enabled": false,
"download-dir": "/media/seed",
"peer-port-random-on-start": true,
"pex-enabled": false,
"trash-original-torrent-files": true,
"watch-dir": "/home/daniel/Downloads/",
"watch-dir-enabled": true
```

When done, start the daemon again.
```
systemctl start transmission
```

Give read permissions to the user `transmission` to watch the downloads folder.
```
setfacl -m g:transmission:x ~
setfacl -m g:transmission:wrx ~/Downloads
```
