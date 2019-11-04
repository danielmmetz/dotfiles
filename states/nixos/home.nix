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
    pkgs.gitAndTools.pre-commit
    pkgs.go
    pkgs.google-chrome
    pkgs.htop
    pkgs.httpie
    pkgs.neofetch
    pkgs.nodejs
    pkgs.psmisc
    pkgs.python3
    pkgs.ranger
    pkgs.ripgrep
    pkgs.silver-searcher
    pkgs.spotify
    pkgs.tree
    pkgs.xclip
    pkgs.zsh
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

  programs.neovim = (import ./programs/neovim.nix) pkgs;
  programs.zsh = (import ./programs/zsh.nix) pkgs;

  services.redshift.enable = true;
  services.redshift.provider = "geoclue2";
  services.redshift.tray = true;

  xdg.configFile."kcminputrc".source = ./programs/kde/kcminputrc;
  xdg.configFile."kglobalshortcutsrc".source = ./programs/kde/kglobalshortcutsrc;
  xdg.configFile."konsolerc".source = ./programs/kde/konsolerc;
  xdg.dataFile."konsole/Nordic.colorscheme".source = ./programs/kde/Nordic.colorscheme;
  xdg.dataFile."konsole/Profile.profile".source = ./programs/kde/Profile.profile;
}
