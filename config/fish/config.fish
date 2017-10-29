set -x GOPATH $HOME/go
set -x DOTFILES $GOPATH/src/github.com/danielmmetz/dotfiles
set -x WORKSPACE $GOPATH/src/github.com/lyft
set -x PATH $PATH $GOPATH/bin

alias vi nvim
alias vim nvim
alias vimrc "nvim $HOME/.config/nvim/init.vim"
