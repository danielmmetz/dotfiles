{ config, lib, pkgs, ... }:

{
  imports = [
    ./home-common.nix
    ./programs/pa-set-sink/pa-set-sink.nix
  ];

  home.packages = [
    pkgs.arandr
    pkgs.bat
    pkgs.dmenu
    pkgs.mpv
    pkgs.networkmanager_dmenu
    pkgs.pavucontrol
    pkgs.pcmanfm
    pkgs.playerctl
    pkgs.psmisc
    pkgs.rofi
    pkgs.slack
    pkgs.speedtest-cli
    pkgs.wmctrl
    pkgs.xautolock
    pkgs.xclip
    pkgs.xidlehook
    pkgs.xorg.xbacklight
    pkgs.xorg.xev
    pkgs.xss-lock
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
  services.redshift.enable = true;
  services.redshift.provider = "geoclue2";
  xsession.windowManager.i3 = import ./programs/i3/i3.nix { config = config; lib = lib; pkgs = pkgs; };
}
