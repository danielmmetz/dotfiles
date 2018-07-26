set -x PIPENV_SHELL_FANCY 1
set -x DOTFILES $GOPATH/src/github.com/danielmmetz/dotfiles
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin /usr/local/sbin
set -x PYTHON_PATH /usr/bin/python3

if test -e $HOME/.credentials
    bass source $HOME/.credentials
end

if type -q exa
    alias ls exa
end
if type -q nvim
    alias vi nvim
end
alias vim vi
alias vimrc "vi $HOME/.config/nvim/init.vim"
set fish_greeting ""

set -x WORKSPACE $GOPATH/src/github.com/lyft
alias sync $WORKSPACE/hacktools/sync-to-onebox-v3.sh
if test -e $WORKSPACE/blessclient/lyftprofile
    bass source $WORKSPACE/blessclient/lyftprofile
end
