help:
	@cat Makefile

all: data config

data: feh i3blocksdata

config: conky i3 i3blocks sublime tmux xresources

conky:
	mkdir -p $(HOME)/.config/conky
	ln -sf $(DOTFILES)/config/conky/conkycal.conf $(HOME)/.config/conky/conkycal.conf
	ln -sf $(DOTFILES)/config/conky/conkytodo.conf $(HOME)/.config/conky/conkytodo.conf

i3:
	mkdir -p $(HOME)/.config/i3
	ln -sf $(DOTFILES)/config/i3/config $(HOME)/.config/i3/config

i3blocks:
	mkdir -p $(HOME)/.config/i3blocks
	ln -sf $(DOTFILES)/config/i3blocks/i3blocks.conf $(HOME)/.config/i3blocks/i3blocks.conf

sublime:
	mkdir -p $(HOME)/.config/sublime-text-3/Packages/User
	ln -sf $(DOTFILES)/config/sublime-text-3/Packages/User/Preferences.sublime-settings $(HOME)/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

tmux:
	mkdir -p $(HOME)
	ln -sf $(DOTFILES)/config/tmux/tmux.conf $(HOME)/.tmux.conf

xresources:
	mkdir -p $(HOME)
	ln -sf $(DOTFILES)/config/Xresources/Xresources $(HOME)/.Xresources

feh:
	mkdir -p $(HOME)/.local/share/feh
	ln -f $(DOTFILES)/local/share/feh/wallpaper-grey.jpg $(HOME)/.local/share/feh/wallpaper-grey.jpg

i3blocksdata:
	mkdir -p $(HOME)/.local/share/i3blocks
	ln -sf $(DOTFILES)/local/share/i3blocks/bw $(HOME)/.local/share/i3blocks/bw
	ln -sf $(DOTFILES)/local/share/i3blocks/playerctl $(HOME)/.local/share/i3blocks/playerctl
