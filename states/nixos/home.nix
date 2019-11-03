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
    pkgs.nodejs
    pkgs.python3
    pkgs.ranger
    pkgs.ripgrep
    pkgs.silver-searcher
    pkgs.spotify
    pkgs.tree
    pkgs.xclip
    pkgs.zsh
  ];

  programs.home-manager.enable = true;

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

  programs.neovim = (import ./programs/neovim.nix) pkgs;
  programs.zsh = (import ./programs/zsh.nix) pkgs;

  services.redshift.enable = true;
  services.redshift.provider = "geoclue2";
  services.redshift.tray = true;
}
