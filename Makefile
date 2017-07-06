help:
	@cat Makefile

all: config data

config: conky fish i3 i3blocks nvim sublime tmux xresources

data: feh i3blocksdata

conky:
	mkdir -p $(HOME)/.config/conky
	ln -sf $(HOME)/go/src/github.com/danielmmetz/dotfiles/config/conky/conkycal.conf $(HOME)/.config/conky/conkycal.conf
	ln -sf $(HOME)/go/src/github.com/danielmmetz/dotfiles/config/conky/conkytodo.conf $(HOME)/.config/conky/conkytodo.conf

fish:
	mkdir -p $(HOME)/.config/fish
	ln -sf $(HOME)/go/src/github.com/danielmmetz/dotfiles/config/fish/config.fish $(HOME)/.config/fish/config.fish
	ln -sf $(HOME)/go/src/github.com/danielmmetz/dotfiles/config/fish/functions/clearhosts.fish $(HOME)/.config/fish/functions/clearhosts.fish
	ln -sf $(HOME)/go/src/github.com/danielmmetz/dotfiles/config/fish/functions/clearswaps.fish $(HOME)/.config/fish/functions/clearswaps.fish
	ln -sf $(HOME)/go/src/github.com/danielmmetz/dotfiles/config/fish/functions/unrartv.fish $(HOME)/.config/fish/functions/unrartv.fish

i3:
	mkdir -p $(HOME)/.config/i3
	ln -sf $(HOME)/go/src/github.com/danielmmetz/dotfiles/config/i3/config $(HOME)/.config/i3/config

i3blocks:
	mkdir -p $(HOME)/.config/i3blocks
	ln -sf $(HOME)/go/src/github.com/danielmmetz/dotfiles/config/i3blocks/i3blocks.conf $(HOME)/.config/i3blocks/i3blocks.conf

nvim:
	mkdir -p $(HOME)/.config/nvim
	ln -sf $(HOME)/go/src/github.com/danielmmetz/dotfiles/config/nvim/init.vim $(HOME)/.config/nvim/init.vim

sublime:
	mkdir -p $(HOME)/.config/sublime-text-3/Packages/User
	ln -sf $(HOME)/go/src/github.com/danielmmetz/dotfiles/config/sublime-text-3/Packages/User/Preferences.sublime-settings $(HOME)/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

tmux:
	mkdir -p $(HOME)
	ln -sf $(HOME)/go/src/github.com/danielmmetz/dotfiles/config/tmux/tmux.conf $(HOME)/.tmux.conf

xresources:
	mkdir -p $(HOME)
	ln -sf $(HOME)/go/src/github.com/danielmmetz/dotfiles/config/Xresources/Xresources $(HOME)/.Xresources

feh:
	mkdir -p $(HOME)/.local/share/feh
	ln -sf $(HOME)/go/src/github.com/danielmmetz/dotfiles/local/share/feh/wallpaper-grey.jpg $(HOME)/.local/share/feh/wallpaper-grey.jpg

i3blocksdata:
	mkdir -p $(HOME)/.local/share/i3blocks
	ln -sf $(HOME)/go/src/github.com/danielmmetz/dotfiles/local/share/i3blocks/bw $(HOME)/.local/share/i3blocks/bw
	ln -sf $(HOME)/go/src/github.com/danielmmetz/dotfiles/local/share/i3blocks/playerctl $(HOME)/.local/share/i3blocks/playerctl
