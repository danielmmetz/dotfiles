{ config, lib, pkgs, ... }:

{
  home.packages = [
    pkgs._1password
    pkgs.bat
    pkgs.dnsutils
    pkgs.exa
    pkgs.fasd
    pkgs.fd
    pkgs.feh
    pkgs.font-awesome
    pkgs.fzf
    pkgs.git
    pkgs.gitAndTools.hub
    pkgs.gron
    pkgs.htop
    pkgs.httpie
    pkgs.icdiff
    pkgs.jq
    pkgs.kitty
    pkgs.mpv
    pkgs.ncdu
    pkgs.neofetch
    pkgs.python3
    pkgs.ranger
    pkgs.ripgrep
    pkgs.silver-searcher
    pkgs.source-code-pro
    pkgs.tldr
    pkgs.tree
    pkgs.ubuntu_font_family
    pkgs.unzip
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
      branch.autosetuprebase = "always";
      core.editor = "nvim";
      core.excludesfile = "~/.gitignore";
      hub.protocol = "ssh";
      url."ssh://git@github.com/".insteadOf = "https://github.com/";
    };
  };

  programs.neovim = import ./programs/neovim/neovim.nix pkgs;
  programs.zsh = import ./programs/zsh.nix pkgs;
  xdg.configFile."kitty/kitty.conf".source = ./programs/kitty.conf;
  xdg.configFile."nvim/coc-settings.json".source = ./programs/neovim/coc-settings.json;
}
