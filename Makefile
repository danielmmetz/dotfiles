help:
	@cat Makefile

all: config data

config: conky fish i3 i3blocks nvim sublime tmux xresources

data: feh i3blocksdata

conky:
	ln -sf $(HOME)/src/dotfiles/config/conky/conkycal.conf $(HOME)/.config/conky/conkycal.conf
	ln -sf $(HOME)/src/dotfiles/config/conky/conkytodo.conf $(HOME)/.config/conky/conkytodo.conf

fish:
	ln -sf $(HOME)/src/dotfiles/config/fish/config.fish $(HOME)/.config/fish/config.fish
	ln -sf $(HOME)/src/dotfiles/config/fish/functions/clearhosts.fish $(HOME)/.config/fish/functions/clearhosts.fish

i3:
	ln -sf $(HOME)/src/dotfiles/config/i3/config $(HOME)/.config/i3/config

i3blocks:
	ln -sf $(HOME)/src/dotfiles/config/i3blocks/i3blocks.conf $(HOME)/.config/i3blocks/i3blocks.conf

nvim:
	ln -sf $(HOME)/src/dotfiles/config/nvim/init.vim $(HOME)/.config/nvim/init.vim

sublime:
	ln -sf $(HOME)/src/dotfiles/config/sublime-text-3/Packages/User/Preferences.sublime-settings $(HOME)/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

tmux:
	ln -sf $(HOME)/src/dotfiles/config/tmux/tmux.conf $(HOME)/.tmux.conf

xresources:
	ln -sf $(HOME)/src/dotfiles/config/Xresources/Xresources $(HOME)/.Xresources

feh:
	ln -sf $(HOME)/src/dotfiles/local/share/feh/wallpaper-grey.jpg $(HOME)/.local/share/feh/wallpaper-grey.jpg

i3blocksdata:
	ln -sf $(HOME)/src/dotfiles/local/share/i3blocks/bw $(HOME)/.local/share/i3blocks/bw
