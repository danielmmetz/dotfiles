help:
	@cat Makefile

all: config data

config: conky fish i3 i3blocks nvim sublime tmux xresources

data: feh i3blocksdata

conky:
	ln -srf ./config/conky/conkycal.conf $(HOME)/.config/conky/conkycal.conf
	ln -srf ./config/conky/conkytodo.conf $(HOME)/.config/conky/conkytodo.conf

fish:
	ln -srf ./config/fish/config.fish $(HOME)/.config/fish/config.fish
	ln -srf ./config/fish/functions/clearhosts.fish $(HOME)/.config/fish/functions/clearhosts.fish

i3:
	ln -srf ./config/i3/config $(HOME)/.config/i3/config

i3blocks:
	ln -srf ./config/i3blocks/i3blocks.conf $(HOME)/.config/i3blocks/i3blocks.conf

nvim:
	ln -srf ./config/nvim/init.vim $(HOME)/.config/nvim/init.vim

sublime:
	ln -srf ./config/sublime-text-3/Packages/User/Preferences.sublime-settings $(HOME)/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

tmux:
	ln -srf ./config/tmux/tmux.conf $(HOME)/.tmux.conf

xresources:
	ln -srf ./config/Xresources/Xresources $(HOME)/.Xresources

feh:
	ln -srf ./local/share/feh/wallpaper-grey.jpg $(HOME)/.local/share/feh/wallpaper-grey.jpg

i3blocksdata:
	ln -srf ./local/share/i3blocks/bw $(HOME)/.local/share/i3blocks/bw
