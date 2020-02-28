{ config, lib, pkgs, ... }:

{
  imports = [
    ./home-common.nix
    ./home-lyft.nix
    ./programs/pa-set-sink/pa-set-sink.nix
  ];

  home.packages = [
    pkgs.acpilight
    pkgs.arandr
    pkgs.autorandr
    pkgs.bc
    pkgs.brightnessctl
    pkgs.calibre
    pkgs.compton
    pkgs.dmenu
    pkgs.firefox
    pkgs.gcc
    pkgs.gitAndTools.pre-commit
    pkgs.gnumake
    pkgs.go
    pkgs.google-chrome
    pkgs.gptfdisk
    pkgs.networkmanager_dmenu
    pkgs.pavucontrol
    pkgs.pcmanfm
    pkgs.playerctl
    pkgs.psmisc
    pkgs.rofi
    pkgs.speedtest-cli
    pkgs.spotify
    pkgs.usbutils
    pkgs.wmctrl
    pkgs.xautolock
    pkgs.xclip
    pkgs.xidlehook
    pkgs.xorg.xev
    pkgs.xss-lock
    (pkgs.zathura.override { useMupdf = true; })
  ];

  gtk = {
    enable = true;
    iconTheme = {
      name = "Arc";
      package = pkgs.arc-icon-theme;
    };
    theme = {
      name = "Arc";
      package = pkgs.arc-theme;
    };
  };


  programs.pa-set-sink.enable = true;
  programs.zsh.shellAliases = {
    homerc = "cd $DOTFILES && nvim ./states/nixos/home-nixos.nix && cd -$";
    nixosrc = "cd $DOTFILES && sudo nvim ./states/nixos/configuration.nix && cd -$";
  };

  services.polybar = import ./programs/polybar.nix { config = config; lib = lib; pkgs = pkgs; };
  xsession.windowManager.i3 = import ./programs/i3/i3.nix { config = config; lib = lib; pkgs = pkgs; };

  xdg.configFile."pip/pip.conf".text = ''
    [global]
    extra-index-url = https://pypi.lyft.net/pypi/
  '';
}
