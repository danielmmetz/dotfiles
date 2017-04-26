help:
	@cat Makefile

all: config data

config: conky fish i3 i3blocks nvim sublime tmux xresources

data: feh i3blocksdata

conky:
	ln -s ./config/conky/conkycal.conf $(HOME)/.config/conky/conkycal.conf
	ln -s ./config/conky/conkytodo.conf $(HOME)/.config/conky/conkytodo.conf

fish:
	ln -s ./config/fish/config.fish $(HOME)/.config/fish/config.fish
	ln -s ./config/fish/functions/clearhosts.fish $(HOME)/.config/fish/functions/clearhosts.fish

i3:
	ln -s ./config/i3/config $(HOME)/.config/i3/config

i3blocks:
	ln -s ./config/i3blocks/i3blocks.conf $(HOME)/.config/i3blocks/i3blocks.conf

nvim:
	ln -s ./config/nvim/init.vim $(HOME)/.config/nvim/init.vim

sublime:
	ln -s ./config/sublime-text-3/Packages/User/Preferences.sublime-settings $(HOME)/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

tmux:
	ln -s ./config/tmux/tmux.conf $(HOME)/.tmux.conf

xresources:
	ln -s ./config/Xresources/Xresources $(HOME)/.Xresources

feh:
	ln -s ./local/share/feh/wallpaper-grey.jpg $(HOME)/.local/share/feh/wallpaper-grey.jpg

i3blocksdata:
	ln -s ./local/share/i3blocks/bw $(HOME)/.local/share/i3blocks/bw
