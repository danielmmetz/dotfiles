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
    pkgs.gron
    pkgs.htop
    pkgs.httpie
    pkgs.jq
    pkgs.kitty
    pkgs.neofetch
    pkgs.nodejs
    pkgs.python3
    pkgs.ranger
    pkgs.ripgrep
    pkgs.silver-searcher
    pkgs.spotify
    pkgs.tldr
    pkgs.tree
    pkgs.yq
    pkgs.zsh

    pkgs.pcmanfm
    pkgs.psmisc
    pkgs.xclip
    pkgs.wmctrl

    pkgs.lxappearance
    pkgs.arc-theme
    pkgs.arc-icon-theme
    pkgs.nordic
    pkgs.nordic-polar
  ];

  news.display = "silent";

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
  xsession.windowManager.i3 = import ./programs/i3/i3.nix { config = config; lib = lib; pkgs = pkgs; };
}
