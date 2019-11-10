{ config, lib, pkgs, ... }:

{
  home.packages = [
    pkgs._1password
    pkgs.dnsutils
    pkgs.exa
    pkgs.fasd
    pkgs.fd
    pkgs.feh
    pkgs.firefox
    pkgs.fzf
    pkgs.git
    pkgs.gitAndTools.hub
    pkgs.gitAndTools.pre-commit
    pkgs.go
    pkgs.google-chrome
    pkgs.gparted
    pkgs.gron
    pkgs.htop
    pkgs.httpie
    pkgs.jq
    pkgs.kitty
    pkgs.lxappearance
    pkgs.neofetch
    pkgs.nodejs
    pkgs.pcmanfm
    pkgs.psmisc
    pkgs.python3
    pkgs.qgnomeplatform
    pkgs.ranger
    pkgs.ripgrep
    pkgs.silver-searcher
    pkgs.spotify
    pkgs.tldr
    pkgs.tree
    pkgs.wmctrl
    pkgs.xclip
    pkgs.yq
    pkgs.zsh

    pkgs.arc-theme
    pkgs.arc-icon-theme
    pkgs.nordic
    pkgs.nordic-polar
  ];

  programs.git = {
    enable = true;
    userName = "Daniel Metz";
    userEmail = "danielmmetz@gmail.com";
    extraConfig = {
      alias.hist = "log --pretty=format:'%h %ad | %s%d [%an]' --date=short --abbrev-commit";
      core.editor = "nvim";
      core.excludesfile = "~/.gitignore";
      hub.protocol = "ssh";
      url."ssh://git@github.com/".insteadOf = "https://github.com/";
    };
  };

  programs.neovim = import ./programs/neovim.nix pkgs;
  programs.zsh = import ./programs/zsh.nix pkgs;
  xdg.configFile."kitty/kitty.conf".source = ./programs/kitty.conf;

  services.redshift.enable = true;
  services.redshift.provider = "geoclue2";
  # services.redshift.tray = true;

  news.display = "silent";
  xsession.windowManager.i3 = import ./programs/i3/i3.nix { config = config; lib = lib; pkgs = pkgs; };
}
