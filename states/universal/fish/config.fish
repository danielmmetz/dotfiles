set -x GOPATH $HOME/go
set -x DOTFILES $GOPATH/src/github.com/danielmmetz/dotfiles
set -x PATH $PATH $GOPATH/bin /usr/local/sbin
set -x PIPENV_SHELL_FANCY 1
set -x TERMINAL alacritty

if test -e $HOME/.credentials
    bass source $HOME/.credentials
end

alias ls exa
alias vi nvim
alias vim nvim
alias vimrc "nvim $HOME/.config/nvim/init.vim"
set fish_greeting ""
