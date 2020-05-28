{ pkgs, ... }:

{
  enable = true;
  # enableAutosuggestions = true;  # TODO pair with an acceptable theme
  defaultKeymap = "emacs";
  history.ignoreDups = true;
  history.expireDuplicatesFirst = true;
  history.share = true;
  history.extended = true;
  history.size = 50000;
  sessionVariables = {
    DOTFILES = "$HOME/src/danielmmetz/dotfiles";
    EDITOR = "nvim";
    GOPATH = "$HOME/go";
    PATH = "$PATH:$GOPATH/bin:$HOME/bin";
    NIX_SH = "$HOME/.nix-profile/etc/profile.d/nix.sh";
  };
  shellAliases = {
    cat = "bat";
    la = "ls -la";
    ll = "ls -l";
    ls = "exa";
    vi = "nvim";
    vim = "nvim";
    vimrc = "cd $DOTFILES && nvim ./states/nixos/programs/neovim/neovim.nix && cd -$";
    zshrc = "cd $DOTFILES && nvim ./states/nixos/programs/zsh.nix && cd -$";


    deploys = "kubectl --kubeconfig ~/.kube/deploys.kubeconfig";
    deploysstaging = "kubectl --kubeconfig ~/.kube/deploysstaging.kubeconfig";
    omnicron-staging = "kubectl --kubeconfig ~/.kube/omnicron-staging.kubeconfig";
    omnicron-prod = "kubectl --kubeconfig ~/.kube/omnicron-prod.kubeconfig";
    cs0 = "kubectl --kubeconfig ~/.kube/core-staging-0.kubeconfig";
    cs1 = "kubectl --kubeconfig ~/.kube/core-staging-1.kubeconfig";
    cs2 = "kubectl --kubeconfig ~/.kube/core-staging-2.kubeconfig";
    cs3 = "kubectl --kubeconfig ~/.kube/core-staging-3.kubeconfig";
    cs4 = "kubectl --kubeconfig ~/.kube/core-staging-4.kubeconfig";
    cp0 = "kubectl --kubeconfig ~/.kube/core-prod-0.kubeconfig";
    cp1 = "kubectl --kubeconfig ~/.kube/core-prod-1.kubeconfig";
    cp2 = "kubectl --kubeconfig ~/.kube/core-prod-2.kubeconfig";
    cp3 = "kubectl --kubeconfig ~/.kube/core-prod-3.kubeconfig";
    cp4 = "kubectl --kubeconfig ~/.kube/core-prod-4.kubeconfig";
    infra = "kubectl --kubeconfig ~/.kube/infra.kubeconfig";
    infrastaging = "kubectl --kubeconfig ~/.kube/infrastaging.kubeconfig";
  };
  plugins = [
    {
      name = "zsh-completions";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-completions";
        rev = "0.31.0";
        sha256 = "0rw23m8cqxhcb4yjhbzb9lir60zn1xjy7hn3zv1fzz700f0i6fyk";
      };
    }
    {
      name = "zsh-history-substring-search";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-history-substring-search";
        rev = "v1.0.2";
        sha256 = "0y8va5kc2ram38hbk2cibkk64ffrabfv1sh4xm7pjspsba9n5p1y";
      };
    }
    {
      name = "zsh-syntax-highlighting";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-syntax-highlighting";
        rev = "0.6.0";
        sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
      };
    }
    {
      name = "pure-theme";
      src = pkgs.fetchFromGitHub {
        owner = "sindresorhus";
        repo = "pure";
        rev = "v1.11.0";
        sha256 = "0nzvb5iqyn3fv9z5xba850mxphxmnsiq3wxm1rclzffislm8ml1j";
      };
    }
  ];
  initExtra = ''
    if test -f "$NIX_SH"; then source "$NIX_SH"; fi

    autoload -U promptinit; promptinit
    prompt pure

    source ${pkgs.fzf}/share/fzf/completion.zsh
    source ${pkgs.fzf}/share/fzf/key-bindings.zsh
    eval "$(fasd --init auto)"

    if test -f ~/.credentials; then source $HOME/.credentials; fi

    eval "$(/opt/lyft/brew/bin/aactivator init)"
    source "$HOME/src/lyft/blessclient/lyftprofile"  # bless ssh alias
    source "$HOME/src/lyft/awsaccess/awsaccess2.sh"
    source "$HOME/src/lyft/awsaccess/oktaawsaccess.sh"
  '';
}
