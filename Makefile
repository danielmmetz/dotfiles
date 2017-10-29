help:
	@cat Makefile

all: data config

data: feh i3blocksdata

config: conky fish i3 i3blocks nvim sublime tmux xresources


conky:
	mkdir -p $(HOME)/.config/conky
	ln -sf $(DOTFILES)/config/conky/conkycal.conf $(HOME)/.config/conky/conkycal.conf
	ln -sf $(DOTFILES)/config/conky/conkytodo.conf $(HOME)/.config/conky/conkytodo.conf

fish:
	mkdir -p $(HOME)/.config/fish
	ln -sf $(DOTFILES)/config/fish/config.fish $(HOME)/.config/fish/config.fish
	ln -sf $(DOTFILES)/config/fish/functions/clearhosts.fish $(HOME)/.config/fish/functions/clearhosts.fish
	ln -sf $(DOTFILES)/config/fish/functions/clearswaps.fish $(HOME)/.config/fish/functions/clearswaps.fish
	ln -sf $(DOTFILES)/config/fish/functions/unrartv.fish $(HOME)/.config/fish/functions/unrartv.fish

git:
	ln -sf $(DOTFILES)/config/git/gitconfig $(HOME)/.gitconfig
	ln -sf $(DOTFILES)/.gitignore $(HOME)/.gitignore

i3:
	mkdir -p $(HOME)/.config/i3
	ln -sf $(DOTFILES)/config/i3/config $(HOME)/.config/i3/config

i3blocks:
	mkdir -p $(HOME)/.config/i3blocks
	ln -sf $(DOTFILES)/config/i3blocks/i3blocks.conf $(HOME)/.config/i3blocks/i3blocks.conf

nvim:
	mkdir -p $(HOME)/.config/nvim
	ln -sf $(DOTFILES)/config/nvim/init.vim $(HOME)/.config/nvim/init.vim

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
	ln -sf $(DOTFILES)/local/share/feh/wallpaper-grey.jpg $(HOME)/.local/share/feh/wallpaper-grey.jpg

i3blocksdata:
	mkdir -p $(HOME)/.local/share/i3blocks
	ln -sf $(DOTFILES)/local/share/i3blocks/bw $(HOME)/.local/share/i3blocks/bw
	ln -sf $(DOTFILES)/local/share/i3blocks/playerctl $(HOME)/.local/share/i3blocks/playerctl
