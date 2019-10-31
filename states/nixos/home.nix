{ pkgs, ... }:

{
  home.packages = [
    pkgs._1password
    pkgs.dnsutils
    pkgs.exa
    pkgs.fasd
    pkgs.fd
    pkgs.firefox
    pkgs.fzf
    pkgs.git
    pkgs.gitAndTools.hub
    pkgs.go
    pkgs.google-chrome
    pkgs.htop
    pkgs.neofetch
    pkgs.neovim
    pkgs.python3
    pkgs.ranger
    pkgs.spotify
    pkgs.xclip
    pkgs.zsh
  ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Daniel Metz";
    userEmail = "danielmmetz@gmail.com";
    extraConfig = {
      url."ssh://git@github.com/".insteadOf = "https://github.com/";
      hub.protocol = "ssh";
    };
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    defaultKeymap = "emacs";
    history.ignoreDups = true;
    history.expireDuplicatesFirst = true;
    history.share = true;
    history.extended = true;
    history.size = 50000;
    sessionVariables = {
      GOPATH = "$HOME/go";
      PATH = "$PATH:$GOPATH/bin";
    };
    shellAliases = {
      la = "ls -la";
      ll = "ls -l";
      ls = "exa";
      vi = "nvim";
      vim = "nvim";
      vimrc = "nvim $HOME/.config/nvim/init.vim";
      homerc = "nvim $HOME/.config/nixpkgs/home.nix";
      nixosrc = "sudo nvim /etc/nixos/configuration.nix";
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
      autoload -U promptinit; promptinit
      prompt pure

      source ${pkgs.fzf}/share/fzf/completion.zsh
      source ${pkgs.fzf}/share/fzf/key-bindings.zsh
      eval "$(fasd --init auto)"

      if test -f ~/.credentials; then source $HOME/.credentials; fi
    '';
  };

  services.redshift.enable = true;
  services.redshift.provider = "geoclue2";
  services.redshift.tray = true;
}
