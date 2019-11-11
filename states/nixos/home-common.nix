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
}
